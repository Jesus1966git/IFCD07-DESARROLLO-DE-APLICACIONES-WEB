<%-- 
    Document   : uploadData
    Created on : 30 nov 2022, 18:19:47
    Author     : Usr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <jsp:useBean id="uploadData" type="com.example.model.UploadData" scope="request" />
        <div class="container">
            <div class="page-header">
                <h1>Media Manager <small class="hidden-xs">- Upload Data</small></h1>
            </div>
            <p>File name: ${uploadData.fileName}</p>
            <p>Title:     ${uploadData.title}</p>
            <p>Extension: ${uploadData.extension}</p>
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