package com.miaou.news.dao;

import com.miaou.news.model.News;
import com.miaou.trust.dao.*;
import java.util.List;

public interface NewsDao {
    public List<News> getAll();
    public News getById(int id);
    public void addNews(News news);
    public void removeNews(News news);
    public void updateNews(News news);
}
