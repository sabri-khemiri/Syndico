package com.miaou.trust.dao;

import com.miaou.trust.model.Trust;
import java.util.List;

public interface TrustDao {
    public List<Trust> getAll();
    public Trust getByName(String name);
    public void addTrust(Trust trust);
    public void removeTrust(Trust trust);
    public void updateTrust(Trust trust);
}
