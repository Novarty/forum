package pojo;

import java.util.Date;

/**
 * Created by Артем on 14.11.2016.
 */
public class Message {

    private Integer messageID;
    private Integer topic_id;
    private String authorOfMessage;
    private Date dateOfCreate;
    private Date dateOfUpdate;
    private String message;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getMessageID() {
        return messageID;
    }

    public void setMessageID(Integer messageID) {
        this.messageID = messageID;
    }

    public Integer getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(Integer topic_id) {
        this.topic_id = topic_id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getAuthorOfMessage() {
        return authorOfMessage;
    }

    public void setAuthorOfMessage(String authorOfMessage) {
        this.authorOfMessage = authorOfMessage;
    }

    public Date getDateOfCreate() {
        return dateOfCreate;
    }

    public void setDateOfCreate(Date dateOfCreate) {
        this.dateOfCreate = dateOfCreate;
    }

    public Date getDateOfUpdate() {
        return dateOfUpdate;
    }

    public void setDateOfUpdate(Date dateOfUpdate) {
        this.dateOfUpdate = dateOfUpdate;
    }
}
