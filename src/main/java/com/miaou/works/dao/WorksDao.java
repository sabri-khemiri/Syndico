package com.miaou.works.dao;

import com.miaou.trust.model.CoOwnership;
import com.miaou.works.dao.*;
import com.miaou.works.model.Works;
import java.util.List;


public interface WorksDao {
    public List<Works> getAll();
    public List<Works> getByCoOwnership(CoOwnership coOwnership);
    public void addWorks(Works works);
    public void removeWorks(Works works);
    public void updateWorks(Works works);
    

}
