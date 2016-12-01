package dao;

import org.apache.log4j.Logger;
import pojo.Message;
import pojo.Topic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Артем on 14.11.2016.
 */
public class MySQLMessageDao extends MySqlDao implements MessageDao {
    static Logger log = Logger.getLogger(MySQLForumDao.class);

    @Override
    public void createMessage(Message message) {
        log.info("start createMessage");
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("INSERT INTO messages" + "(message, authorOfMessage, topic_id)"
                    + "VALUES(?,?,?)");
            stmt.setString(1, message.getMessage());
            stmt.setString(2, message.getAuthorOfMessage());
            stmt.setInt(3, message.getTopic_id());
            stmt.execute();
            log.info("Message created");
            //log.trace("Addition to notes by user " + note.getUser().getUsername());
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
    public Message getMessageById(int messageID) {
        String sql = "SELECT * FROM messages WHERE messageID = ?";
        Message s = null;
        PreparedStatement stm = null;
        Connection con = getConnection();
        try {
            stm = con.prepareStatement(sql);
            stm.setInt(1, messageID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s = new Message();
                s.setTopic_id(rs.getInt("topic_id"));
                s.setMessage(rs.getString("message"));
                s.setAuthorOfMessage(rs.getString("authorOfMessage"));
                s.setDateOfCreate(rs.getDate("dateOfCreate"));
                s.setDateOfUpdate(rs.getDate("dateOfUpdate"));
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
    public int getAnswersCount(Topic topic) {
        return 0;
    }

    @Override
    public void updateMessage(Message message) {
        log.info("start updateMessage");
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("UPDATE messages SET message =  ?, dateOfUpdate = ?" +
                    "WHERE messageID = ?");
            stmt.setInt(1, message.getMessageID());
            stmt.execute();
            //log.debug("Addition to notes by user ");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // log.error("Addition of new comment failed " + e.getLocalizedMessage());
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
    public void updateStatus(Message message) {

    }

    @Override
    public void deleteMessage(Message message, int id, String username) {
        log.info("start deleteMessage");
        PreparedStatement stmt = null;
        Connection con = getConnection();

        try {
            if (username.equals(this.getMessageById(id).getAuthorOfMessage())){
                stmt = con.prepareStatement("DELETE FROM messages WHERE messageID =  ?");
                stmt.setInt(1, id);

                stmt.execute();
                log.info("Сообщение было удалено");
                //log.debug("Addition to notes by user ");
                stmt.close();
            }
            else {
                log.info("deleteMessage ветка 'else'");
                try {
                    stmt.close();
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            stmt.close();
            con.close();
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
    public List<Message> getAllMessages(Topic topic) {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM messages WHERE topic_id = ?";
        Connection con = getConnection();
        List<Message> messagesList = new ArrayList<>();
        try {
            Message temp;
            stmt = con.prepareStatement(sql);
            stmt.setInt(1,topic.getTopicID());
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                temp = new Message();
                temp.setMessageID(rs.getInt("messageID"));
                temp.setTopic_id(rs.getInt("topic_id"));
                temp.setMessage(rs.getString("message"));
                temp.setAuthorOfMessage(rs.getString("authorOfMessage"));
                temp.setDateOfCreate(rs.getDate("dateOfCreate"));
                temp.setDateOfUpdate(rs.getDate("dateOfUpdate"));
                messagesList.add(temp);
            }
            log.debug("Addition AllMessages to List");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
//            log.error("Addition of new comment failed " + e.getLocalizedMessage());
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return messagesList;
    }
}
