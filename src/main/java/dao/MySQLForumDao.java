package dao;

import org.apache.log4j.Logger;
import pojo.Forum;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Артем on 11.11.2016.
 */
public class MySQLForumDao extends MySqlDao implements ForumDao{
    static Logger log = Logger.getLogger(MySQLForumDao.class);

    @Override
    public void createForum(Forum forum) {
        log.info("start createForum");
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("INSERT INTO forum" + "(nameOfForum, descriptionOfForum)"
                    + "VALUES(?,?)");
            stmt.setString(1,forum.getNameOfForum());
            stmt.setString(2,forum.getDescriptionOfForum());
            stmt.execute();
        log.info("Forum created");
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
    public Forum getForumById(int id) {
        String sql = "SELECT * FROM forum WHERE forumID = ?";
        Forum s = null;
        PreparedStatement stm = null;
        Connection con = getConnection();
        try {
            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s = new Forum();
                s.setForumID(rs.getInt("forumID"));
                s.setNameOfForum(rs.getString("nameOfForum"));
                s.setDescriptionOfForum(rs.getString("descriptionOfForum"));
                s.setDateOfCreate(rs.getDate("dateOfCreate"));
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
    public void updateForum(Forum forum) {
        log.info("start updateForum");
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("UPDATE forum SET nameOfForum =  ?, dateOfForum = ?" +
                    "WHERE forumID = ?");
            stmt.setInt(1, forum.getForumID());
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
    public void deleteForum(Forum forum) {
        log.info("start deleteForum");
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("DELETE FROM forum WHERE forumID =  ?");
            stmt.setInt(1, forum.getForumID());

            stmt.execute();
            log.info("Forum был удален");
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
    }
    @Override
    public List<Forum> getAllForums() {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM forum";
        Connection con = getConnection();
        List<Forum> forumList = new ArrayList<>();
        try {
            Forum temp = null;
            stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                temp = new Forum();
                temp.setForumID(rs.getInt("forumID"));
                temp.setNameOfForum(rs.getString("nameOfForum"));
                temp.setDescriptionOfForum(rs.getString("descriptionOfForum"));
                temp.setDateOfCreate(rs.getDate("dateOfCreate"));
                forumList.add(temp);
            }
            log.debug("GetAllTopics success");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            log.error("GetAllTopics failed " + e.getLocalizedMessage());
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return forumList;
    }
}
