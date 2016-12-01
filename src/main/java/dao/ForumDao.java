package dao;

import pojo.Forum;

import java.util.List;

/**
 * Created by Артем on 10.11.2016.
 */
public interface ForumDao {

    /** Создание новой темы и её записи*/
    void createForum(Forum forum);

    /** Получение объекта раздела по её первичному ключу forumId*/
    Forum getForumById(int id);

    /** Обновление информации о разделе*/
    void updateForum(Forum forum);

    /** Удаление раздела из базы*/
    void deleteForum(Forum forum);

    /** Получение список форумов*/
    List<Forum> getAllForums();
}
