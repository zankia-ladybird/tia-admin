package com.zankia.tia.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.nfwork.dbfound.core.Context;
import com.nfwork.dbfound.dto.QueryResponseObject;
import com.nfwork.dbfound.dto.ResponseObject;
import com.nfwork.dbfound.model.ModelEngine;
import com.nfwork.dbfound.web.base.BaseControl;
import com.zankia.tia.dto.EquipmentPublicity;
import com.zankia.tia.dto.SkillbookPublicity;
import com.zankia.tia.dto.response.SyncData;
import com.zankia.tia.dto.response.TiaData;
import com.zankia.tia.utils.JsonUtils;

public class SyncRecordControl implements BaseControl {

	@Override
	public ResponseObject execute(Context context) throws Exception {
		return null;
	}

	public ResponseObject addData(Context context) throws IOException, ParseException {
		Object obj = context.getData("param.syncData");
		String dataJson = JsonUtils.toUnderlineJSONString(obj);
		SyncData syncData = JsonUtils.toSnakeObject(dataJson, SyncData.class);

		if (!syncData.getStatus()) {
			ResponseObject responseObject = new ResponseObject();
			responseObject.setSuccess(false);
			return responseObject;
		}

		// 获取昨日时间及限制时间
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);

		calendar.add(Calendar.DATE, -10);
		Date yesterday = calendar.getTime();

		calendar.set(Calendar.HOUR_OF_DAY, 2);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		Date limitday = calendar.getTime();

		int count = 0;
		for (TiaData tiaData : syncData.getData()) {
			count++;

			String getTime = tiaData.getGetTime();
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date openDate = format.parse(getTime);
			if (openDate.before(limitday) && openDate.after(yesterday)) {
				QueryResponseObject responseObject = new QueryResponseObject();
				responseObject.setMessage(getTime + "#" + count);
				responseObject.setSuccess(false);
				return responseObject;
			}

			if (tiaData.getPropInfo().getPropName().contains("技能")) {
				if (skillLevelFetch(tiaData.getPropInfo().getFrom().split(" ")[2]) != 0) {
					SkillbookPublicity skillbookPublicity = new SkillbookPublicity();
					skillbookPublicity.setReqId(tiaData.getReqId());
					skillbookPublicity.setBookName(tiaData.getPropInfo().getPropName());
					skillbookPublicity.setBookLevel(skillLevelFetch(tiaData.getPropInfo().getFrom().split(" ")[2]));
					skillbookPublicity.setServer(tiaData.getUserInfo().getServerName());
					skillbookPublicity.setOptUser(tiaData.getUserInfo().getNick());
					skillbookPublicity.setOptTime(tiaData.getGetTime());
					context.setData("skillbookPublicity", skillbookPublicity);
					List<Object> duplicateDatas = ModelEngine.query(context, "tia/skillbookPublicity", "queryDuplicate", "skillbookPublicity", false).getDatas();
					if (duplicateDatas.size() == 0) {
						ModelEngine.execute(context, "tia/skillbookPublicity", "add", "skillbookPublicity");
					}
				}
			} else {
				if (equipmentLevelFetch(tiaData.getPropInfo().getFrom().split(" ")[2]) != 0) {
					EquipmentPublicity equipmentPublicity = new EquipmentPublicity();
					equipmentPublicity.setReqId(tiaData.getReqId());
					equipmentPublicity.setEquipmentName(tiaData.getPropInfo().getPropName());
					equipmentPublicity.setEquipmentLevel(equipmentLevelFetch(tiaData.getPropInfo().getFrom().split(" ")[2]));
					equipmentPublicity.setServer(tiaData.getUserInfo().getServerName());
					equipmentPublicity.setOptUser(tiaData.getUserInfo().getNick());
					equipmentPublicity.setOptTime(tiaData.getGetTime());
					context.setData("equipmentPublicity", equipmentPublicity);
					List<Object> duplicateDatas = ModelEngine.query(context, "tia/equipmentPublicity", "queryDuplicate", "equipmentPublicity", false).getDatas();
					if (duplicateDatas.size() == 0) {
						ModelEngine.execute(context, "tia/equipmentPublicity", "add", "equipmentPublicity");
					}
				}
			}
		}

		ResponseObject responseObject = new ResponseObject();
		responseObject.setSuccess(true);
		return responseObject;
	}

	private Integer skillLevelFetch(String level) {
		switch (level) {
		case "低阶初级技能":
			return 1;
		case "低阶中级技能":
			return 2;
		case "低阶高级技能":
			return 3;
		case "低阶超级技能":
			return 4;
		case "中阶初级技能":
			return 5;
		case "中阶中级技能":
			return 6;
		case "中阶高级技能":
			return 7;
		case "中阶超级技能":
			return 8;
		case "高阶初级技能":
			return 9;
		case "高阶中级技能":
			return 10;
		case "高阶高级技能":
			return 11;
		case "高阶超级技能":
			return 12;
		default:
			return 0;
		}
	}

	private Integer equipmentLevelFetch(String level) {
		switch (level) {
		case "一阶通用装备":
			return 1;
		case "一阶专属装备":
			return 2;
		case "二阶通用装备":
			return 3;
		case "二阶专属装备":
			return 4;
		case "三阶通用装备":
			return 5;
		case "三阶专属装备":
			return 6;
		case "四阶通用装备":
			return 7;
		case "四阶专属装备":
			return 8;
		default:
			return 0;
		}
	}

	public ResponseObject addRecord(Context context) {
		ResponseObject responseObject = ModelEngine.execute(context, "tia/syncRecord", "add");
		return responseObject;
	}
}
