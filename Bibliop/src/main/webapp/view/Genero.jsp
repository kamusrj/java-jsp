<!kamus>
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
   <!mensaje de accion cumplida>
    <h5>${mensaje}</h5>
</div>
<div class="container ">   
    <form method="post" action="Control?act=saveGenero">
        <div class="row">
            <div class=" card light-green white-text center z-depth-2">
                <h2>GÉNERO LITERARIO</h2>
            </div>
        </div>
        <!boton para desplegar el modal>
        <div class="row">
                <div class="col s6"></div>
                <div class="col s1">
                    <a data-position="left" data-tooltip="Nuevo genero literario" class="blue lighten-2 waves-effect waves-light btn btn-block large modal-trigger tooltipped" href="#modal1"><i class="material-icons white-text center">add_circle</i></a>
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
                <div class="col s1"></div>
            </div>
<!modal para ingresar un registro>
        <div id="modal1" class="modal curve">
            <div class="modal-content">
                <h4>Nuevo registro</h4>
                <div class="row">

                    <div class="col m3">Género
                        <input type="text" name="saveGenero" required=""/>
                    </div>
                    <div class="col m3"></div>
                </div>
            </div>
            <div class="modal-footer ">
                <input type="submit" name="btnSGenero" value="GUARDAR" class="btn btn-block btn-danger" >
            </div>
        </div>
<!tabla que muestra los datos>
        <div class="row">
            <div class="col m2"></div>
            <div class="col m7">
                <table class="light responsive-table center ">
                    <tr>
                        <th>ID Género</th>
                        <th>Género</th>
                    </tr>
                    <c:forEach items="${Genero}" var="g">
                        <tr>
                            <td>${g.id_genero}</td>
                            <td>${g.genero} </td>   
                            <th>
                                <c:choose>
                                    <c:when test="${sessionScope.rol == 'Propietario'}">
                                        <a href="Control?act=EliminarGenero&id=${g.id_genero}" class="btn red white-text">Eliminar</a>
                                    </c:when>
                                </c:choose>
                            </th>
                             <th>
                                <a href="Control?act=EditarGenero&id=${g.id_genero}" class="btn blue white-text">Editar</a>
                            </th>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>
<!complementos>
        <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="resources/js/materialize.js" type="text/javascript"></script>
        <script src="resources/js/modal.js" type="text/javascript"></script>
    </form>
</div>
    <jsp:include page="/resources/componentes/foot.jsp"/>
</body>
</html>
