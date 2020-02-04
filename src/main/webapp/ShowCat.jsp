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
            width: 295px;
            position: relative;
            margin: 0 auto;
        }
        select{width:50px;}
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

        .form_grup {
            position: relative;
            margin-bottom: 32px;
            margin-top: 20px;
            marrgin-left:30px;
        }

        .form_input {
            padding: 30px 0 10px 0;
            border: none;
            border-bottom: 1px solid #e0e0e0;
            background-color: transparent;
            outline: none;
            transition: 0.3s;
        }

        .form_label {
            position: absolute;
            top: 0;
            z-index: -1;
            color: #9e9e9e;
            transition: 0.3s;

        }

        .form {
            width: 230px;
            padding: 32px;
            border-radius: 10px;
            box-shadow: 0 4px 16px #ccc;
            font-family: sans-serif;
            letter-spacing: 1px;
        }

        .form_button {
            margin:30px 30px 0px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-family: sans-serif;
            letter-spacing: 1px;
            font-size: 16px;
            color: #fff;
            background-color: #0071f0;
            cursor: pointer;
            transition: 0.3s;
        }

        .form_button:focus,
        .form_button:hover {
            background-color: rgba(0, 113, 240, 0.7);
        }
    </style>
</head>
<body style=height:100%;width:100%>
<div style=background-color:rgb(158,158,158);width:100%;height:50px;text-align:center><span style=font-size:50px><a
        style="text-decoration:none;color:black" href="ServletShow">Коты-котики</a></span>
</div>
<button class=addcat>Просмотр кота</button>
<div class=midl>
    <div  class="form">
        <!--*проверка формы*
        -->


        <form id="form1" method="post" action="ServletUpdata"><c:forEach var="cat" items="${listcat}">
            <div class="form_grup">
                <label class="form_label">Имя кота</label>
                <input id="nameCat" name="nameCat" class="form_input" value="${cat.nameCat}" <c:out
                        value="${cat.nameCat}"/>>
            </div>
            <div class="form_grup">
                <label class="form_label">ID отца</label>
                <input id="idDad" name="idDad" type="number" class="form_input" value="${cat.idDad}" <c:out value="${cat.idDad}"/>>
                <select id="iddadcats">
                    <c:forEach var="cats" items="${listcats}">
                    <c:if test="${cats.gender=='М'}">
                    <option value="${cats.idCat}">${cats.idCat}</option>
                    </c:if>
                    </c:forEach></select>
            </div>
            <div class="form_grup">
                <label class="form_label">ID матери</label>
                <input id="idMam" name="idMam" type="number" class="form_input" value="${cat.idMam}" <c:out
                        value="${cat.idMam}"/>>
                <select id="idmamcats">
                    <c:forEach var="cats" items="${listcats}">
                        <c:if test="${cats.gender=='Ж'}">
                            <option value="${cats.idCat}">${cats.idCat}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <button id="idCat" name="idCat" class="form_button" value="${cat.idCat}" <c:out value="${cat.idCat}"/>>
                Записать кота
            </button>
        </c:forEach>
        </form>
        <form method="post" action="ServletDelete" onsubmit="if(check()==false)return false">
            <button id="idCatdelete" name="delete" class="form_button" onclick="x1()"<c:out value="${cat.idCat}"/> style="margin-top:0px;width:157.59px">Удалить кота
            </button>
        </form>
    </div>
</div>
<script>
    $('select#iddadcats').on('change', function() {
        $('input[name="idDad"]').val(this.value);
    });
    $('select#idmamcats').on('change', function() {
        $('input[name="idMam"]').val(this.value);
    });
    function check() {

        if (confirm('Вы уверены?') == false) {
            return false;
        }
    }
     function x1() {

        document.getElementById("idCatdelete").value=document.getElementById("idCat").value;
      }

</script>
</body>
</html>
