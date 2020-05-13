<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
	<d:includeLibrary />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>概率分析平台</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${basePath}home/assets/css/normalize.css">
	<link rel="stylesheet" href="${basePath}home/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${basePath}home/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="${basePath}home/assets/css/themify-icons.css">
	<link rel="stylesheet" href="${basePath}home/assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="${basePath}home/assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="${basePath}home/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${basePath}home/assets/css/style.css">
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    
	<link href="${basePath}home/assets/css/charts/chartist.min.css" rel="stylesheet">
	<link href="${basePath}home/assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
	<script type="text/javascript" charset="utf-8" async="" src="https://cdn.jsdelivr.net/npm/live2d-widget@3.0.4/lib/L2Dwidget.min.js"></script>

   <style>
    #weatherWidget .currentDesc {
        color: #ffffff!important;
    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }

    </style>
</head>

<body>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
            	<d:query modelName="sys/menu"  rootPath="menuList"></d:query>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/home/index.jsp"><i class="menu-icon fa fa-laptop"></i>首页 </a>
                    </li>
                    <d:forEach items="${menuList}" var="menu">
			        	<d:if test="${menu.pid==null}">
							<li class="menu-item-has-children dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ${menu.icon}"></i>${menu.text}</a>
	                        <ul class="sub-menu children dropdown-menu">                
			        	    	<d:forEach items="${menuList}" var="child">
									<d:if test="${child.pid==menu.id}">
										 <li><i class="${child.icon}"></i><a href="../${child.url}" target="body_iframe">${child.text}</a></li>
									</d:if>
								</d:forEach>
							 </ul>
	            			</li>
			        	</d:if>
			     	</d:forEach>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/home/index.jsp"><img src="${basePath}home/images/logo.png" height="40" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="${basePath}home/images/admin.jpg" alt="User Avatar">
                        </a>
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" onclick="logout();"><i class="fa fa-power -off"></i>退出登录</a>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
        	<script type="text/javascript">
	            var height = 0;
	    		if(document.documentElement && document.documentElement.clientHeight>height){
	    			height = document.documentElement.clientHeight;
	    		}
	    		if(document.body && document.body.clientHeight>height){
	    			height=document.body.clientHeight;
	    		}
	    		height = height - 130;
	    		document.write("<iframe name='body_iframe' src='../welcome.jsp' frameBorder=0 width='100%' height='"+height+"' ></iframe>");
            </script>
        </div>
    </div>
    <!-- /#right-panel -->

    <script src="${basePath}home/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script src="${basePath}home/assets/js/popper.min.js"></script>
	<script src="${basePath}home/assets/js/plugins.js"></script>
	<script src="${basePath}home/assets/js/main.js"></script>
	
	<script src="${basePath}home/assets/js/lib/chartist/chartist.min.js"></script>
	<script src="${basePath}home/assets/js/lib/chartist/chartist-plugin-legend.js"></script>
	<script src="${basePath}home/assets/js/lib/flot-chart/jquery.flot.js"></script>
	<script src="${basePath}home/assets/js/lib/flot-chart/jquery.flot.pie.js"></script>
	<script src="${basePath}home/assets/js/lib/flot-chart/jquery.flot.spline.js"></script>
	<script src="${basePath}home/assets/js/moment/moment.js"></script>
	<script type="text/javascript">
		function logout() {
			$.ajax({
				type: "POST", //提交的方法
				async: true,
				url:"sys/login.execute!logout", //提交的地址
				success: function(data) { //成功
					window.location.href="/";
				}
			});
		}
	</script>
	<script type="text/javascript">
		setTimeout(() => {
		        L2Dwidget.init({
		                "model": {
		                        "scale": 0.5
		                },
		               "display": {
		                        "position": "right",
		                        "width": 180,
		                       "height": 260,
		                        "hOffset": 0,
		                        "vOffset": -20
		                },
		                 "mobile": {
		                        "show": true,
		                       "scale": 0.5
		                 },
		                 "react": {
		                         "opacityDefault": 0.7,
		                        "opacityOnHover": 0.2
		                 }
		        });
		 }, 1000)
 	 </script>
</body>
</html>