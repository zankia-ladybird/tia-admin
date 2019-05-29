package com.zankia.tia.controller;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.nfwork.dbfound.core.Context;
import com.nfwork.dbfound.dto.QueryResponseObject;
import com.nfwork.dbfound.dto.ResponseObject;
import com.nfwork.dbfound.model.ModelEngine;
import com.nfwork.dbfound.web.base.BaseControl;

public class IdentifyFeedbackControl implements BaseControl {

	@Override
	public ResponseObject execute(Context context) throws Exception {
		return null;
	}

	@SuppressWarnings({ "unchecked" })
	public ResponseObject query(Context context) throws InterruptedException {
		QueryResponseObject<Map<String, Object>> response = ModelEngine.query(context, "tia/equipmentPublicity", "test");

		int min = 10000;
		int start = 1;
		int last = 1;
		Set<String> set = new HashSet<String>();
		for (int i = 0; i < response.getDatas().size(); i++) {
			boolean ok = set.add((String) response.getDatas().get(i).get("equipment_name"));
//			if(!ok) {
//				System.out.println(set.size());
//				set.clear();
//			}
//			System.out.println(loop(set));
			if (set.size() == 52) {
//				System.out.println(loop(set));
//				break;
				set.clear();
				int opennum = i - start + 1;
				if (opennum <= min) {
					min = opennum;
					if (opennum==52) {
						set.clear();
						System.out.println("开始点:" + start + ", 结束点" + (i) + ", 一轮所需开箱数目:" + (i - start + 1));
						Thread.sleep(500);
						i = start++;
					}
				}
				i = start++;
			}
		}
		return response;
	}

	private String loop(Set<String> set) {
		StringBuffer buffer = new StringBuffer();
		for (String s : set) {
			buffer.append(s + ",");
		}
		return buffer.toString();
	}

	public static void main(String[] args) throws InterruptedException {
		IdentifyFeedbackControl control = new IdentifyFeedbackControl();
		control.query(new Context());
	}
}
