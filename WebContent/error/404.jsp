<!doctype html>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  isErrorPage="true"%>
<html>
<head>
<meta charset="utf-8">
<title>404</title>
<link href="<%=request.getContextPath()%>/error/css/error.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="wt-error wt-404" >
</div>
<div class="wt-a" onclick="location.href='<%=request.getContextPath()%>';">返回首页</div>
</body>
</html>
