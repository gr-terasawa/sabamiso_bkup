<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Confirm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/sabamiso/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <!-- <link href="resources/css/signin/signin.css" rel="stylesheet"> -->
    <style type="text/css">

    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<form:form action="finish" method="POST" modelAttribute="form">
		<form:hidden path="user.id" />
		<table class="table">
			<tr>
				<th><spring:message code="model.user.name" /><br></th>
				<td><spring:bind path="user.name">${status.value}</spring:bind></td>
			</tr>
			<tr>
				<th><spring:message code="model.user.age" /><br></th>
				<td><spring:bind path="user.age">${status.value}</spring:bind>
					<form:hidden path="user.age" /></td>
			</tr>
			<tr>
				<th><spring:message code="model.user.upDate" /><br></th>
				<td><spring:bind path="user.upDate">${status.value}</spring:bind>
					<form:hidden path="user.upDate" /></td>
			</tr>
		</table>

		<input type="submit" value="完了" />
	</form:form>

</body>
</html>