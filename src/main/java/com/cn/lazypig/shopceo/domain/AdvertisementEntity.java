package com.cn.lazypig.shopceo.domain;

public class AdvertisementEntity {
    private Integer pid;

    private String adid;

    private String adname;

    private String adurl;

    private String addesc;

    private String adtdurl;

    private String ownerid;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getAdid() {
        return adid;
    }

    public void setAdid(String adid) {
        this.adid = adid == null ? null : adid.trim();
    }

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname == null ? null : adname.trim();
    }

    public String getAdurl() {
        return adurl;
    }

    public void setAdurl(String adurl) {
        this.adurl = adurl == null ? null : adurl.trim();
    }

    public String getAddesc() {
        return addesc;
    }

    public void setAddesc(String addesc) {
        this.addesc = addesc == null ? null : addesc.trim();
    }

    public String getAdtdurl() {
        return adtdurl;
    }

    public void setAdtdurl(String adtdurl) {
        this.adtdurl = adtdurl == null ? null : adtdurl.trim();
    }

    public String getOwnerid() {
        return ownerid;
    }

    public void setOwnerid(String ownerid) {
        this.ownerid = ownerid == null ? null : ownerid.trim();
    }
}