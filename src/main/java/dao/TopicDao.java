package dao;

import pojo.Forum;
import pojo.Topic;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Артем on 09.11.2016.
 */
public interface TopicDao {

    /** Создание новой темы и её записи*/
    void createTopic(Topic topic);

    /** Получение объекта темы по её первичному ключу topicId*/
    Topic getTopicById(int topicId);

    /** Получение количества сообщений в теме*/
    int getCountOfAnswers(Topic topic);

    /** Обновление информации о теме в записи*/
    void updateTopic(Topic topic);

//    /** Обновление статуса темы*/
//    void updateStatus(Topic topic);

    /** Удаление записи о теме из базы*/
    void deleteTopic(Topic topic);

    /** Получение списока */
    List<Topic> getAllTopics(Forum forum);

//    List<ForumMessage> getAllMessages(Topic topic) throws SQLException;
//
//    List<Tag> getTags(Topic topic);
}
