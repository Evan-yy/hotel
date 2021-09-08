package domain;

import java.io.Serializable;

public class Customers implements Serializable {
    private int cid;
    private String cname;
    private int Ccardid;
    private int Cphone;
    private String Cgrade;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getCcardid() {
        return Ccardid;
    }

    public void setCcardid(int ccardid) {
        Ccardid = ccardid;
    }

    public int getCphone() {
        return Cphone;
    }

    public void setCphone(int cphone) {
        Cphone = cphone;
    }

    public String getCgrade() {
        return Cgrade;
    }

    public void setCgrade(String cgrade) {
        Cgrade = cgrade;
    }
}
