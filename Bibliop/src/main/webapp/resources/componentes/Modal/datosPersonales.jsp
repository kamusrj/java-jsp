<%-- 
    Document   : datosPersonales
    Created on : 01-01-2020, 10:54:21 AM
    Author     : Echo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--
Modal de edición de datos personales
-->
<%
    HttpSession b_ses = request.getSession();
    String nombre = (String) b_ses.getAttribute("nombre");
    String apellido = (String) b_ses.getAttribute("apellido");
    String correo = (String) b_ses.getAttribute("correo");
    String tel = (String) b_ses.getAttribute("telefono");
%>
<form method="post" action="control?action=editarDatosPersonales">
    <div class="container">
        <div id="datosPersonales" class="modal modal-fixed-footer curve">
            <div class="modal-content">
                <span class="title center">
                    <h5>Datos Personales</h5>
                </span>
                <br><br>
                <div class="row">
                    <div class="col s1">
                        <i class="material-icons small">face</i>
                    </div>
                    <div class="input-field col s4">
                        <input type="text" name="txtNombre" value="<%=nombre%>" id="txtNombre" class="validate" required=""/> <!nombre del Usuario>
                        <label for="txtName">Nombres: </label>
                    </div>
                    <div class="col s1">
                        <i class="material-icons small">face</i>
                    </div>
                    <div class="input-field col s4">
                        <input type="text" name="txtApellido" value="<%=apellido%>" id="txtApellido" class="validate" required=""/> <!Apellido del Usuario>
                        <label for="txtApellido">Apellidos: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s1">
                        <i class="material-icons">email</i>
                    </div>
                    <div class="input-field col s4">
                        <input type="email" name="emaCorreo" id="emaCorreo" value="<%=correo%>" class="validate" required=""/> <!Correo de contacto del Usurio>
                        <label for="emaCorreo">Correo Electrónico de Contacto</label>
                    </div>
                    <div class="col s1">
                        <i class="material-icons">local_phone</i>
                    </div>
                    <div class="input-field col s4">
                        <input type="tel" name="telTelefono" value="<%=tel%>" id="telTelefono" class="validate" required=""/> <!Telefono de Contacto>
                        <label for="telTelefono">Teléfono de Contacto</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s4">
                        <p>Escribe la Contraseña para Guardar Los Cambios</p>
                    </div>
                    <div class="col s1">
                        <i class="material-icons small">lock</i>
                    </div>
                    <div class="input-field col s4">
                        <input type="password" name="pasPass" id="pasPass" class="validate" required=""/>
                        <label for="pasPass">Contraseña: </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer grey lighten-3">
                <a href="#!" class="modal-close waves-effect waves-red btn-flat left grey lighten-5">Cancelar</a> 
                <a href="#!" class="waves-effect waves-green btn-flat left grey lighten-5" style="margin-left: 1%">Aceptar</a>
            </div>
        </div>
    </div>
</form>
