package com.zankia.tia.dto.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class TiaData {
	
	private String getTime;
	
	private String game;
	
	private String reqId;
	
	private TiaUser userInfo;
	
	private TiaReward propInfo;

	public String getGetTime() {
		return getTime;
	}

	public void setGetTime(String getTime) {
		this.getTime = getTime;
	}

	public String getGame() {
		return game;
	}

	public void setGame(String game) {
		this.game = game;
	}

	public String getReqId() {
		return reqId;
	}

	public void setReqId(String reqId) {
		this.reqId = reqId;
	}

	public TiaUser getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(TiaUser userInfo) {
		this.userInfo = userInfo;
	}

	public TiaReward getPropInfo() {
		return propInfo;
	}

	public void setPropInfo(TiaReward propInfo) {
		this.propInfo = propInfo;
	}

}
