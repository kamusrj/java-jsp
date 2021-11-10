
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
    <h5>${mensaje}</h5>

    <div class="container ">
        <form method="post" action="Control?act=saveEditorial">  
            <div class="row">
                <div class=" card light-green white-text center z-depth-2">
                    <h2>EDITORIAL</h2>
                </div>
            </div>
            <div class="row">
                <div class="col s7"></div>
                <div class="col s1">
                    <a data-position="left" data-tooltip="Nueva editorial" class="blue lighten-2 waves-effect waves-light btn btn-block large modal-trigger tooltipped" href="#modal1"><i class="material-icons white-text center">add_circle</i></a>
                </div>
                <div class="col s1">
                    <a href="Control?act=nuevoLibro" data-position="bottom" data-tooltip="Volver a insertar libro" class="btn tooltipped btn-block large waves-effect waves-green red lighten-1">
                        <i class="material-icons white-text center">book</i>
                    </a>
                </div>
                <div class="col s1">
                    <a href="Control?act=perfil&tipo=<%=rol%>" data-position="right" data-tooltip="Volver al perfil" class="btn tooltipped btn-block large waves-effect waves-green red lighten-2">
                        <i class="material-icons white-text center">person_pin</i>
                    </a>
                </div>
            </div>


            <div id="modal1" class="modal curve">
                <div class="modal-content">
                    <h4>Nuevo Registro</h4>
                    <div class="row">
                        <div class="col s1">Editorial:</div>
                        <div class="col input-field s6">
                            <i class="material-icons center prefix">description</i>
                            <input type="text" name="saveEditorial" required=""/>
                            <label for="saveEditorial">Nombre de la editorial</label>
                        </div>
                        <div class="col m3"></div>
                    </div>
                </div>
                <div class="modal-footer grey lighten-3">
                    <input type="submit" name="btnSEditoril" value="GUARDAR" class="btn btn-block btn-danger" >
                </div>
            </div>
            <div class="row">
                <div class="col m2"></div>
                <div class="col m8">
                    <table class=" responsive-table center ">
                        <tr>
                            <th >ID Editorial</th>
                            <th >Editorial</th>
                        </tr>
                        <c:forEach items="${Editorial}" var="e">
                            <tr>
                                <td >${e.id_editorial}</td>
                                <td >${e.editorial} </td> 
                                <th>
                                    <c:choose>
                                        <c:when test="${sessionScope.rol == 'Propietario'}">
                                            <a href="Control?act=EliminarEditorial&id=${e.id_editorial}" class="btn red white-text" >Eliminar</a>
                                        </c:when>
                                    </c:choose>
                                </th>
                                <th>
                                    <a href="Control?act=EditarEditorial&id=${e.id_editorial}" class="btn blue white-text">Editar</a>
                                </th>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="col m2"></div>
                    <div class="col m2"></div>
                </div>
            </div>
        </form>
        <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="resources/js/materialize.js" type="text/javascript"></script>
        <script src="resources/js/modal.js" type="text/javascript"></script>
    </div>
    <jsp:include page="/resources/componentes/foot.jsp"/>
</body>
</html>
