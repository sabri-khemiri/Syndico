package com.miaou.message.dao;

import com.miaou.message.model.Message;
import com.miaou.users.dao.*;
import java.util.List;

public interface MessageDao {
    public List<Message> getAll();
    public void addMessage(Message message);
    public void removeMessage(Message message);
    public void updateMessage(Message message);
    

}
