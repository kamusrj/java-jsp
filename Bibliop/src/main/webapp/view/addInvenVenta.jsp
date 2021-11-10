<%-- 
    Document   : addInvenVenta
    Created on : 01-07-2020, 09:33:58 PM
    Author     : Gustavo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar</title>
    </head>
    <body>
        <%
            HttpSession b_ses = request.getSession();
            if (b_ses.getAttribute("nick") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else if (b_ses.getAttribute("rol").equals("Cliente")) {
                response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
            }
        %>
        <jsp:include page="/resources/componentes/menu.jsp"/>
        <div class="row">
            <div class="col m1"></div>
            <div class="col m10 card grey lighten-3 center">
                <h4>Agregar un producto a inventario</h4>
            </div>
            <div class="col m1"></div>
        </div>
        <form action="Control?act=addlibroV" method="post">
            <div class="row">
                <div class="col s1">
                    <input type="hidden" value="${objEdit.reg_libroVenta}"/>
                </div>
                <div class="col s4 input-field">
                    <i class="material-icons prefix">books</i>
                    <select name="cmbLibro" id="cmbLibro" ${prop}>
                        <option value="" selected="" disabled="">Seleccione:</option>
                        <c:forEach items="${listaProd}" var='lp'>
                            <c:choose>
                                <c:when test="${lp.id_libro == objEdit.libro.id_libro}">
                                    <option value="${lp.id_libro}" selected="">${lp.titulo}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${lp.id_libro}">${lp.titulo}</option>
                                </c:otherwise>
                            </c:choose>
                            
                        </c:forEach>
                    </select>
                    <label for="cmbLibro">Seleccione el libro</label>
                </div>
                <div class="col m3 input-field">
                    <i class="material-icons prefix">check_circle</i>
                    <input type="number" name="txtStock" value="${objEdit.stock}" max="500" min="0" required=""/>
                    <label for="cmbLibro">Introduzca un valor de stock</label>
                </div>
                <div class="col m3 input-field">
                    <i class="material-icons prefix">monetization_on</i>
                    <input type="text" name="txtPrecio" value='${objEdit.precio_venta}' required=""/>
                    <label for="cmbLibro">Introduzca un precio de venta</label>
                </div>
                <div class="col m1"></div>
            </div>
            <div class="row">
                <div class="col m8">
                    
                </div>
                <div class="col m2">
                    <a href="Control?act=inventario&tipo=venta" class="btn center kwaves-effect waves-green red lighten-2">Cancelar</a>
                </div>
                <div class="col m1">
                    <input type="submit" value="Agregar" class="btn btn-block blue darken-2 white-text">
                </div>
                <div class="col m1"></div>
            </div>
        </form>
        <jsp:include page="/resources/componentes/foot.jsp"/>
    </body>
</html>
