package domain;

public class Room {
    private int roomid;
    private String roomtype;
    private String roomstate;
    private String roomguestname;
    private String roomguestid;
    private double roomprice;
    private int guestday;

    public int getRoomid() {
        return roomid;
    }

    public String getRoomguestid() {
        return roomguestid;
    }

    public void setRoomguestid(String roomguestid) {
        this.roomguestid = roomguestid;
    }

    public String getRoomstate() {
        return roomstate;
    }

    public void setRoomstate(String roomstate) {
        this.roomstate = roomstate;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public String getRoomguestname() {
        return roomguestname;
    }

    public void setRoomguestname(String roomguestname) {
        this.roomguestname = roomguestname;
    }

    public String getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(String roomtype) {
        this.roomtype = roomtype;
    }

    public double getRoomprice() {
        return roomprice;
    }

    public void setRoomprice(double roomprice) {
        this.roomprice = roomprice;
    }

    public int getGuestday() {
        return guestday;
    }

    public void setGuestday(int guestday) {
        this.guestday = guestday;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomid=" + roomid +
                ", roomtype='" + roomtype + '\'' +
                ", roomstate='" + roomstate + '\'' +
                ", roomguestname='" + roomguestname + '\'' +
                ", roomguestid=" + roomguestid +
                '}';
    }
}
