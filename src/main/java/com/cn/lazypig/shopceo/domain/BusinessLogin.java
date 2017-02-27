package com.cn.lazypig.shopceo.domain;

import java.util.Date;

public class BusinessLogin {

	private Integer pid;
	
	private Boolean remember;

	private String businessid;

	private String email;

	private String phone;

	private String password;

	private Date createtime;

	private Date modifytime;

	public Boolean getRemember() {
		return remember;
	}

	public void setRemember(Boolean remember) {
		this.remember = remember;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getBusinessid() {
		return businessid;
	}

	public void setBusinessid(String businessid) {
		this.businessid = businessid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getModifytime() {
		return modifytime;
	}

	public void setModifytime(Date modifytime) {
		this.modifytime = modifytime;
	}

	@Override
	public String toString() {
		return "BusinessLogin{" +
				"pid=" + pid +
				", remember=" + remember +
				", businessid='" + businessid + '\'' +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", password='" + password + '\'' +
				", createtime=" + createtime +
				", modifytime=" + modifytime +
				'}';
	}
}