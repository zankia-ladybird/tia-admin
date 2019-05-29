package com.zankia.tia.dto;

import com.nfwork.dbfound.model.reflector.Column;

public class SkillbookPublicity {

	@Column(name = "req_id")
	private String reqId;

	@Column(name = "book_name")
	private String bookName;

	@Column(name = "book_level")
	private Integer bookLevel;

	private String server;

	@Column(name = "opt_user")
	private String optUser;

	@Column(name = "opt_time")
	private String optTime;

	public String getReqId() {
		return reqId;
	}

	public void setReqId(String reqId) {
		this.reqId = reqId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public Integer getBookLevel() {
		return bookLevel;
	}

	public void setBookLevel(Integer bookLevel) {
		this.bookLevel = bookLevel;
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public String getOptUser() {
		return optUser;
	}

	public void setOptUser(String optUser) {
		this.optUser = optUser;
	}

	public String getOptTime() {
		return optTime;
	}

	public void setOptTime(String optTime) {
		this.optTime = optTime;
	}

}
