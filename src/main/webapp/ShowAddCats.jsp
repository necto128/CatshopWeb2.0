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
        style="text-decoration:none;color:black" href="/CatshopWeb_war_exploded/ServletShow">Коты-котики</a></span>
</div>
<button class=addcat>Добавление нового кота</button>
<div class=midl>
    <div  class="form">
        <form  id="form1" method="post" action="ServletAddCat" >
            <div class="form_grup">
                <label class="form_label">Имя кота</label>
                <input id="nameCat" name="nameCat" class="form_input"<c:out value="${cat.nameCat}"/>>
            </div>
            <div class="form_grup">
                <label class="form_label">ID отца</label>
                <input id="idDad" name="idDad" type="number" class="form_input" <c:out value="${cat.idDad}"/>>
                <select id="iddadcats">
                    <c:forEach var="cat" items="${listcat}">
                        <c:if test="${cat.gender=='М'}">
                            <option value="${cat.idCat}">${cat.idCat}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="form_grup">
                <label class="form_label">ID матери</label>
                <input id="idMam" name="idMam" type="number" class="form_input" <c:out value="${cat.idMam}"/>>
                <select id="idmamcats">
                     <c:forEach var="cat" items="${listcat}">
                         <c:if test="${cat.gender=='Ж'}">
                    <option value="${cat.idCat}">${cat.idCat}</option>
                         </c:if>
                     </c:forEach>
                </select>
            </div>
            <div>
                <label style="margin:0 40px">М<input name="radio1" type="radio" value="М" class="form_input"
                                                     checked></label>
                <label>Ж<input NAME="radio1" type="radio" value="Ж" class="form_input"></label>
            </div>
            <button id="gender" name="gender" class="form_button" onclick="x1()" <c:out value="${cat.gender}"/>>Записать кота</button>
        </form>
        <a href="ServletShow"><button  class="form_button" onsubmit="false" onclick="cancel()" style="margin-top:0px;width:157.59px">Отмена</button></a>
    </div>
</div>
<script>
    $('select#iddadcats').on('change', function() {
        $('input[name="idDad"]').val(this.value);
    });
    $('select#idmamcats').on('change', function() {
        $('input[name="idMam"]').val(this.value);
    });
    function x1() {
        var nameCat = document.getElementById("nameCat").value;
        var iddad = document.getElementById("idDad").value;
        var idmam = document.getElementById("idMam").value;
        if (nameCat.length > 0 && iddad.length > 0 && idmam.length > 0) {

            $('input:radio:checked').each(function () {
                document.getElementById("gender").value = $(this).val();
            });
            document.getElementById("form1").onsubmit=true
        } else  {  document.getElementById("form1").onsubmit=false}
    }
</script>
</body>
</html>
