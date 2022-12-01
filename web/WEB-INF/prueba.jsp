<%-- 
    Document   : prueba
    Created on : 29 nov 2022, 17:34:27
    Author     : Usr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            body {
                background: url(../images/texture.png);
                color: white;
                padding: 10px 10px;
            }
        </style>

    </head>
    <body>
        <jsp:useBean id="fileBean" type="com.example.bean.FileMediaBean" scope="request"/>
        <c:forEach var="mediaGroup" items="${fileBean.groups}">
            <div class="row">
                <div class="col-sm-1">
                    <h3 class="group-header">${mediaGroup.title}</h3>
                </div>

                <div class="col-sm-11">
                    <ul class="list-inline">
                        <c:forEach var="mediaItem" items="${mediaGroup.items}">
                            <h1>${mediaItem.uri}</h1>
                            <c:choose>
                                <c:when test="${mediaItem.type=='IMAGE'}">
                                    <img src="${pageContext.request.contextPath}/fxmedia/${mediaItem.title}" class="img-thumbnail"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/images/play.png" class="img-thumbnail"/>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                    </ul>
                </div>
            </div>
        </c:forEach>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
