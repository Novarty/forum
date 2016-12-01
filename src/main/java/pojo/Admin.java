package pojo;


import java.util.List;

/**
 * Created by Артем on 02.11.2016.
 */
public class Admin extends User {
    List<Topic> list;


    public Admin() {
        super.setRole(UserTypes.ADMIN.toString());
    }

    @Override
    public boolean isMember() {
        return false;
    }

    @Override
    public boolean isModerator() {
        return false;
    }

    @Override
    public boolean isAdmin() {
        return true;
    }



}
