<%-- 
    Document   : newAutor
    Created on : 12-21-2019, 09:02:34 AM
    Author     : roberto.dimasusam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<%
    HttpSession b_ses = request.getSession();
    if (b_ses.getAttribute("nick") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else if (b_ses.getAttribute("rol").equals("Cliente")) {
        response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
    }
%>
<jsp:include page="/resources/componentes/menu.jsp"/>
<br>

<div class="row">
    <div class="col-m12">
        <div class="card red yellow-text center z-depth-5"><h1>Modificacion Autor</h1></div>
    </div>
</div>
<form method="post" action="Control?act=saveA">     
    <div class="row">
        <div class="col m1">
            <input type="hidden" name="txtID" value="${auto.id_autor}"/>
        </div>
        <div class="col m5 input-field">
            <i class="material-icons prefix">person</i>
            <input type="text" name="txtNombre" value="${auto.nombre}" class="form-control" />
            <label for="txtNombre">Ingrese nombres del autor</label>
        </div>
        <div class="col m5 input-field">
            <i class="material-icons prefix">people</i>
            <input type="text" name="txtApellido" value="${auto.apellido}" class="form-control" />
            <label for="txtApellido">Ingrese apellidos del autor</label>
        </div>
    </div>
</div>  
<div class="row">
    <div class="col m3"></div>
    <div class="col m7 input-field">
        <i class="material-icons prefix">account_circle</i>
        <input type="text" name="txtPseudonimo" value="${auto.pseudonimo}" class="form-control" />
        <label for="txtPseudonimo">Ingrese Pseudonimo del autor</label>
    </div>
</div>
<div class="row">
    <div class="col m8"></div><!Modifica de Pseudonimo >
    <div class="col m1">
        <a href="Control?act=autor" class="modal-close red lighten-3 waves-effect waves-block waves-orange btn-flat">Cancelar</a>
    </div><!Modifica de Pseudonimo >
    <div class="col m1">
        <button type="submit" class="btn-flat blue lighten-2 waves-effect waves-block waves-green ">Aceptar</button>
    </div><!Modifica de Pseudonimo >

</div>

</form>
<script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
<script src="resources/js/materialize.js" type="text/javascript"></script>
<jsp:include page="/resources/componentes/foot.jsp"/>
</body>
</html>
