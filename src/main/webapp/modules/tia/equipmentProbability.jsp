<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>装备概率分析</title>
		<d:includeLibrary />
		<link rel="stylesheet" href="${basePath}css/an-skill-bar.css">
		<link rel="stylesheet" href="${basePath}css/main.css">
	</head>
	<script type="text/javascript">

		function renderProgress(v){
			var cssstyle='one';
	        if(v<=10){
	        	cssstyle='one';
	        }else if(v<=20){
	        	cssstyle='two';
	        }else if(v<=30){
	        	cssstyle='three';
	        }else if(v<=40){
	        	cssstyle='four';
	        }else if(v<=50){
	        	cssstyle='five';
	        }else if(v<=60){
	        	cssstyle='six';
	        }else if(v<=70){
	        	cssstyle='seven';
	        }else if(v<=80){
	        	cssstyle='eight';
	        }else if(v<=90){
	        	cssstyle='nine';
	        }else if(v<=100){
	        	cssstyle='ten';
	        }
	        return '<div class="skillbar '+cssstyle+'"><div class="filled" data-width="'+v+'%"></div><span class="percent">'+v+'%</span></div>';
	    }
	    
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
			data : [ [ "3", "二阶通用装备" ], [ "4", "二阶专属装备" ],[ "5", "三阶通用装备" ], [ "6", "三阶专属装备" ] ],
			fields : [ "code", "name" ]
		});
		
		var typeStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "头盔" ], [ "2", "衣服" ],[ "3", "副手" ], [ "4", "武器" ],[ "5", "手" ], [ "6", "脚" ] ],
			fields : [ "code", "name" ]
		});
		
		var professionStore = new Ext.data.SimpleStore( {
			data : [ [ "1", "剑士" ], [ "2", "骑士" ],[ "3", "武士" ], [ "4", "战士" ],[ "5", "弓箭手" ], [ "6", "猎人" ],[ "7", "枪手" ], [ "8", "刺客" ], [ "9", "魔法学徒" ],[ "10", "法师" ], [ "11", "牧师" ],[ "12", "萨满" ] ],
			fields : [ "code", "name" ]
		});

	</script>
	<body>
		<d:form id="queryForm" title="查询条件" labelWidth="80">
			<d:line columnWidth="0.33">
				<d:field name="equipment_level" anchor="85%" prompt="装备等级"  editor="combo"   options="levelStore" displayField="name" valueField="code" required="true" >
				   <d:event name="select" handle="query"/>
				</d:field>
			</d:line>
		</d:form>
		<d:buttonGroup>
			<d:button id="query" title="查询" click="query" />
			<d:button title="重置" click="reset" />
		</d:buttonGroup>
		
		<d:grid id="equipmentGrid"  singleSelect="false"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('equipmentGrid')" title="装备概率分析"  queryForm="queryForm"  queryUrl="tia/equipmentProbability.do!query" pagerSize="100" >
			<d:columns>
					<d:column name="id" sortable="false" required="true" prompt="id" width="80"  hidden="true"/>
					<d:column name="equipment_name" sortable="false" required="true" prompt="装备名称"  width="150" editor="textfield"/>
					<d:column name="equipment_type" sortable="false" required="true" prompt="装备类型"  width="150" editor="combo" options="typeStore" displayField="name" valueField="code" />
					<d:column name="profession" sortable="false" required="true" prompt="职业"  width="150" editor="combo" options="professionStore" displayField="name" valueField="code"/>
					<d:column name="probability" sortable="false" required="true" prompt="初始概率"  width="150" editor="numberfield" />
					<d:column name="real_probability" sortable="false" required="true" prompt="当前概率"  width="150" editor="numberfield" renderer="renderProgress"/>
			</d:columns>
		</d:grid>
	</body>
	<script type="text/javascript" src="${basePath}js/an-skill-bar.js"></script>
	<script type="text/javascript">
		equipmentGrid.getStore().on("load",function(){
			$('.skillbar').skillbar({
		        speed: 1000,
		    });
		});
	</script>
</html>

