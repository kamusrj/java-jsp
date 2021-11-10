<%-- 
    Document   : EdiGenero
    Created on : 12-24-2019, 12:39:12 PM
    Author     : Kamus
--%>
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
    %>
    <jsp:include page="/resources/componentes/menu.jsp"/>
    <!mensaje de accion cumplida>

</div>
<div class="container ">   
    <form method="post" action="Control?act=saveGenero">
        <div class="row">
            <div class=" card light-green white-text center z-depth-2">
                <h3>GÉNERO LITERARIO</h3>
            </div>
        </div>
        <h5>Editar</h5>
        <div class="row">
            <div class="col m3">Género 
                <input type="hidden" name="idGenero" value="${gen.id_genero}"/>
                <input type="text" name="saveGenero" value="${gen.genero}"/>      
            </div>
            <div class="col m3"></div>
        </div>
        <div class="row">
            <div class="col m2">
                <input type="submit" name="btnSGenero" value="GUARDAR" class="btn light-blue btn-block " >
            </div>
            <div class="col s1">
                <a href="Control?act=Genero" data-position="right" data-tooltip="Volver a lista" class="btn tooltipped btn-block large waves-effect waves-green red lighten-1">
                    <i class="material-icons white-text center">cancel</i>
                </a>
            </div>
            <div class="col m3"></div>
        </div>
        <!complementos>
        <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="resources/js/materialize.js" type="text/javascript"></script>
    </form>
</div>
<jsp:include page="/resources/componentes/foot.jsp"/>
</body>
</html>
