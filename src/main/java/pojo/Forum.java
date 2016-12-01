package pojo;

import java.util.Date;


/**
 * Created by Артем on 10.11.2016.
 */
public class Forum {
    private Integer forumID;
    private String nameOfForum;
    private String descriptionOfForum;
    private Date dateOfCreate;

    public String getNameOfForum() {
        return nameOfForum;
    }

    public void setNameOfForum(String nameOfForum) {
        this.nameOfForum = nameOfForum;
    }

    public Date getDateOfCreate() {
        return dateOfCreate;
    }

    public void setDateOfCreate(Date dateOfCreate) {
        this.dateOfCreate = dateOfCreate;
    }

    public Integer getForumID() {
        return forumID;
    }

    public void setForumID(Integer forumID) {
        this.forumID = forumID;
    }

    public String getDescriptionOfForum() {
        return descriptionOfForum;
    }

    public void setDescriptionOfForum(String descriptionOfForum) {
        this.descriptionOfForum = descriptionOfForum;
    }
}