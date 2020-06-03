<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>家族技能书商城</title>
		<d:includeLibrary />
	</head>
	<script type="text/javascript">

        function isCellEditable(col,row,name,record) {
            return true;
        }
        
		function query() {
			bookGrid.query();
		}
		
		function reset() {
			queryForm.reset();
		}

		var levelStore = new Ext.data.SimpleStore( {
			data : [ [ "5", "中阶初级技能" ]],
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
				<d:field name="book_name" anchor="85%" prompt="技能名称"  editor="textfield">
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
		
		<d:grid id="bookGrid"  singleSelect="false"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('bookGrid')" title="家族技能书商城"  queryForm="queryForm"  model="tia/familySkillbookStore" autoQuery="true" pagerSize="100">
			<d:toolBar>
				<d:gridButton type="add"  />
				<d:gridButton type="save"  />
				<d:gridButton type="delete" />
				<d:gridButton type="excel" />
			</d:toolBar>
			<d:columns>
					<d:column name="family_book_id" sortable="true" required="true" prompt="id" width="80"  hidden="true"/>
					<d:column name="book_name" sortable="true" required="true" prompt="技能名称"  width="150" editor="textfield"/>
					<d:column name="profession" sortable="true" required="true" prompt="职业"  width="150" editor="combo" options="professionStore" displayField="name" valueField="code"/>
					<d:column name="book_level" sortable="true" required="true" prompt="技能等级"  width="150" editor="combo" options="levelStore" displayField="name" valueField="code"/>
					<d:column name="worth_integral" sortable="true" required="true" prompt="积分价值"  width="150" editor="numberfield"/>
					<d:column name="worth_coin" sortable="true" required="true" prompt="金币价值"  width="150" editor="numberfield"/>
			</d:columns>
		</d:grid>
	</body>
</html>

