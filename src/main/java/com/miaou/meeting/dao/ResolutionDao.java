package com.miaou.meeting.dao;

import com.miaou.meeting.model.Resolution;
import com.miaou.trust.dao.*;
import com.miaou.users.model.AccountOwner;
import java.util.List;

public interface ResolutionDao {
    public List<Resolution> getAll();
    public Resolution getByTitle(String title);
    public Resolution getByAccountOwner(AccountOwner accountOwner);
    public void addResolution(Resolution resolution);
    public void removeResolution(Resolution resolution);
    public void updateResolution(Resolution resolution);
}
