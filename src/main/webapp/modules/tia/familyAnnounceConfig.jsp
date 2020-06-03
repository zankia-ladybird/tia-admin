<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>家族公告配置</title>
		<d:includeLibrary />
		<style>
		    * {
		        padding: 0;
		        margin: 0;
		        border: 0;
		        font: inherit;
		        vertical-align: baseline;
		        -webkit-box-sizing: border-box;
		        -moz-box-sizing: border-box;
		        box-sizing: border-box;
		    }
		    html {
		        height: 100%;
		    }
		    body {
		        height: 100%;
		        overflow: hidden;
		        font: 100%/1.25 Helvetica, Arial, sans-serif;
		        -webkit-perspective: 1000px;
		        -moz-perspective: 1000px;
		        -ms-perspective: 1000px;
		        -o-perspective: 1000px;
		        perspective: 1000px;
		    }
		    h1 {
		        font-size: 2em;
		    }
		    .book {
		        width: 500px;
		        height: 741px;
		        margin-top: -150px;
		        position: absolute;
		        left: 50%;
		        top: 20%;
		        -webkit-transform: rotateX(30deg);
		        -moz-transform: rotateX(30deg);
		        -ms-transform: rotateX(30deg);
		        -o-transform: rotateX(30deg);
		        transform: rotateX(30deg);
		        -webkit-user-select: none;
		        -moz-user-select: none;
		        -ms-user-select: none;
		        -o-user-select: none;
		        user-select: none;
		    }
		    .page {
		        width: 500px;
		        height: 741px;
		        padding: 1em;
		        position: absolute;
		        left: 0;
		        top: 0;
		        text-indent: 2em;
		    }
		    .front {
		        background-color: #fefdf2;
		    }
		    .back {
		        background-color: #fff;
		    }
		    .front-cover {
		        cursor: move;
		        -webkit-transform-origin: 0 50%;
		        -moz-transform-origin: 0 50%;
		        -ms-transform-origin: 0 50%;
		        -o-transform-origin: 0 50%;
		        transform-origin: 0 50%;
		        -webkit-transform: rotateY(0deg);
		        -moz-transform: rotateY(0deg);
		        -ms-transform: rotateY(0deg);
		        -o-transform: rotateY(0deg);
		        transform: rotateY(0deg);
		    }
		    .front-cover .back {
		        background-image: url(images/announce/mdn.png);
		        background-repeat: no-repeat;
		        background-position: 50% 50%;
		        -webkit-transform: translateZ(3px);
		        -moz-transform: translateZ(3px);
		        -ms-transform: translateZ(3px);
		        -o-transform: translateZ(3px);
		        transform: translateZ(3px);
		    }
		    .back-cover .back {
		        -webkit-transform: translateZ(-3px);
		        -moz-transform: translateZ(-3px);
		        -ms-transform: translateZ(-3px);
		        -o-transform: translateZ(-3px);
		        transform: translateZ(-3px); 
		    }
		    .p3d {
		        -webkit-transform-style: preserve-3d;
		        -moz-transform-style: preserve-3d;
		        -ms-transform-style: preserve-3d;
		        -o-transform-style: preserve-3d;
		        transform-style: preserve-3d;
		    }
		    .flip {
		        -webkit-transform: rotateY(180deg);
		        -moz-transform: rotateY(180deg);
		        -ms-transform: rotateY(180deg);
		        -o-transform: rotateY(180deg);
		        transform: rotateY(180deg);
		    }
		    .dino,
		    .shadow {
		        width: 196px;
		        height: 132px;
		        position: absolute;
		        left: 60px;
		        top: 60px;
		        -webkit-transform-origin: 0 100%;
		        -moz-transform-origin: 0 100%;
		        -ms-transform-origin: 0 100%;
		        -o-transform-origin: 0 100%;
		        transform-origin: 0 100%;
		    }
		</style>
	</head>
	<script type="text/javascript">

        function isCellEditable(col,row,name,record) {
            return true;
        }
        
		function query() {
			announceGrid.query();
		}
		
		$(function(){
			$(".book").hide();
		})
		
		function editparams() {
			var datas=announceGrid.getSelectionsData(true);
	    	var content=datas[0].announcement_content;
	    	$("#front-page-content").html(content);
	    	$(".book").fadeIn();
		}
		
		function closeparams() {
			$(".book").fadeOut();
		}

	</script>
	<body>
		<d:grid id="announceGrid"  singleSelect="true"  isCellEditable="isCellEditable"  forceFit="true"  selectFirstRow="false" height="$D.getFullHeight('announceGrid')" title="家族公告配置"   model="tia/familyAnnounceConfig" autoQuery="true" pagerSize="50">
			<d:toolBar>
				<d:gridButton id="editparams" title="阅读公告" beforeAction="editparams" disabled="true" icon="${basePath}images/page_white_edit.png"/>
				<d:gridButton id="closeparams" title="关闭公告" beforeAction="closeparams" disabled="true" icon="${basePath}images/remove.gif"/>
			</d:toolBar>
			<d:columns>
					<d:column name="announcement_id" sortable="true" required="true" prompt="ID" width="80" />
					<d:column name="announcement_title" sortable="true" required="true" prompt="公告标题"  width="150"/>
					<d:column name="announcement_content" sortable="true" required="true" prompt="公告内容"  width="150" editor="textfield" hidden="true"/>
					<d:column name="relase_by" sortable="true" required="true" prompt="发布者"  width="150" />
					<d:column name="release_date" sortable="true" required="true" prompt="发布时间"  width="150" />
					<d:column name="update_by" sortable="true" required="true" prompt="更新者"  width="150"/>
					<d:column name="update_date" sortable="true" required="true" prompt="更新时间"  width="150" />
			</d:columns>
		</d:grid>
		<div class="book p3d">
		    <div class="back-cover p3d">
		        <div class="page back flip"></div>
		        <div class="page front p3d">
		        </div>
		    </div>
		    <div class="front-cover p3d">
		        <div id="front-page-content" class="page front flip p3d">
		        </div>
		        <div id="back-page-content" class="page back">
		        </div>
		    </div>
		</div>
	</body>
	<script>
		function rowSelected(sm, row, rec) {
	        var record_all = announceGrid.getSelectionModel().getSelections();
	        if (record_all.length === 1) {
	        	Ext.getCmp("editparams").enable();
	        	Ext.getCmp("closeparams").enable();
	        } else {
	            Ext.getCmp("editparams").disable();
	            Ext.getCmp("closeparams").disable();
	        }
	    }
		announceGrid.getSelectionModel().on("selectionchange", rowSelected);
		 
	    (function (window, document) {
	        var prefixes = ['Webkit', 'Moz', 'ms', 'O', ''],
	            book = document.querySelectorAll('.book')[0],
	            page = document.querySelectorAll('.front-cover')[0],
	            dino = document.querySelectorAll('.dino')[0],
	            shadow = document.querySelectorAll('.shadow')[0],
	            hold = false,
	            centerPoint = window.innerWidth / 2,
	            pageSize = 300,
	            clamp = function (val, min, max) {
	                return Math.max(min, Math.min(val, max));
	            };
	
	        page.onmousedown = function () {
	            hold = true;
	        };
	
	        window.onmouseup = function () {
	            if (hold) {
	                hold = false;
	            }
	        };
	
	        window.onresize = function () {
	            centerPoint = window.innerWidth / 2;
	        };
	
	        window.onmousemove = function (evt) {
	            if (!hold) {
	                return;
	            }
	
	            var angle = clamp((centerPoint - evt.pageX + pageSize) / pageSize * -90, -180, 0),
	                i, j;
	
	            for (i = 0, j = prefixes.length; i < j; i++) {
	                book.style[prefixes[i] + 'Transform'] = 'rotateX(' + (30 + angle / 8) + 'deg)';
	                page.style[prefixes[i] + 'Transform'] = 'rotateY(' + angle + 'deg)';
	                dino.style[prefixes[i] + 'Transform'] = 'rotateX(' + (angle / 2) + 'deg)';
	                shadow.style[prefixes[i] + 'Transform'] = 'translateZ(1px) skewX(' + (angle / 8) + 'deg)';
	            }
	        };
	
	    })(window, document);
	</script>
</html>

