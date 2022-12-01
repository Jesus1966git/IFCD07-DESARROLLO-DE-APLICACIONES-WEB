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
        <jsp:useBean id="qualifierBean" type="com.example.media.MediaQualifier" scope="session" />
        <div class="container">
            <div class="page-header">
                <h1>Media Manager <small class="hidden-xs">- Settings</small></h1>
            </div>
            <form method="post" action="/WebMediaManager2/MediaController?action=newSettings" class="settings-form">
                <input type="hidden">
                <label>Type: </label>
                <table>
                    <tr>
                        <td>
                            <input type="radio" name="type" value="images"/><label> Images Only</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="type" value="videos"/><label> Videos Only</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="type" value="both"  checked="true"/><label> Images+Videos</label>
                        </td>
                    </tr>
                </table>
                <br/><label>Sorting Order: </label>
                <select name="sortOrder" size="1" class="btn-primary">
                    <option value="DATE_ASC">Orden de fecha ascendente</option>
                    <option value="DATE_DESC">Orden de fecha descendente</option>
                    <option value="TITLE_ASC" selected>Orden de titulo ascendente</option>
                    <option value="TITLE_DESC">Orden de titulo descendente</option>
                </select>
                <p/>
                <input type="submit" value="Submit" class="btn-primary"/>  
            </form>
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
