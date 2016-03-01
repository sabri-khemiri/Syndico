package com.miaou.meeting.dao;

import com.miaou.meeting.model.Meeting;
import com.miaou.trust.dao.*;
import com.miaou.trust.model.CoOwnership;
import java.util.Date;
import java.util.List;

public interface MeetingDao {
    public List<Meeting> getAll();
    public List<Meeting> getByMeetingDate(Date meetingDate);
    public List<Meeting> getByCoOwnership(CoOwnership coOwnership);
    public void addMeeting(Meeting meeting);
    public void removeMeeting(Meeting meeting);
    public void updateMeeting(Meeting meeting);
}
