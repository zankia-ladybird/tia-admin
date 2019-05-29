package com.zankia.tia.dto.response;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class SyncData {
	
	private Boolean status;
	
	private List<TiaData> data;

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public List<TiaData> getData() {
		return data;
	}

	public void setData(List<TiaData> data) {
		this.data = data;
	}
	
}
