<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>技能配置</title>
		<d:includeLibrary />
		<script type="text/javascript" src="${basePath}js/jquery-3.1.0.min.js"></script>
	</head>
	<script type="text/javascript">

        function isCellEditable(col, row,name,record) {
            return true;
        }
        
		function query() {
			equipmentGrid.query();
		}
		
		function reset() {
			queryForm.reset();
		}

		var levelStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "低阶初级技能" ], [ "2", "低阶中级技能" ],[ "3", "低阶高级技能" ], [ "4", "低阶超级技能" ],[ "5", "中阶初级技能" ], [ "6", "中阶中级技能" ],[ "7", "中阶高级技能" ], [ "8", "中阶超级技能" ],[ "9", "高阶初级技能" ], [ "10", "高阶中级技能" ],[ "11", "高阶高级技能" ], [ "12", "高阶超级技能" ]],
			fields : [ "code", "name" ]
		});
		
		var professionStore = new Ext.data.SimpleStore( {
			data : [ [ "2", "骑士" ],[ "3", "武士" ], [ "4", "战士" ], [ "6", "猎人" ],[ "7", "枪手" ], [ "8", "刺客" ],[ "10", "法师" ], [ "11", "牧师" ],[ "12", "萨满" ]],
			fields : [ "code", "name" ]
		});

	</script>
	<body>
		<d:form id="queryForm" title="查询条件" labelWidth="80">
			<d:line columnWidth="0.33">
				<d:field name="profession" anchor="85%" prompt="职业"  editor="lovcombo" options="professionStore" displayField="name" valueField="code" >
				   <d:event name="select" handle="query"/>
				</d:field>
				<d:field name="book_name" anchor="85%" prompt="技能名称"  editor="textfield">
				   <d:event name="enter" handle="query"/>
				</d:field>
				<d:field name="book_level" anchor="85%" prompt="技能等级"  editor="combo"   options="levelStore" displayField="name" valueField="code" >
				   <d:event name="select" handle="query"/>
				</d:field>
			</d:line>
		</d:form>
		<d:buttonGroup>
			<d:button id="query" title="查询" click="query" />
			<d:button title="重置" click="reset" />
		</d:buttonGroup>
		
		<d:grid id="equipmentGrid"  singleSelect="false"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('equipmentGrid')" title="技能配置"  queryForm="queryForm"  model="tia/skillbookConfig" autoQuery="true" pagerSize="50">
			<d:toolBar>
				<d:gridButton type="add"  />
				<d:gridButton type="save"  />
				<d:gridButton type="delete" />
			</d:toolBar>
			<d:columns>
					<d:column name="id" sortable="true" required="true" prompt="id" width="80"  hidden="true"/>
					<d:column name="profession" sortable="true" required="true" prompt="职业"  width="150" editor="combo" options="professionStore" displayField="name" valueField="code"/>
					<d:column name="book_name" sortable="true" required="true" prompt="技能名称"  width="150" editor="textfield"/>
					<d:column name="book_level" sortable="true" required="true" prompt="技能等级"  width="150" editor="combo"   options="levelStore" displayField="name" valueField="code" />
					<d:column name="score" sortable="true" required="true" prompt="数字标识"  width="150" editor="numberfield"/>
			</d:columns>
		</d:grid>
	</body>
</html>

