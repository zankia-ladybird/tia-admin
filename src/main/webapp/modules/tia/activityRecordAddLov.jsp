<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>打本记录弹窗配置</title>
	<d:includeLibrary />
</head>
<script type="text/javascript">

		function afterSave(obj) {
			if (obj.success == true) {
				closeWindow();
			} else{
				$D.showError(obj.message);
			}
		}
		
		function beforeSave(obj) {
			var action_code =  Ext.getCmp("action_code").getValue();
			if(action_code == "" || action_code == undefined){
				$D.showError("请填写'动作编码'");
				return false;
			}
			var action_name =  Ext.getCmp("action_name").getValue();
			if(action_name == "" || action_name == undefined){
				$D.showError("请填写‘动作名称’");
				return false;
			}
			return true;
		};

		function closeWindow() {
			if (parent) {
				var json = addform.getData();
				var functionName = '${param.functionName}';
				<d:if test="${param.functionName != null}" >
					parent.${param.functionName}(json);
					return true;
				</d:if>
				<d:if test="${param.functionName == null}" >
					var pwindow = parent.Ext.getCmp("${param.windowId}");
					pwindow.close();
				</d:if>
			}
		};

		function reset() {
			addform.reset();
		};

		var activityMapStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "熔岩路径" ], [ "2", "小型密室" ],[ "3", "小型图书馆" ]],
			fields : [ "code", "name" ]
		});
	</script>
<body>
	<d:form id="addform" labelWidth="100" title="配置信息">
		<d:if test="${param.win == 'add'}">
			<d:line columnWidth="0.5" height="40">
				<d:field id="activity_map"  value="${param.activity_map}"  required="true" name="activity_map"   anchor="90%"  editor="combo"  prompt="副本"   options="activityMapStore"  displayField="name" valueField="code">
				</d:field>
				<d:field id="batch"  value="${param.batch}"  required="true" name="batch"   anchor="90%"  editor="textfield"   prompt="当日批次"  readOnly="true">
				</d:field>
			</d:line>
			<d:line columnWidth="1" height="40">
				<d:field id="description"  value="${param.description}"  required="true" name="description"   anchor="95%"  editor="textarea"   prompt="描述">
				</d:field>
			</d:line>
		</d:if>
		<d:if test="${param.win == 'update'}">
			<d:line columnWidth="0.5" height="40">
				<d:field id="activity_map"  value="${param.activity_map}"  required="true" name="activity_map"   anchor="90%"  editor="combo"  prompt="副本"   options="activityMapStore"  displayField="name" valueField="code">
				</d:field>
				<d:field id="batch"  value="${param.batch}"  required="true" name="batch"   anchor="90%"  editor="textfield"   prompt="当日批次" readOnly="true" >
				</d:field>
			</d:line>
			<d:line columnWidth="1" height="40">
				<d:field id="description"  value="${param.description}"  required="true" name="description"   anchor="95%"  editor="textarea"   prompt="描述" >
				</d:field>
			</d:line>
		</d:if>
		<d:if test="${param.win == 'copy'}">
			<d:line columnWidth="0.5" height="40">
				<d:field id="activity_map"  value="${param.activity_map}"  required="true" name="activity_map"   anchor="90%" editor="combo"  prompt="副本"   options="activityMapStore"  displayField="name" valueField="code">
				</d:field>
				<d:field id="batch"  value="${param.batch}"  required="true" name="batch"   anchor="90%"  editor="textfield"  prompt="当日批次" readOnly="true" >
				</d:field>
			</d:line>
			<d:line columnWidth="1" height="40">
				<d:field id="description"  value="${param.description}"  required="true" name="description"   anchor="95%"  editor="textarea"  prompt="描述">
				</d:field>
			</d:line>
		</d:if>
		<d:toolBar>
			<d:formButton title="保存" icon="DBFoundUI/images/save.gif" action="gofitmanage/gofit/actionConfig.do!save" beforeAction="beforeSave" afterAction="afterSave" />
			<d:formButton title="重置" beforeAction="reset" action="" />
		</d:toolBar>
	</d:form>
</body>
</html>
