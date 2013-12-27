<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Input</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/sabamiso/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <!-- <link href="resources/css/signin/signin.css" rel="stylesheet"> -->
    <style type="text/css">
body {padding-top:100px;}
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">SABAMISO</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li>
                <c:if test="${not empty userName}"><a href="#">${userName}</a></c:if>
            </li>
            <li><a href="<c:url value='j_spring_security_logout' />">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
<div class="container">
	<div class="panel panel-default">
	  <div class="panel-heading"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;ユーザ情報</div>
	  <div class="panel-body">
		<form:form action="confirm" method="POST" modelAttribute="form" class="form-horizontal" role="form">
		<form:hidden path="user.id" />
		  <div class="form-group">
		    <label for="user.name" class="col-sm-2 control-label"><spring:message code="model.user.name" /></label>
		    <div class="col-sm-10">
		      <label class="control-label"><spring:bind path="user.name">${status.value}</spring:bind></label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="user.age" class="col-sm-2 control-label"><spring:message code="model.user.age" /></label>
		    <div class="col-sm-10">
		      <form:input path="user.age" class="form-control" id="user.age" placeholder="年齢"/>
		      <div class="alert alert-danger" style="margin-top:10px"><form:errors path="user.age"/></div>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="user.upDate" class="col-sm-2 control-label"><spring:message code="model.user.upDate" /></label>
		    <div class="col-sm-10">
		      <form:input path="user.upDate" maxlength="10" class="form-control" id="user.upDate" placeholder="更新日"/>
		      <div class="alert alert-danger" style="margin-top:10px"><form:errors path="user.upDate"/></div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-primary">確認</button>
		    </div>
		  </div>
		</form:form>
	  </div>
	</div>
</div>

</body>
</html>