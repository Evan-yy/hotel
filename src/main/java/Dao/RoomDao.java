package Dao;

import domain.Room;

import java.util.List;

public interface RoomDao {
    List<Room> findAll();
    Room find(Room room);
    void SaveRoom(Room room);
    void updateRoom(Room room);
    void updateRoom2(Room room);

    void deleteRoom2(Room room);

    Room find2(Room room);
    Room find3(Room room);

}
