<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>装备公示</title>
		<d:includeLibrary />
		<script type="text/javascript" src="${basePath}js/jquery-3.1.0.min.js"></script>
	</head>
	<script type="text/javascript">

        function isCellEditable(col, row,name,record) {
            return false;
        }
        
		function query() {
			equipmentGrid.query();
		}
		
		function reset() {
			queryForm.reset();
		}

		var levelStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "一阶通用装备" ], [ "2", "一阶专属装备" ],[ "3", "二阶通用装备" ], [ "4", "二阶专属装备" ],[ "5", "三阶通用装备" ], [ "6", "三阶专属装备" ],[ "7", "四阶通用装备" ], [ "8", "四阶专属装备" ]],
			fields : [ "code", "name" ]
		});

	</script>
	<body>
		<d:form id="queryForm" title="查询条件" labelWidth="80">
			<d:line columnWidth="0.33">
				<d:field name="equipment_name" anchor="85%" prompt="装备名称"  editor="textfield">
				   <d:event name="enter" handle="query"/>
				</d:field>
				<d:field name="equipment_level" anchor="85%" prompt="装备等级"  editor="combo"   options="levelStore" displayField="name" valueField="code" >
				   <d:event name="select" handle="query"/>
				</d:field>
				<d:field name="server" anchor="85%" prompt="区服" editor="textfield">
				   <d:event name="enter" handle="query"/>
				</d:field>
			</d:line>
		</d:form>
		<d:buttonGroup>
			<d:button id="query" title="查询" click="query" />
			<d:button title="重置" click="reset" />
		</d:buttonGroup>
		
		<d:grid id="equipmentGrid"  singleSelect="false"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('equipmentGrid')" title="装备开箱公示"  queryForm="queryForm"  model="tia/equipmentPublicity" autoQuery="true" pagerSize="50">
			<d:columns>
					<d:column name="id" sortable="true" required="true" prompt="id" width="80"  hidden="true"/>
					<d:column name="req_id" sortable="true" required="true" prompt="标识码" width="150" />
					<d:column name="equipment_name" sortable="true" required="true" prompt="装备名称"  width="150" />
					<d:column name="equipment_level" sortable="true" required="true" prompt="装备等级"  width="150" editor="combo"   options="levelStore" displayField="name" valueField="code" />
					<d:column name="server" sortable="true" required="true" prompt="区服"  width="150" />
					<d:column name="opt_user" sortable="true" required="true" prompt="操作者"  width="150" />
					<d:column name="opt_time" sortable="true" required="true" prompt="操作时间"  width="150" />
			</d:columns>
		</d:grid>
	</body>
</html>

