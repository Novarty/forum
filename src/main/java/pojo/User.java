package pojo;

/**
 * Created by Артем on 27.10.2016.
 */
//import org.apache.log4j.Logger;

import org.apache.log4j.Logger;

import java.util.Date;
import java.util.List;

/**
 * Created by Ilya Evlampiev on 14.10.2015.
 */
public abstract class User {
    static Logger log = Logger.getLogger(User.class);
    private static final long serialVersionUID = 1L;
    private int databaseId;
    private String username;
    private String password;
    private String firstname;
    private String lastname;
    private String role;
    private Integer countOfTopics = 0; // кол-во созданных тем пользователем
    private Integer countOfMessages = 0;  //кол-во сообщений пользователя
    private Date registerdate;
    private List<Topic> electedTopics;// список постов, добавленных в избранное

    public Date getRegisterdate() {
        return registerdate;
    }

    public void setRegisterdate(Date registerdate) {
        this.registerdate = registerdate;
    }

    public Integer getCountOfTopics() {
        return countOfTopics;
    }

    public void setCountOfTopics(Integer value)
    {
        if (value>0){
            this.countOfTopics +=1;
        }
        else{
            this.countOfTopics -=1;
        }
    }
    public void setCountOfMessages(Integer value) {
        if (value>0){
            this.countOfMessages +=1;
        }
        else{
            this.countOfMessages -=1;
        }
    }
    public void setCountTForRead(Integer countOfTopics){
        this.countOfTopics = countOfTopics;
    }
    public void setCountMForRead(Integer countOfMessages){
        this.countOfMessages = countOfMessages;
    }

    public Integer getCountOfMessages() {
        return countOfMessages;
    }

    public User(String firstname, String lastname) {
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public User() {}

    public List<Topic> getElectedTopics() {
        return electedTopics;
    }

    public void setElectedTopics(Topic electedTopics) {
        this.electedTopics.add(electedTopics);
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) //throws UnsupportedEncodingException, NoSuchAlgorithmException
    {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {

        this.role = role;
    }

//    public static boolean isBetween(int x, int lower, int upper) {
//        return lower <= x && x <= upper;
//    }

    public int getDatabaseId() {
        return this.databaseId;
    }

    public void setDatabaseId(int id) {
        this.databaseId = id;
    }

    public boolean isYou(User sessionUser) {
        log.info(this.getUsername() + " is checked the session user " + sessionUser.getUsername() + " the same or not ");
        return this.getDatabaseId() == sessionUser.getDatabaseId();
    }

    public abstract boolean isMember();

    public abstract boolean isModerator();

    public abstract boolean isAdmin();
}

