package com.xiaoyu.model;

import java.sql.Blob;
import java.sql.Date;

public class User {
	long id;
	String username;
	String cellphone;
	Integer power_level;
	Date createtime;
	Integer login_times;
	Date last_login;
	String wechat_id;
	String wechat_nickname;
	long merchant_id;
	Blob wechat_head_image;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getMerchant_id() {
		return merchant_id;
	}

	public void setMerchant_id(long merchant_id) {
		this.merchant_id = merchant_id;
	}

	public Blob getWechat_head_image() {
		return wechat_head_image;
	}

	public void setWechat_head_image(Blob wechat_head_image) {
		this.wechat_head_image = wechat_head_image;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public Integer getPower_level() {
		return power_level;
	}

	public void setPower_level(Integer power_level) {
		this.power_level = power_level;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getLogin_times() {
		return login_times;
	}

	public void setLogin_times(Integer login_times) {
		this.login_times = login_times;
	}

	public Date getLast_login() {
		return last_login;
	}

	public void setLast_login(Date last_login) {
		this.last_login = last_login;
	}

	public String getWechat_id() {
		return wechat_id;
	}

	public void setWechat_id(String wechat_id) {
		this.wechat_id = wechat_id;
	}

	public String getWechat_nickname() {
		return wechat_nickname;
	}

	public void setWechat_nickname(String wechat_nickname) {
		this.wechat_nickname = wechat_nickname;
	}
}
