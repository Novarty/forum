package pojo;


import java.util.List;

/**
 * Модератор может: добавлять - удалять записи, удалять сообщения (с указанием "удаленно модератором")
 * редактировать сообщения(будет указанно "редактировано модератором")
 * Created by Артем on 02.11.2016.
 */
public class Moderator extends User {
    List<Topic> list;
    public Moderator() {
        super.setRole(UserTypes.MODERATOR.toString());
    }

    @Override
    public boolean isMember() {
        return false;
    }

    @Override
    public boolean isModerator() {
        return true;
    }

    @Override
    public boolean isAdmin() {
        return false;
    }

}
