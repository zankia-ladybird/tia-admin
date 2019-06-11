<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>技能书概率分析</title>
		<d:includeLibrary />
		<link rel="stylesheet" href="${basePath}css/an-skill-bar.css">
		<link rel="stylesheet" href="${basePath}css/main.css">
	</head>
	<script type="text/javascript">

		function renderProgress(v){
			var cssstyle='one';
	        if(v<=5){
	        	cssstyle='one';
	        }else if(v<=10){
	        	cssstyle='two';
	        }else if(v<=15){
	        	cssstyle='three';
	        }else if(v<=20){
	        	cssstyle='four';
	        }else if(v<=25){
	        	cssstyle='five';
	        }else if(v<=30){
	        	cssstyle='six';
	        }else if(v<=35){
	        	cssstyle='seven';
	        }else if(v<=40){
	        	cssstyle='eight';
	        }else if(v<=45){
	        	cssstyle='nine';
	        }else if(v<=50){
	        	cssstyle='ten';
	        }else{
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
			data : [ [ "1", "低阶初级技能" ],[ "2", "低阶中级技能" ],[ "5", "中阶初级技能" ], [ "6", "中阶中级技能" ],[ "9", "高阶初级技能" ]],
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
				<d:field name="book_level" anchor="85%" prompt="技能等级"  editor="combo"   options="levelStore" displayField="name" valueField="code" required="true" >
				   <d:event name="select" handle="query"/>
				</d:field>
			</d:line>
		</d:form>
		<d:buttonGroup>
			<d:button id="query" title="查询" click="query" />
			<d:button title="重置" click="reset" />
		</d:buttonGroup>
		
		<d:grid id="equipmentGrid"  singleSelect="false"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('equipmentGrid')" title="技能概率分析"  queryForm="queryForm"  queryUrl="tia/skillbookProbability.do!query" pagerSize="200" >
			<d:columns>
					<d:column name="id" sortable="false" required="true" prompt="id" width="80"  hidden="true"/>
					<d:column name="book_name" sortable="false" required="true" prompt="技能名称"  width="150" editor="textfield"/>
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

