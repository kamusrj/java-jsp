
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession b_ses = request.getSession();
    String nick = (String) b_ses.getAttribute("nick");
%>
<div class="container">
    <div id="datosUsuario" class="modal modal-fixed-footer curve">
        <div class="modal-content">
            <span class="title center">
                <h5>Datos de Usuario</h5>
            </span>
            <br><br>
            <div class="row">
                <div class="col s1">
                    <i class="material-icons small">person</i>
                </div>
                <div class="col s4">
                    <p><b>Nombre de Usuario: <%=nick%></b></p>
                </div>
            </div>
            <div class="row">
                <div class="col s4">
                    <p>Escribe Un Nuevo Nombre de Usuario</p>
                </div>
                <div class="input-field col s4">
                    <input type="text" name="txtUsuario" id="txtUsuario" class="validate"/>
                    <label for="txtUsuario">Cambiar Nombre de Usuario</label>
                </div>
            </div>
            <div class="row">
                <div class="col s4">
                    <p>Escribe Una Nueva Contraseña
                       Recuerda anotarla para no olviarla
                    </p>
                </div>
                <div class="input-field col s4">
                    <input type="password" name="passContraseniaNueva" id="passContraseniaNueva" class="validate"/>
                    <label for="passContraseniaNueva">Nueva Contraseña</label>
                    <p>Escribe una Nueva Contraseña</p>
                </div>
                <div class="input-field col s4">
                    <input type="password" name="passContraseniaConfirmar" placeholder="Repita su Contraseña" id="passContraseniaConfirmar" class="validate"/>
                    <label id="mensaje_error" for="passContraseniaConfirmar" style="display: block"></label>
                    <p>Repita su Contraseña</p>
                </div>
            </div>
            <div class="row">
                <div class="col s4">
                    <p>Escribe Tu Contraseña Actual 
                       para confirmar los cambios</p>
                </div>
                <div class="input-field col s4">
                    <input type="password" name="passContrasenia" id="passContrasenia" class="validate" required/>
                    <label for="passContrasenia">Escribe tu contraseña Actual</label>
                </div>
            </div>
        </div>
        <div class="modal-footer grey lighten-3">
            <a href="#!" class="modal-close waves-effect waves-red btn-flat left grey lighten-5">Cancelar</a> 
            <a href="#!" class="waves-effect waves-green btn-flat left grey lighten-5" style="margin-left: 1%">Aceptar</a>
        </div>
    </div>
</div>

