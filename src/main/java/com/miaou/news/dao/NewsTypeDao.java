package com.miaou.news.dao;

import com.miaou.news.model.NewsType;
import com.miaou.trust.dao.*;
import java.util.List;

public interface NewsTypeDao {
    public List<NewsType> getAll();
    public void addNewsType(NewsType newsType);
    public void removeNewsType(NewsType newsType);
    public void updateNewsType(NewsType newsType);
}
