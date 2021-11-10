<%-- 
    Document   : nuevoEstante
    Created on : 01-05-2020, 01:48:49 PM
    Author     : usuario
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="control" method="post">
            <input type="hidden" name="txtIDestante" value="${actuestante.estante.id_estante}"/>
            <div class="container">
                <div class="row">
                    <div class="col m12">
                        <div class="col m12 center">
                            <h1>Editar Estante</h1>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m3">
                        <h2>Numero de Estante</h2>
                    </div>
                    <div class="col m3">
                        <p>Numero del Estante:</p>
                        <input class="text" name="txtEstante" placeholder="Numero del Estante" value="${actuestante.estante.id_estante}">
                    </div>
                    <div class="col m3"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m3"><p>Nombre Pasillo</p></div>
                    <div class="col m3">
                        <select name="cmbPasillo">
                            <c:forEach items="${pasillo}" var="pas">
                                <c:choose>
                                    <c:when test="${pas.id_pasillo == actupasillo.pasillo.id_pasillo}">
                                        <option value="${pas.id_pasillo}">${pas.pasillo}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${pas.id_pasillo}">${pas.pasillo}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col m3"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m3">
                        <a href="control?action=guardarPasillo" class="btn btn-flat">Guardar</a>
                        <a href="control?action=estante" class="btn btn-flat">Cancelar</a>
                    </div>
                    <div class="col m3"></div>
                </div>
            </div>
        </form>
    </body>
</html>
