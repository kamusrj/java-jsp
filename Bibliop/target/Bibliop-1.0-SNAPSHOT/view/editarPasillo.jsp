<%-- 
    Document   : nuevoPasillo
    Created on : 01-05-2020, 01:48:35 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../resources/css/materialize.css" rel="stylesheet"/>
    </head>
    <body>
        <form action="control" method="post">
            <input type="hidden" name="txtIDpasillo" value="${actupasillo.id_pasillo}"/>
            <div class="container">
                <div class="row">
                    <div class="col m12">
                        <div class="col m12 center">
                            <h1>Editar Pasillo</h1>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m3">
                        <p>Nombre:</p>
                    </div>
                    <div class="col m3">
                        <input class="text" name="txtPasillo" placeholder="Nombre del Pasillo" value="${actupasillo.pasillo.id_pasillo}">
                    </div>
                    <div class="col m3"></div>
                </div>

                <br>
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m3">
                        <a href="control?action=guardarPasillo" class="btn btn-flat">Guardar</a>
                        <a href="control?action=pasillo" class="btn btn-flat">Cancelar</a>
                    </div>
                    <div class="col m3"></div>
                </div>
            </div>
        </form>
    </body>
</html>
