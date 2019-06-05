<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>萌新小队打本记录</title>
		<d:includeLibrary />
	</head>
	<script type="text/javascript">

        function isCellEditable(col,row,name,record) {
        	if(record.json&&name=='equipment_type'){
        		return false;
        	}
            return true;
        }
        
		function query() {
			activityGrid.query();
		}
		
		function reset() {
			queryForm.reset();
		}

		var activityMapStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "熔岩路径" ], [ "2", "小型密室" ],[ "3", "小型图书馆" ]],
			fields : [ "code", "name" ]
		});
		
		function openAddWindow(){
			$D.showMessage("活动记录功能正在开发中，开发进度请联系管理员");
		}
	</script>
	<body>
		<d:form id="queryForm" title="查询条件" labelWidth="80">
			<d:line columnWidth="0.33">
				<d:field name="activity_map" anchor="85%" prompt="副本"  editor="combo" options="activityMapStore" displayField="name" valueField="code" >
				   <d:event name="select" handle="query"/>
				</d:field>
				<d:field name="date_from" anchor="85%" prompt="时间(从)" editor="datefield" currentTime="-7">
				   <d:event name="enter" handle="query"/>
				</d:field>
				<d:field name="date_to" anchor="85%" prompt="时间(到)" editor="datefield" currentTime="-0">
				   <d:event name="select" handle="query"/>
				</d:field>
			</d:line>
		</d:form>
		<d:buttonGroup>
			<d:button id="query" title="查询" click="query" />
			<d:button title="重置" click="reset" />
		</d:buttonGroup>
		
		<d:grid id="activityGrid"  singleSelect="false"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('activityGrid')" title="装备配置"  queryForm="queryForm"  model="tia/activityRecord" autoQuery="true" pagerSize="50">
			<d:toolBar>
				<d:gridButton title="新增配置" icon="DBFoundUI/images/add.gif" beforeAction="openAddWindow" />
				<d:gridButton title="编辑配置" id="editorBt" disabled="true" icon="DBFoundUI/images/page_attach.png"  beforeAction="openUpdateWindow" />
				<d:gridButton title="复制" id="onCopy" disabled="true" icon="DBFoundUI/images/copy.png"  beforeAction="openCopyWindow" />
				<d:gridButton type="delete" disabled="true"/><!-- 联系管理员删除 -->
			</d:toolBar>
			<d:columns>
					<d:column name="id" sortable="true" required="true" prompt="id" width="80"  hidden="true"/>
					<d:column name="activity_map" sortable="true" required="true" prompt="副本"  width="150" editor="combo" options="activityMapStore" displayField="name" valueField="code"/>
					<d:column name="batch" sortable="true" required="true" prompt="当日批次"  width="150" editor="numberfield" />
					<d:column name="participants" sortable="true" required="true" prompt="参与人数"  width="150" editor="numberfield"/>
					<d:column name="description" sortable="true" required="true" prompt="描述"  width="150" editor="textfield"/>
					<d:column name="main_produce" sortable="true" required="true" prompt="主要产出"  width="150" editor="numberfield" />
					<d:column name="coin_produce" sortable="true" required="true" prompt="金币产出"  width="150" editor="numberfield"/>
					<d:column name="create_by" sortable="true"  prompt="创建人" width="150" editable="false" hidden="true"/>
		  	    	<d:column name="create_date" sortable="true"  prompt="创建时间" width="150" editable="false"  hidden="true"/>
		  	    	<d:column name="last_update_by" sortable="true"  prompt="更新人" width="150"  editable="false" />
		  	    	<d:column name="last_update_date" sortable="true"  prompt="更新时间" width="150"  editable="false" />
			</d:columns>
		</d:grid>
	</body>
</html>

