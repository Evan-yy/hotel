package Dao;

import domain.Room;
import junit.framework.TestCase;
import org.junit.Test;

import static org.junit.Assert.*;

public class RoomDaoTest extends TestCase {

    @Test
    public void saveRoom() {
        Room room1=new Room();
        int id=101;
        String name="陈皇";
        String guestid="123456";
        int guestday=2;
        room1.setRoomid(id);
        room1.setRoomguestname(name);
        room1.setRoomguestid(guestid);
        room1.setGuestday(guestday);

    }
}