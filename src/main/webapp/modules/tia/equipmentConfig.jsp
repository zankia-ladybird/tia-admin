<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>装备配置</title>
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
			equipmentGrid.query();
		}
		
		function reset() {
			queryForm.reset();
		}

		var levelStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "一阶通用装备" ], [ "2", "一阶专属装备" ],[ "3", "二阶通用装备" ], [ "4", "二阶专属装备" ],[ "5", "三阶通用装备" ], [ "6", "三阶专属装备" ],[ "7", "四阶通用装备" ], [ "8", "四阶专属装备" ]],
			fields : [ "code", "name" ]
		});
		
		var typeStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "头盔" ], [ "2", "衣服" ],[ "3", "副手" ], [ "4", "武器" ],[ "5", "手" ], [ "6", "脚" ],[ "7", "项链" ], [ "8", "腰带" ], [ "9", "水袋" ]],
			fields : [ "code", "name" ]
		});
		
		var professionStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "剑士" ], [ "2", "骑士" ],[ "3", "武士" ], [ "4", "战士" ],[ "5", "弓箭手" ], [ "6", "猎人" ],[ "7", "枪手" ], [ "8", "刺客" ], [ "9", "魔法学徒" ],[ "10", "法师" ], [ "11", "牧师" ],[ "12", "萨满" ],[ "13", "通用职业" ]],
			fields : [ "code", "name" ]
		});

	</script>
	<body>
		<d:form id="queryForm" title="查询条件" labelWidth="80">
			<d:line columnWidth="0.33">
				<d:field name="profession" anchor="85%" prompt="职业"  editor="lovcombo" options="professionStore" displayField="name" valueField="code" >
				   <d:event name="select" handle="query"/>
				</d:field>
				<d:field name="equipment_name" anchor="85%" prompt="装备名称"  editor="textfield">
				   <d:event name="enter" handle="query"/>
				</d:field>
				<d:field name="equipment_level" anchor="85%" prompt="装备等级"  editor="combo"   options="levelStore" displayField="name" valueField="code" >
				   <d:event name="select" handle="query"/>
				</d:field>
			</d:line>
		</d:form>
		<d:buttonGroup>
			<d:button id="query" title="查询" click="query" />
			<d:button title="重置" click="reset" />
		</d:buttonGroup>
		
		<d:grid id="equipmentGrid"  singleSelect="false"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('equipmentGrid')" title="装备配置"  queryForm="queryForm"  model="tia/equipmentConfig" autoQuery="true" pagerSize="50">
			<d:toolBar>
				<d:gridButton type="add"  />
				<d:gridButton type="save"  />
				<d:gridButton type="delete" />
			</d:toolBar>
			<d:columns>
					<d:column name="id" sortable="true" required="true" prompt="id" width="80"  hidden="true"/>
					<d:column name="profession" sortable="true" required="true" prompt="职业"  width="150" editor="combo" options="professionStore" displayField="name" valueField="code"/>
					<d:column name="equipment_type" sortable="true" required="true" prompt="装备类型"  width="150" editor="combo" options="typeStore" displayField="name" valueField="code" />
					<d:column name="equipment_name" sortable="true" required="true" prompt="装备名称"  width="150" editor="textfield"/>
					<d:column name="equipment_level" sortable="true" required="true" prompt="装备等级"  width="150" editor="combo" options="levelStore" displayField="name" valueField="code" />
					<d:column name="score" sortable="true" required="true" prompt="数字标识"  width="150" editor="numberfield"/>
			</d:columns>
		</d:grid>
	</body>
</html>

