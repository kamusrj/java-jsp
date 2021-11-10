<%-- 
    Document   : home
    Created on : 12-22-2019, 01:32:18 PM
    Author     : Echo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="resources/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
         <Script>
            ${msj}
            ${msj2}
        </script>
        <br>
        <div class="row">
            <div class="col s9"></div>
            <div class="col s1">
                <a href="#nuevaPersona" class="btn tooltipped modal-trigger btn-block large waves-effect waves-green blue lighten-2" data-position="left" data-tooltip="Agregar persona">
                    <i class="material-icons white-text center">add</i>
                </a>
            </div>
            <div class="col s1">
                <a href="Control?act=perfil&tipo=<%=rol %>" data-position="right" data-tooltip="Volver al perfil" class="btn tooltipped btn-block large waves-effect waves-green red lighten-2">
                     <i class="material-icons white-text center">person_pin</i>
                </a>
            </div>
            <div class="col s1"></div>
        <div class="row">
            <div class="col s12">
                <table class="responsive-table striped">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Nickname</th>
                        <th>Tipo de Cuenta</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Acciones</th>
                    </tr>
                    <c:forEach items="${usuario}" var="usr">
                        <tr>
                            <td>${usr.id_usr}</td>
                            <td>${usr.personadato.nombre}</td>
                            <td>${usr.personadato.apellido}</td>
                            <td>${usr.nickname}</td>
                            <td>${usr.roldato.rol}</td>
                            <td>${usr.personadato.correo}</td>
                            <td>${usr.personadato.telefono}</td>
                            <td>${usr.personadato.direccion}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sessionScope.rol == 'Propietario'}">
                                        <a href="Control?act=readID&id=${usr.id_usr}" class="btn-floating yellow tooltipped waves-effect waves-light" data-position="left" data-tooltip="Editar"><i class="material-icons">edit</i></a>
                                        <a href="Control?act=delete&id=${usr.id_usr}" class="btn-floating red tooltipped waves-effect waves-light" data-position="left" data-tooltip="Eliminar"><i class="material-icons">delete</i></a>
                                    </c:when>
                                </c:choose>
                                
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <form action="Control?act=create" method="post">
            <div class="modal modal-fixed-footer curve" id="nuevaPersona">
                <div class="modal-content">
                    <div class="row center">
                        <h4>
                            Datos Personales
                        </h4>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input type="text" name="txtNombre" id="txtNombre" placeholder="Nombre" class="validate" required/>
                            <label for="txtNombre">Nombres</label>
                        </div>
                        <div class="input-field col s6">
                            <input type="text" name="txtApellido" id="txtApellido" placeholder="Apellido" class="validate" required/>
                            <label for="txtApellido">Apellidos</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input type="email" name="emaCorreo" id="emaCorreo" placeholder="Correo" class="validate" required/>
                            <label for="emaCorreo">Dirección de correo electrónico</label>
                        </div>
                        <div class="input-field col s6">
                            <input type="text" name="txtTelefono" id="txtTelefono" placeholder="Teléfono" class="validate" required data-length="9"/>
                            <label for="txttelefono">Teléfono de Contácto, Incluir '-'</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea name="txtDireccion" id="txtDireccion" class="materialize-textarea"></textarea>
                            <label for="txtDireccion">Dirección de Domicilio</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input type="text" name="txtNickname" id="txtNickname" placeholder="Nickname" class="validate" required=""/>
                            <label for="txtNickname">Nombre de Usuario</label>
                        </div> 
                        <div class="input-field col s6">
                            <input type="password" name="passClave" id="passClave" placeholder="Contraseña" class="validate" required=""/>
                            <label for="passClave">Contraseña</label>
                        </div>
                        <div class="input-field col s3"></div>
                        <div class="input-field col s6">
                            <select name="cmbRol">
                                <option value="" disabled="" selected="">Seleccione: </option>
                                <c:forEach items="${listaRoles}" var='les'>
                                    <c:choose>
                                        <c:when test="${sessionScope.rol == 'Empleado' }">
                                            <c:choose>
                                                <c:when test="${les.id_rol==3}">
                                                    <option value="${les.id_rol}">${les.rol}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option disabled="" value="${les.id_rol}">${les.rol}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                                    <option value="${les.id_rol}">${les.rol}</option>
                                                </c:otherwise>
                                    </c:choose>
                                    
                                </c:forEach>
                            </select>
                            <label for="cmbRol">Seleccione la ubicación</label>
                        </div>
                        <div class="input-field col s3"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#!" class=" left btn-flat red modal-close waves-effect waves-light">Cancelar</a>
                    <input type="submit" class="left btn-flat green waves-effect waves-light" style="margin-left: 1%" value="Agregar">
                </div>
            </div>
        </form>
        <jsp:include page="/resources/componentes/foot.jsp"/>
    </body>
    <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="resources/js/materialize.js" type="text/javascript"></script>
    <script src="resources/js/js.js" type="text/javascript"></script>
</html>