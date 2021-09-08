package domain;

import javax.print.attribute.DateTimeSyntax;
import java.io.Serializable;
import java.sql.Timestamp;

public class Lists implements Serializable {
    private int lid;
    private String customerName;
    private String customerID;
    private int roomid;
    private String roomType;
    private double roomprice;
    private int day;
    private String state;
    private double Total;
    private Timestamp livetime;
    private Timestamp outtime;

    @Override
    public String toString() {
        return "Lists{" +
                "lid=" + lid +
                ", customerName='" + customerName + '\'' +
                ", customerID='" + customerID + '\'' +
                ", roomid=" + roomid +
                ", roomType='" + roomType + '\'' +
                ", roomprice=" + roomprice +
                ", day=" + day +
                ", state='" + state + '\'' +
                ", Total=" + Total +
                ", livetime=" + livetime +
                ", outtime=" + outtime +
                '}';
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public double getRoomprice() {
        return roomprice;
    }

    public void setRoomprice(double roomprice) {
        this.roomprice = roomprice;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double total) {
        Total = total;
    }

    public Timestamp getLivetime() {
        return livetime;
    }

    public void setLivetime(Timestamp livetime) {
        this.livetime = livetime;
    }

    public Timestamp getOuttime() {
        return outtime;
    }

    public void setOuttime(Timestamp outtime) {
        this.outtime = outtime;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }
}
