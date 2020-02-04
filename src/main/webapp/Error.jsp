<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 23.01.2020
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>

<html>
<head>
    <title>$Первая HTML страница$</title>
</head>
<body style=height:100%;width:100%>
<div style=background-color:rgb(158,158,158);width:100%;height:50px;text-align:center><span style=font-size:50px><a style="text-decoration:none;color:black" href="/CatshopWeb_war_exploded/ControllerServlet">Коты-котики</a></span>
</div>
<div style="text-align: center;"><h1>Erroe</h1>
    <h2><%=exception.getMessage() %><br/></h2></div>

</body>
</html>
