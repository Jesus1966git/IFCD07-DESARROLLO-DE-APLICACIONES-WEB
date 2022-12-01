<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Media Manager</title>
    </head>
    <body>
        <jsp:useBean id="itemBean" type="com.example.media.MediaItem" scope="request"/>
        <div class="container">
            <div class="page-header">
                <h1>Media Manager</h1>
            </div>
            <h4>${itemBean.title}</h4>
            <c:choose>
                <c:when test="${itemBean.type == 'IMAGE'}">
                    <img src="${itemBean.uri}" class="media-large-image"/>
                </c:when>  
                <c:when test="${itemBean.type == 'MP4_VIDEO' || itemBean.type == 'OGV_VIDEO'}">
                    <video class="media-large-video" controls>
                        <source src="${itemBean.uri}" >                
                    </video>
                </c:when>
                <c:otherwise>
                    <h2 style="text-align: center">This image type is not supported</h2>
                </c:otherwise>
            </c:choose>
            <nav class="navbar navbar-inverse">
                <div class="container">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href='/WebMediaManager2'>Home</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>


