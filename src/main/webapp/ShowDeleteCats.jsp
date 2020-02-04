<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 23.01.2020
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="https://snipp.ru/cdn/jquery/2.1.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type; content=text/html charset=utf-8">
    <title>$Первая HTML страница$</title>
    <style type="text/css">
        .addcat {
            width: 280px;
            height: 30px;
            display: block;
            position: relative;
            border: 1px solid grey;
            margin: 10px auto;
            background: grey;
        }

        .midl {
            width: 500px;
            position: relative;
            margin: 0 auto;
        }

        .shapka {
            background: grey;
            position: relative;
            margin-right: 30px;

        }

        td, th {
            text-align: center;
        }

        .form_radio_btn {
            display: inline-block;
            margin: 0px auto;
        }

        .form_radio_btn input[type=radio] {
            display: none;
        }

        .form_radio_btn label {
            display: inline-block;
            cursor: pointer;
            padding: 0px 15px;
            line-height: 34px;
            border: 1px solid #999;
            border-radius: 6px;
            user-select: none;
        }

        .px30 {
            margin-right: 30px;
            text-align: center;
        }
    </style>
</head>
<body style=height:100%;width:100%>
<div style=background-color:rgb(158,158,158);width:100%;height:50px;text-align:center><span style=font-size:50px><a style="text-decoration:none;color:black" href="ServletShow">Коты-котики</a></span>
</div>
<button class=addcat>Последний раз видим</button>
<div class=midl method="get">
    <div style="width:600px;">
        <table border="1" cellpadding="5" width="550px">
            <tr>
                <span><th class="shapka"><span class="px30">ID кота</span></th></span>
                <span><th class="shapka"><span class="px30">Имя</span></th></span>
                <span><th class="shapka"><span class="px30">ID отца</span></th></span>
                <span><th class="shapka"><span class="px30">ID матери</span></th></span>
                <span><th class="shapka"><span class="px30">Пол</span></th></span>
            </tr>
            <c:forEach var="cat" items="${listcat}">
                <div class="form_radio_btn" style="text-align: center;">
                    <tr>
                        <td><span class="px30">${cat.idCat}</span></td>
                        <td><span class="px30">${cat.nameCat}</span></td>
                        <td><span class="px30">${cat.idDad}</span></td>
                        <td><span class="px30">${cat.idMam}</span></td>
                        <td><span class="px30">${cat.gender}</span></td>
                    </tr>
                </div>
                </br>
            </c:forEach>
        </table>
    </div>
<script>
      setTimeout(function () {
          window.location.href = 'ServletShow';
      }, 5 * 1000);
</script>
</body>
</html>
