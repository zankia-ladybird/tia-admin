package com.zankia.tia.dto;

import com.nfwork.dbfound.model.reflector.Column;

public class EquipmentPublicity {

	@Column(name = "req_id")
	private String reqId;

	@Column(name = "equipment_name")
	private String equipmentName;

	@Column(name = "equipment_level")
	private Integer equipmentLevel;

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

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}

	public Integer getEquipmentLevel() {
		return equipmentLevel;
	}

	public void setEquipmentLevel(Integer equipmentLevel) {
		this.equipmentLevel = equipmentLevel;
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
