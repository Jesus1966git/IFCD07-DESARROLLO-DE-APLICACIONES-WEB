<%-- 
    Document   : manager
    Created on : 28 nov 2022, 17:29:13
    Author     : Usr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <!--        <meta charset=UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link href="/WebMediaMager2/css/media-manager.css" rel="stylesheet">
                <link href="/WebMediaMager2/css/bootstrap.min.css" rel="stylesheet">-->
        <title>Media Manager</title>
    </head>
    <body style="background: url(images/texture.png);  color: white;   padding: 10px 10px">
    <body>
        <!--        <style>
                    background: url(images/texture.png); 
                    color: white;  
                    padding: 10px 10px
                </style>-->
        <jsp:useBean id="fileBean" type="com.example.bean.FileMediaBean" scope="request"/>         
        <div class="container">
            <div class="page-header">
                <h1>Media Manager <small class="hidden-xs">${fileBean.videoCount} Videos, ${fileBean.pictureCount} Pictures</small></h1>
            </div>
            <c:forEach var="mediaGroup" items="${fileBean.groups}">
                <div class="row">
                    <div class="col-sm-1">
                        <h3 class="group-header">${mediaGroup.title}</h3>
                    </div>
                    <div class="col-sm-11">
                        <ul class="list-inline">
                            <c:forEach var="mediaItem" items="${mediaGroup.items}">
                                <li>
                                    <div>
                                        <a href="/WebMediaManager2/MediaController?action=item&itemId=${mediaItem.id}">
                                            <c:choose>
                                                <c:when test="${mediaItem.type=='IMAGE'}">
                                                    <img src="${mediaItem.uri}" class="img-thumbnail"/>                                                
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/WebMediaManager2/images/play.png" class="img-thumbnail"/>                                                
                                                </c:otherwise>                                                
                                            </c:choose>
                                            <h3>${mediaItem.title}</h3>
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
            <nav class="navbar navbar-dark">
                <div class="container">
                    <li class="active">
                        <a href="/WebMediaManager2" class="btn-primary">Home</a>
                    </li>
                    <li>
                        <a href="/WebMediaManager2/upload.html" class="btn-success">Upload</a>
                    </li>
                </div> 
            </nav>
        </div>
        <!--  <script src="/WebMediaManager2/js/jquery-1.11.1.min.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
