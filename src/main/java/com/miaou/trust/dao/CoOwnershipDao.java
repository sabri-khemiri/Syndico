package com.miaou.trust.dao;

import com.miaou.trust.model.CoOwnership;
import java.util.List;

public interface CoOwnershipDao {
    public List<CoOwnership> getAll();
    public CoOwnership getByName(String name);
    public void addCoOwnership(CoOwnership coOwnership);
    public void removeCoOwnership(CoOwnership coOwnership);
    public void updateCoOwnership(CoOwnership coOwnership);
}
