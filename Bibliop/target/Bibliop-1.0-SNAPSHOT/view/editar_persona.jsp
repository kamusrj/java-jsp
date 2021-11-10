<%-- 
    Document   : editRegistro
    Created on : 12-23-2019, 10:33:09 AM
    Author     : Echo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession b_ses = request.getSession();
        if (b_ses.getAttribute("nick") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else if (!b_ses.getAttribute("rol").equals("Propietario")) {
            response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <link href="resources/css/materialize.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="resources/js/materialize.js" type="text/javascript"></script>
        <script src="resources/js/js.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="/resources/componentes/menu.jsp"/>
        <form action="Control?act=update" method="post">
            <div class="container">
                <input type="hidden" name="id_usr" value="${usr.id_usr}"/>
                <div class="row center">
                    <h4>
                        Datos Personales
                    </h4>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input type="text" name="txtNombre" id="txtNombre" value="${usr.personadato.nombre}" placeholder="Nombre" class="validate" required/>
                        <label for="txtNombre">Nombres</label>
                    </div>
                    <div class="input-field col s6">
                        <input type="text" name="txtApellido" id="txtApellido" value="${usr.personadato.apellido}" placeholder="Apellido" class="validate" required/>
                        <label for="txtApellido">Apellidos</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input type="email" name="emaCorreo" id="emaCorreo" value="${usr.personadato.correo}" placeholder="Correo" class="validate" required/>
                        <label for="emaCorreo">Dirección de correo electrónico</label>
                    </div>
                    <div class="input-field col s6">
                        <input type="text" name="txtTelefono" id="txtTelefono"  value="${usr.personadato.telefono}" placeholder="Teléfono" class="validate" required data-length="9"/>
                        <label for="txttelefono">Teléfono de Contácto, Incluir '-'</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea name="txtDireccion" id="txtDireccion" class="materialize-textarea">${usr.personadato.direccion}</textarea>
                        <label for="txtDireccion">Dirección de Domicilio</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input type="text" name="txtNickname" id="txtNickname" value="${usr.nickname}" placeholder="Nickname" class="validate" required=""/>
                        <label for="txtNickname">Nombre de Usuario</label>
                    </div> 
                    <div class="input-field col s6">
                        <input type="password" name="passClave" id="passClave" value="${usr.clave}" placeholder="Contraseña" class="validate" required=""/>
                        <label for="passClave">Contraseña</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s9"></div>
                    <div class="col s2">
                        <input type="submit" class="btn-flat green waves-effect waves-light" value="Guardar"/>
                    </div>
                    <div class="col s1">
                        <a href="Control?act=listaPersona" data-position="right" data-tooltip="Volver a lista" class="btn tooltipped btn-block large waves-effect waves-green red lighten-1">
                            <i class="material-icons white-text center">cancel</i>
                        </a>
                    </div>
                </div>
            </div>
        </form>
        <jsp:include page="/resources/componentes/foot.jsp"/>
    </body>
</html>
