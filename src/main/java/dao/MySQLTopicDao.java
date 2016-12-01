package dao;

import org.apache.log4j.Logger;
import pojo.Forum;
import pojo.Topic;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Артем on 09.11.2016.
 */
public class MySQLTopicDao extends MySqlDao implements TopicDao {
    static Logger log = Logger.getLogger(MySQLForumDao.class);

    @Override
    public void createTopic(Topic topic) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("INSERT  INTO topics" + "(titleOfTopic, message, authorOfMessage, forum_id, messageOfTopic)"
                    + "VALUES(?,?,?,?,?)");
            stmt.setString(1, topic.getTitleOfTopic());
            stmt.setString(2, topic.getMessage());
            stmt.setString(3, topic.getAuthorOfMessage());
//            stmt.setDate(4, (Date) topic.getDateOfCreate());
//            stmt.setDate(4, (Date) topic.getDateOfUpdate());
            stmt.setInt(4, topic.getForum_id());
            stmt.setString(5, topic.getMessageOfTopic());
            stmt.execute();
            log.debug("createTopic performed success");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            //log.error("Addition of new comment failed " + e.getLocalizedMessage());
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Topic getTopicById(int topicId) {
        String sql = "SELECT * FROM topics WHERE topicID = ?";
        log.info("getTopicByID - связь с БД");
        Topic s = null;
        PreparedStatement stm = null;
        Connection con = getConnection();
        try {
            stm = con.prepareStatement(sql);
            stm.setInt(1, topicId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s = new Topic();
                s.setTopicID(rs.getInt("topicID"));
                //s.setTagOfTopic(rs.getArray(""));
                s.setForum_id(rs.getInt("forum_id"));
                s.setTitleOfTopic(rs.getString("titleOfTopic"));
                s.setMessage(rs.getString("message"));
                s.setMessageOfTopic(rs.getString("messageOfTopic"));
                s.setAuthorOfMessage(rs.getString("authorOfMessage"));
                s.setDateOfCreate(rs.getDate("dateOfCreate"));
                s.setDateOfUpdate(rs.getDate("dateOfUpdate"));
                log.info("Заполняем значениями");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                stm.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return s;
    }

    @Override
    public int getCountOfAnswers(Topic topic) {

        return 0;
    }

    @Override
    public void updateTopic(Topic topic) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("UPDATE topics SET titleOfTopic = ?, message = ?, messageOfTopic = ?, dateOfUpdate = ?, forum_id = ?" +
                    "WHERE topicID =  ?");
            stmt.setString(1, topic.getTitleOfTopic());
            stmt.setString(2, topic.getMessage());
            stmt.setString(3, topic.getMessageOfTopic());
            stmt.setDate(4, (Date) topic.getDateOfUpdate());
            stmt.setInt(5, topic.getForum_id());
            stmt.setInt(6,topic.getTopicID());
            stmt.execute();
            log.debug("updateTopic performed success");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            //log.error("Failed " + e.getLocalizedMessage());
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

//    @Override
//    public void updateStatus(Topic topic) {
//
//    }

    @Override
    public void deleteTopic(Topic topic) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("DELETE FROM topics WHERE topicID =  ?");
            stmt.setInt(1, topic.getTopicID());

            stmt.execute();
            log.debug("deleteTopic performed success");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            //log.error("Addition of new comment failed " + e.getLocalizedMessage());
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public List<Topic> getAllTopics(Forum forum) {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM topics WHERE forum_id=?";
        log.info("getAllTopics - связь с БД");
        Connection con = getConnection();
        List<Topic> topicList = new ArrayList<>();
        Topic temp;
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, forum.getForumID());
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                temp = new Topic();
                temp.setTopicID(rs.getInt("topicID"));
                temp.setForum_id(rs.getInt("forum_id"));
                temp.setAuthorOfMessage(rs.getString("authorOfMessage"));
                temp.setDateOfCreate(rs.getDate("dateOfCreate"));
                temp.setDateOfUpdate(rs.getDate("dateOfUpdate"));
                temp.setMessage(rs.getString("message"));
                temp.setTitleOfTopic(rs.getString("titleOfTopic"));
                temp.setMessageOfTopic(rs.getString("messageOfTopic"));
                log.info("Добавляем в List значения из БД");
                topicList.add(temp);
            }
            log.debug("getAllTopics performed success");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        log.info("getAllTopics - success");
        return topicList;
    }
}
