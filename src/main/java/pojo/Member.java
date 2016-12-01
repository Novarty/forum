package pojo;


import java.util.List;

/**
 * Created by Артем on 02.11.2016.
 */
public class Member extends User {
    List<Topic> list;

    public Member() {
        super.setRole(UserTypes.MEMBER.toString());
    }

    @Override
    public boolean isMember() {
        return true;
    }

    @Override
    public boolean isModerator() {
        return false;
    }

    @Override
    public boolean isAdmin() {
        return false;
    }

}
