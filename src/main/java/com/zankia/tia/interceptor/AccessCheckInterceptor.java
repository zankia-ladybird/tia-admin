package com.zankia.tia.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nfwork.dbfound.core.Context;
import com.nfwork.dbfound.util.JsonUtil;
import com.nfwork.dbfound.web.WebWriter;
import com.nfwork.dbfound.web.base.Interceptor;

public class AccessCheckInterceptor implements Interceptor {

	Map<String, String> map;

	public boolean jspInterceptor(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object user_id = request.getSession().getAttribute("user_id");

		String url = request.getServletPath();
		if (user_id == null) {
			if (check(url)) {
				return true;
			} else {
				response.sendRedirect("/loginWindow/login.jsp");
				return false;
			}
		} else {
			if (check(url)) {
				response.sendRedirect("/home/index.jsp");
				return false;
			}
			return true;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private boolean commonInterceptor(Context context) {
		Object user_id = context.request.getSession().getAttribute("user_id");

		String url = context.request.getServletPath();
		if (user_id == null) {
			if (check(url)) {
				return true;
			} else {
				Map map = new HashMap();
				map.put("timeout", true);
				map.put("message", "session超时或未登录");
				map.put("success", false);
				WebWriter.jsonWriter(context.response, JsonUtil.mapToJson(map));
				return false;
			}
		} else {
			if("/sys/login.execute!logout".equals(url)) {
				context.setSessionData("user_id", null);
			}
			return true;
		}
	}

	public boolean doInterceptor(Context context, String className, String method) throws Exception {
		return commonInterceptor(context);
	}

	public boolean executeInterceptor(Context context, String modelName, String executeName) throws Exception {
		return commonInterceptor(context);
	}

	public boolean exportInterceptor(Context context, String modelName, String queryName) throws Exception {
		return commonInterceptor(context);
	}

	public boolean queryInterceptor(Context context, String modelName, String queryName) throws Exception {
		return commonInterceptor(context);
	}

	public boolean check(String url) {
		if (map.get(url) == null) {
			return false;
		} else {
			return true;
		}
	}

	public void init() {
		map = new HashMap<String, String>();
		map.put("/loginWindow/login.jsp", "1");
		map.put("/sys/login.execute", "1");
	}
}