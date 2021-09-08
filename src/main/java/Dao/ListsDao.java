package Dao;

import domain.Lists;
import domain.Room;

import java.util.List;

public interface ListsDao {
    void SaveList(Lists list);
    Lists last();
    Lists findList(Lists list);
    void updateList(Lists list);
    List<Lists> findAll();
}
