package com.zankia.tia.controller;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.google.common.collect.Maps;
import com.nfwork.dbfound.core.Context;
import com.nfwork.dbfound.dto.QueryResponseObject;
import com.nfwork.dbfound.dto.ResponseObject;
import com.nfwork.dbfound.model.ModelEngine;
import com.nfwork.dbfound.web.base.BaseControl;

public class EquipmentProbabilityControl implements BaseControl {

	@Override
	public ResponseObject execute(Context context) throws Exception {
		return null;
	}

	public ResponseObject query(Context context) throws InterruptedException {
		Integer equipmentLevel=Integer.valueOf((String)context.getData("param.equipment_level"));
		if(equipmentLevel%2==0) {
			return querySp(context);
		}else {
			return queryCommon(context);
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public ResponseObject querySp(Context context) {
		int min = 10000;
		int start = 1;
		QueryResponseObject<Map<String, Object>> response = ModelEngine.query(context, "tia/equipmentProbability", "querySp");
		Set<String> set = new HashSet<String>();
		for (int i = 0; i < response.getDatas().size(); i++) {
			set.add((String) response.getDatas().get(i).get("equipment_name"));
			if (set.size() == 54) {
				set.clear();
				int opennum = i - start + 1;
				if (opennum <= min) {
					min = opennum;
					if (opennum == 54) {
						break;
					}
				}
				i = start++;
			}
		}

		if (start == 1) {
			ResponseObject returnResponse = new ResponseObject();
			returnResponse.setSuccess(false);
			returnResponse.setMessage("样本不足，无法执行概率分析");
			return returnResponse;
		}

		int maxTimes = 0;
		int totalTimes = 0;
		context.setParamData("limit", start);
		Map<String, Integer> eqShowTimeMap = Maps.newHashMap();
		QueryResponseObject<Map<String, Object>> limitResponse = ModelEngine.query(context, "tia/equipmentProbability", "querySpLimit");
		for (Map<String, Object> data : limitResponse.getDatas()) {
			if (eqShowTimeMap.get(data.get("equipment_name")) == null) {
				eqShowTimeMap.put((String) data.get("equipment_name"), 0);
			}
			maxTimes = maxTimes > eqShowTimeMap.get(data.get("equipment_name")) + 1 ? maxTimes : eqShowTimeMap.get(data.get("equipment_name")) + 1;
			eqShowTimeMap.put((String) data.get("equipment_name"), eqShowTimeMap.get(data.get("equipment_name")) + 1);
		}

		for (Integer showTimes : eqShowTimeMap.values()) {
			totalTimes += maxTimes - showTimes;
		}
		totalTimes+=maxTimes*(18-eqShowTimeMap.keySet().size());

		context.setParamData("limit", null);
		QueryResponseObject<Map<String, Object>> equipmentResponse = ModelEngine.query(context, "tia/equipmentConfig", "");
		for (Map<String, Object> data : equipmentResponse.getDatas()) {
			if (eqShowTimeMap.get(data.get("equipment_name")) == null) {
				context.setParamData("real_probability", maxTimes * 100.0 / totalTimes);
			} else {
				context.setParamData("real_probability", (maxTimes - eqShowTimeMap.get(data.get("equipment_name"))) * 100.0 / totalTimes);
			}

			context.setParamData("id", data.get("id"));
			ModelEngine.execute(context, "tia/equipmentConfig", "updateProbability");
		}
		return ModelEngine.query(context, "tia/equipmentConfig", "queryOrderByP");
	}
	
	@SuppressWarnings({ "unchecked" })
	public ResponseObject queryCommon(Context context) throws InterruptedException {
		int min = 10000;
		int start = 1;
		QueryResponseObject<Map<String, Object>> response = ModelEngine.query(context, "tia/equipmentProbability", "queryCommon");
		Set<String> set = new HashSet<String>();
		for (int i = 0; i < response.getDatas().size(); i++) {
			set.add((String) response.getDatas().get(i).get("equipment_name"));
			if (set.size() == 18) {
				set.clear();
				int opennum = i - start + 1;
				if (opennum <= min) {
					min = opennum;
					if (opennum == 18) {
						break;
					}
				}
				i = start++;
			}
		}

		if (start == 1) {
			ResponseObject returnResponse = new ResponseObject();
			returnResponse.setSuccess(false);
			returnResponse.setMessage("样本不足，无法执行概率分析");
			return returnResponse;
		}

		int maxTimes = 0;
		int totalTimes = 0;
		context.setParamData("limit", start);
		Map<String, Integer> eqShowTimeMap = Maps.newHashMap();
		QueryResponseObject<Map<String, Object>> limitResponse = ModelEngine.query(context, "tia/equipmentProbability", "queryCommonLimit");
		for (Map<String, Object> data : limitResponse.getDatas()) {
			if (eqShowTimeMap.get(data.get("equipment_name")) == null) {
				eqShowTimeMap.put((String) data.get("equipment_name"), 0);
			}
			maxTimes = maxTimes > eqShowTimeMap.get(data.get("equipment_name")) + 1 ? maxTimes : eqShowTimeMap.get(data.get("equipment_name")) + 1;
			eqShowTimeMap.put((String) data.get("equipment_name"), eqShowTimeMap.get(data.get("equipment_name")) + 1);
		}

		for (Integer showTimes : eqShowTimeMap.values()) {
			totalTimes += maxTimes - showTimes;
		}
		totalTimes+=maxTimes*(18-eqShowTimeMap.keySet().size());

		context.setParamData("limit", null);
		QueryResponseObject<Map<String, Object>> equipmentResponse = ModelEngine.query(context, "tia/equipmentConfig", "");
		for (Map<String, Object> data : equipmentResponse.getDatas()) {
			if (eqShowTimeMap.get(data.get("equipment_name")) == null) {
				context.setParamData("real_probability", maxTimes * 100.0 / totalTimes);
			} else {
				context.setParamData("real_probability", (maxTimes - eqShowTimeMap.get(data.get("equipment_name"))) * 100.0 / totalTimes);
			}

			context.setParamData("id", data.get("id"));
			ModelEngine.execute(context, "tia/equipmentConfig", "updateProbability");
		}
		return ModelEngine.query(context, "tia/equipmentConfig", "queryOrderByP");
	}

	public static void main(String[] args) throws InterruptedException {
		EquipmentProbabilityControl control = new EquipmentProbabilityControl();
		Context context = new Context();
		context.setParamData("equipment_level", 3);
		control.queryCommon(context);
	}
}
