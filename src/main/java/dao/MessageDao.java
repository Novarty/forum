package dao;

import pojo.Forum;
import pojo.Message;
import pojo.Topic;


import java.util.List;

/**
 * Created by Артем on 14.11.2016.
 */
public interface MessageDao {
    /** Создание нового сообщения*/
    void createMessage(Message message);

    /** Получение объекта сообщения по его первичному ключу messageId*/
    Message getMessageById(int messageID);

    /** Получение количества сообщений в теме*/
    int getAnswersCount(Topic topic);

    /** Обновление информации о теме в записи*/
    void updateMessage(Message message);

    /** Обновление статуса сообщения*/
    void updateStatus(Message message);

    /** Удаление записи о теме из базы*/
    void deleteMessage(Message message, int id, String username);

    /** Получение списка всех сообщений топика*/
    List<Message> getAllMessages(Topic topic);
}
