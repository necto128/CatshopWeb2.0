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
    <meta http-equiv="Content-Type; content=text/html charset=utf-8">
    <script src="https://snipp.ru/cdn/jquery/2.1.1/jquery.min.js"></script>
    <title>$Первая HTML страница$</title>
    <style type=text/css>
        .addcat {
            width: 290px;
            height: 30px;
            display: block;
            position: relative;
            border: 1px solid grey;
            margin: 10px auto;
            background: grey;
        }

        .addcat:hover {
            background: white;
        }

        .cat:hover {
            background: white;
        }

        .cat {
            width: 280px;
            height: 30px;
            display: block;
            position: relative;
            border: 1px solid grey;
            margin: 0 auto;
            background: grey;
            background-color: rgb(158, 158, 158);
            text-align: justify
        }

        .midl {
            width: 350px;
            position: relative;
            margin: 0 auto;
        }

        .shapka {
            width: 278px;
            height: 30px;
            position: relative;
            border: 1px solid grey;
            margin: 0 auto;
            background: grey;
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
            max-width: 350px;
        }

        /* Checked */
        .form_radio_btn input[type=radio]:checked + label {
            background: #ffe0a6;
            margin-left: 15px;
        }

        /* Hover */
        .form_radio_btn label:hover {
            color: #666;
        }

        .px30 {
            margin-right: 30px;
        }
    </style>

</head>
<body style=height:100%;width:100%>
<div style=background-color:rgb(158,158,158);width:100%;height:50px;text-align:center><span style=font-size:50px>Коты-котики</span>
</div>
<div class=midl>
    <form action="initAddCat" method="get"><button class=addcat >Добавить кота</button></form>
    <div style="margin:0 auto;">
        <table border="1" cellpadding="2" width="280px" style="margin:0 auto;">
            <tr>
                <th colspan="2" class="shapka"><span class="px30">ID кота</span><span class="px30">Имя</span></th>
            </tr>


            <c:forEach var="cat" items="${listcat}">
            <tr class="form_radio_btn">
                <td colspan="2"><input id="${cat.idCat}" type="radio" name="radio" value="<c:out value='${cat.idCat}'/>"
                                       checked>
                    <label for="${cat.idCat}"><span
                            style=margin-right:70px;margin-left:20px;>${cat.idCat}</span><span>${cat.nameCat}</span></label>
                </td>
            </tr>
            </c:forEach>

    </div>
    <tr><form method="post" action="ServletCheck">
        <td colspan="2">
            <button name="check" id="check" class=cat onclick="shipment()" <c:out value="${cat.idCat}"/>>Просмотреть</Button>
        </td></form>
    </tr>
    <form name="form1" onsubmit="if(check()==false)return false" action="ServletDelete"
          method="post">
        <tr>
            <td colspan="2">
                <button id="delete" name="delete" onclick="shipment()"  <c:out value="${cat.idCat}"/> class=cat>
                    Удалить
                </Button>
            </td>
        </tr>
    </form>
</div>
</table>
<script>

    function check() {

        if (confirm('Вы уверены?') == false) {
            return false;
        }
    }
    function shipment(){
    $('input:radio:checked').each(function () {
        document.getElementById("delete").value = $(this).val();
        document.getElementById("check").value = $(this).val();
    })};
</script>
</body>
</html>
