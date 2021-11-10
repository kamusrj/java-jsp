
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!modal registro de Usuario>

<form method="post" action="Control?act=crearUsuarioCliente">
    <div class="container">
        <div id="crearCuenta" class="modal modal-fixed-footer curve">
            <div class="modal-content">
                <span class="title center">
                    <h5>REGISTRO DE USUARIO</h5>
                </span>
                <br><br>
                <div class="row">
                    <div class="input-field col s1"></div>
                    <div class="input-field col s5">
                        <i class="material-icons small prefix">face</i>
                        <input type="text" name="txtNombre" id="txtNombre" class="validate" required=""/> <!nombre del Usuario>
                        <label for="txtName">Nombres: </label>
                    </div>
                    <div class="input-field col s5">
                        <i class="material-icons small prefix">face</i>
                        <input type="text" name="txtApellido" id="txtApellido" class="validate" required=""/> <!Apellido del Usuario>
                        <label for="txtApellido">Apellidos: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s1"></div>
                    <div class="input-field col s5">
                        <i class="material-icons prefix">email</i>
                        <input type="email" name="emaCorreo" id="emaCorreo" class="validate" required=""/> <!Correo de contacto del Usurio>
                        <label for="emaCorreo">Correo Electrónico de Contacto</label>
                    </div>
                    <div class="input-field col s5">
                        <i class="material-icons prefix">local_phone</i>
                        <input type="tel" name="txtTelefono" id="txtTelefono" class="validate" required=""/>
                        <label for="telTelefono">Teléfono de Contacto</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s1"></div>
                    <div class="input-field col s5">
                        <i class="material-icons small prefix">person</i>
                        <input type="text" name="txtNickname" id="txtUsuario" class="validate" required=""/>
                        <label for="txtUsuario">Ingresa un nombre de Usuario: </label>
                    </div>
                    <div class="input-field col s5">
                        <i class="material-icons small prefix">lock</i>
                        <input type="password" name="passClave" id="passContrasenia" class="validate" required=""/>
                        <label for="pasPass">Contraseña: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s2"></div>
                    <div class="input-field col s7">
                        <i class="material-icons prefix">location_on</i>
                        <textarea name="txtDireccion" id="txtDireccion" required=""  class="materialize-textarea validate">${usr.personadato.direccion}</textarea>
                        <label for="txtDireccion">Dirección de Domicilio</label>
                    </div>
                    <div class="col s3"></div>
                </div>
                

            </div>
            <div class="modal-footer grey lighten-3">
                <a href="#!" class="modal-close waves-effect waves-red btn-flat left grey lighten-5">Cancelar</a> 
                <input type="submit" value="Aceptar"class="waves-effect waves-green btn-flat left grey lighten-5" style="margin-left: 1%;"/>
            </div>
        </div>
    </div>
</form>