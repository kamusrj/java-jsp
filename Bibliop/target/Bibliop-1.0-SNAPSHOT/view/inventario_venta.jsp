<%-- 
    Document   : inventario_venta
    Created on : 01-07-2020, 08:22:11 PM
    Author     : Gustavo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>invenario venta</title>
    </head>
    <body>
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
        <script>${msj}</script>
        <div class="row">
            <div class="col m8"></div>
            <div class="col m1">
                <a href="Control?act=addInVenta" data-position="left" data-tooltip="Agregar producto" class="btn tooltipped btn-block large waves-effect waves-block waves-green blue lighten-1">
                    <i class="material-icons white-text center">library_add</i>
                </a>
            </div>
            <div class="col m1">
                <a href="Control?act=perfil&tipo=<%=rol%>" data-position="right" data-tooltip="Volver al perfil" class="btn tooltipped btn-block large kwaves-effect waves-green red lighten-2">
                    <i class="material-icons white-text center">person_pin</i>
                </a>
            </div>
            <div class="col m1"></div>
        </div>
        <div class="row">
            <div class="col m3"></div>
            <div class="col m6">
                <c:forEach items="${listaInventario}" var='li'>
                    <div class="card horizontal">
                        <div class="card-image">
                            <img src="${li.libro.portada}" alt=""/>
                        </div>
                        <div class="card-stacked">
                            <div class="card-content">
                                <h4 class="header">${li.libro.titulo}</h4>
                                <h6>Precio de venta: <b>$${li.precio_venta}</b></h6>
                                <h6>Costo: <b>$${li.libro.costo}</b></h6>
                                <h6>Stock: <b>${li.stock}</b></h5>
                                <h6>Existencia: <b>${li.existencia}</b></h6>
                            </div>
                        </div>
                        <div class="card-action">
                            <a href="Control?act=editLibVenta&id=${li.libro.id_libro}" data-position="left" data-tooltip="Editar datos de inventario" class="tooltipped btn z-depth-2 yellow darken-2">
                                <i class="material-icons white-text">edit</i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="col m3"></div>
        </div>
        <jsp:include page="/resources/componentes/foot.jsp"/>
    </body>
</html>
