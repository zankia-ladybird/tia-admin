<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>家族成员配置</title>
		<d:includeLibrary />
	</head>
	<script type="text/javascript">

        function isCellEditable(col,row,name,record) {
            return true;
        }
        
		function query() {
			memberGrid.query();
		}
		
		function reset() {
			queryForm.reset();
		}

		var professionStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "剑士" ], [ "2", "骑士" ],[ "3", "武士" ], [ "4", "战士" ],[ "5", "弓箭手" ], [ "6", "猎人" ],[ "7", "枪手" ], [ "8", "刺客" ], [ "9", "魔法学徒" ],[ "10", "法师" ], [ "11", "牧师" ],[ "12", "萨满" ]],
			fields : [ "code", "name" ]
		});
		
		var positionStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "族长" ], [ "2", "家族总管" ],[ "3", "家族队长" ], [ "4", "家族精英" ], [ "5", "家族成员" ]],
			fields : [ "code", "name" ]
		});
		
		var statusStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "游戏中" ], [ "2", "退出家族" ], [ "3", "弃坑" ]],
			fields : [ "code", "name" ]
		});

	</script>
	<body>
		<d:form id="queryForm" title="查询条件" labelWidth="80">
			<d:line columnWidth="0.33">
				<d:field name="member_nickname" anchor="85%" prompt="用户名称"  editor="textfield">
				   <d:event name="enter" handle="query"/>
				</d:field>
				<d:field name="profession" anchor="85%" prompt="职业"  editor="combo" options="professionStore" displayField="name" valueField="code" >
				   <d:event name="select" handle="query"/>
				</d:field>
			</d:line>
		</d:form>
		<d:buttonGroup>
			<d:button id="query" title="查询" click="query" />
			<d:button title="重置" click="reset" />
		</d:buttonGroup>
		
		<d:grid id="memberGrid"  singleSelect="false"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('memberGrid')" title="家族成员配置"  queryForm="queryForm"  model="tia/familyMemberConfig" autoQuery="true" pagerSize="50">
			<d:toolBar>
				<d:gridButton type="add"  />
				<d:gridButton type="save"  />
				<d:gridButton type="delete" />
			</d:toolBar>
			<d:columns>
					<d:column name="family_member_id" sortable="true" required="true" prompt="id" width="80"  hidden="true"/>
					<d:column name="member_nickname" sortable="true" required="true" prompt="用户名称"  width="150" editor="textfield"/>
					<d:column name="profession" sortable="true" required="true" prompt="职业"  width="150" editor="combo" options="professionStore" displayField="name" valueField="code"/>
					<d:column name="level" sortable="true" required="true" prompt="等级"  width="150" editor="numberfield"/>
					<d:column name="position" sortable="true" required="true" prompt="家族职位"  width="150" editor="combo" options="positionStore" displayField="name" valueField="code"/>
					<d:column name="join_time" sortable="true" required="true" prompt="加入时间"  width="150" editor="datefield"/>
					<d:column name="status" sortable="true" required="true" prompt="状态"  width="150" editor="combo" options="statusStore" displayField="name" valueField="code"/>
			</d:columns>
		</d:grid>
	</body>
</html>

