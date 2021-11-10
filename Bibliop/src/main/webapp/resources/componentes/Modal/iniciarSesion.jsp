<%-- 
    Document   : iniciarSesion
    Created on : 12-14-2019, 04:38:08 PM
    Author     : Echo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--
Modal de Inicio de Sesión
puede ser desplegado en cualquier vista añadida
-->
<form action="Control?act=ingresar" method="post">
    <div class="container">
        <div id="iniciarSesion" class="modal curve">
            <div class="modal-content">
                <span class="title center">
                    <h5>INICIAR SESIÓN</h5>
                </span>
                <div class="row">
                    <div class="col s1">
                        <i class="material-icons">person</i>
                    </div>
                    <div class="col s11">
                        <div class="input-field">
                            <input type="text" name="txtNombre" id="txtNombre" placeholder="Nombre de Usuario" value="${usrErr}"  class="validate" required/>
                            <label for="txtNombre">Nombre de Usuario</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s1">
                        <i class="material-icons">lock</i>
                    </div>
                    <div class="col s11">
                        <div class="input-field">
                            <input type="password" name="passContrasenia" id="passContrasenia" placeholder="Contraseña" value="" class="validate" required/>
                            <label for="passContrasenia">Contraseña</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer grey lighten-3">
                <a href="#!" class="modal-close waves-effect waves-red btn-flat left grey lighten-5">Cancelar</a>
                <button type="submit" class="waves-effect waves-green btn-flat left grey lighten-5" style="margin-left: 1%">Ingresar</button>
            </div>
        </div>
    </div>
</form>
