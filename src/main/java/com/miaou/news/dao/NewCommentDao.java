package com.miaou.news.dao;

import com.miaou.news.model.NewComment;
import com.miaou.trust.dao.*;
import java.util.List;

public interface NewCommentDao {
    public List<NewComment> getAll();
    public NewComment getById(int id);
    public void addNewComment(NewComment newComment);
    public void removeNewComment(NewComment newComment);
    public void updateNewComment(NewComment ewComment);
}
