<%-- 
    Document   : Autor
    Created on : 12-18-2019, 04:31:24 PM
    Author     : roberto.dimasusam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession b_ses = request.getSession();
        if (b_ses.getAttribute("nick") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else if (b_ses.getAttribute("rol").equals("Cliente")) {
            response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
        }
        String rol = (String) b_ses.getAttribute("rol");
    %>
    <jsp:include page="/resources/componentes/menu.jsp"/>
    <div class="row">
        <div class="col-m12">
            <div class="card red yellow-text center z-depth-5"><h1>Autores</h1></div>
        </div>
    </div>
    <div class="row">
        <div class="col m8"></div>
        <div class="col m1">
            <a data-position="left" data-tooltip="Nuevo Autor" class="blue lighten-2 waves-effect waves-light btn btn-block large modal-trigger tooltipped" class="waves-effect waves-light btn modal-trigger" href="#NAutor">
                <i class="material-icons white-text center">add_circle</i>
            </a>
        </div>
        <div class="col m1">
            <a href="Control?act=nuevoLibro" data-position="bottom" data-tooltip="Volver a insertar libro" class="btn tooltipped btn-block large waves-effect waves-green red lighten-1">
                <i class="material-icons white-text center">book</i>
            </a>
        </div>
        <div class="col m1">
            <a href="Control?act=perfil&tipo=<%=rol%>" data-position="right" data-tooltip="Volver al perfil" class="btn tooltipped btn-block large waves-effect waves-green red lighten-2">
                <i class="material-icons white-text center">person_pin</i>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col m1"></div>
        <div class="col m10">
            <table class="card blue-grey yellow-text center">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Pseudonimo</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr> 
                <c:forEach items="${autor}" var="a">
                    <tr>
                        <th>${a.id_autor}</th>
                        <th>${a.nombre}</th>
                        <th>${a.apellido}</th>
                        <th>${a.pseudonimo}</th>
                        <th>
                            <a href="Control?act=editarA&id=${a.id_autor}" class="btn-flat blue btn-large">
                                <i class="material-icons">edit</i>
                            </a>
                        </th>
                        <th>
                            <c:choose>
                                <c:when test="${sessionScope.rol == 'Propietario'}">
                                    <a href="Control?act=eliminarA&id=${a.id_autor}" class="btn-flat red btn-large">
                                        <i class="material-icons">delete_forever</i>
                                    </a>
                                </c:when>
                            </c:choose>
                        </th>
                    </tr>     
                </c:forEach>

            </table>
        </div>
        <div class="col m1"></div>
    </div>

    <form method="post" action="Control?act=saveA">

        <!-- Modal para Ingresar Nuevo Autor-->
        <div id="NAutor" class="modal curve">
            <div class="modal-content">
                <h4>Agregar Autor</h4>
                <br>
            </div>
            <div class="row">
                <div class="col m1"></div>
                <div class="col m5 input-field">
                    <i class="material-icons prefix">person</i>
                    <input type="text" name="txtNombre" class="form-control" />
                    <label for="txtNombre">Ingrese nombres del autor</label>
                </div>
                <div class="col m5 input-field">
                    <i class="material-icons prefix">people</i>
                    <input type="text" name="txtApellido" class="form-control" />
                    <label for="txtApellido">Ingrese apellidos del autor</label>
                </div>
            </div>
            <div class="row">
                <div class="col m3"></div>
                <div class="col m7 input-field">
                    <i class="material-icons prefix">account_circle</i>
                    <input type="text" name="txtPseudonimo" class="form-control" />
                    <label for="txtPseudonimo">Ingrese Pseudonimo del autor</label>
                </div>
            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-close grey lighten-3 waves-effect waves-green btn-flat">Cancelar</a>
                <button type="submit" class="btn-flat grey lighten-3">Aceptar</button>
            </div>
        </div>

    </form>

    <br>

    <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="resources/js/materialize.js" type="text/javascript"></script>
    <jsp:include page="/resources/componentes/foot.jsp"/>
</body>
</html>
