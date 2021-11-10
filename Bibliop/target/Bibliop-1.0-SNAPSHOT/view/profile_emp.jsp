

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    HttpSession b_ses = request.getSession();
    if (b_ses.getAttribute("nick") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else if (!b_ses.getAttribute("rol").equals("Empleado")) {
        response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
    }
    String nick = (String) b_ses.getAttribute("nick");
    String nombre = (String) b_ses.getAttribute("nombre");
    String apellido = (String) b_ses.getAttribute("apellido");
    String direc = (String) b_ses.getAttribute("direccion");
    String correo = (String) b_ses.getAttribute("correo");
    String tel = (String) b_ses.getAttribute("telefono");
%>
<!Menu>
<jsp:include page="/resources/componentes/menu.jsp"/>
<div class="row">
    <!Area de Tabs>
    <div class="col s12">
        <ul id="menu" class="tabs z-depth-1">
            <li class="tab">
                <a href="#start" class="tab blue-text tooltipped" data-position="right" data-tooltip="Inicio">Inicio</a>
            </li>
            <li class="tab">
                <a href="#profile" class="tab blue-text tooltipped" data-position="right" data-tooltip="Perfil de Usuario">Perfil</a>
            </li>
            <li class="tab">
                <a href="#admon" class="tab blue-text tooltipped" data-position="right" data-tooltip="Menu de administracion">Administracion</a>
            </li>
        </ul>
    </div>
    <!--Contenido de los Tabs
    
    *   Inicio: Se muestran tablas de libros y el Buscador                  *
    
    *   Libros: Se muestran todos los libros disponibles y categorizados    *
    
    *   Perfil: Se muestran los datos del datos personales del Usuario      *
    -->

    <!Inicio>
    <div id="start" class="col s12">
        <br>
        <div class="col s8">
            <div class="row">
                <div class="col s5 card grey lighten-4" style=" height: 400px">
                    <span>Ultimos Prestamos</span>
                    <table class="highlight centered">
                        <tr>
                            <th>Libro</th>
                            <th>Fecha de Prestamo</th>
                            <th>Fecha de Vencimiento</th>
                        </tr>
                        <c:forEach items="prestamos" var="p">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="col offset-s1"></div>
                <div class="col s5 card grey lighten-4" style=" height: 400px">
                    <span>Ultimas Compras</span>
                    <table class="highlight centered">
                        <tr>
                            <th>Libro</th>
                            <th>Fecha de Compra</th>
                            <th>Precio</th>
                        </tr>
                        <c:forEach items="compras" var="c">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <div class="col s4">
            <nav>
                <div class="nav-wrapper grey darken-2">
                    <form method="post" action="control?action=book">
                        <div class="input-field">
                            <input id="search" type="search" required="">
                            <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                            <i class="material-icons">close</i>
                        </div>
                    </form>
                </div>
            </nav>
            <div>
                <ul class="collapsible">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">book</i>Inventarios</div>
                        <div class="collapsible-body">
                            <a href="Control?act=inventario&tipo=venta" class="btn">Venta</a> | 
                            <a href="Control?act=inventario&tipo=alquiler" class="btn">Alquiler</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">person</i>Clientes</div>
                        <div class="collapsible-body"><span>
                                <a href="Control?act=listaPersona" class="btn">ir al listado</a>
                            </span></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">closed_caption</i>Libros</div>
                        <div class="collapsible-body"><span>
                                <a href="Control?act=Genero" class="btn white-text green darken-4 tooltipped" data-position="left" data-tooltip="Lista de generos">
                                    <i class="material-icons center">forum</i>
                                </a>
                                <a href="Control?act=autor" class="btn waves-effect yellow darken-2 tooltipped" data-position="left" data-tooltip="Lista de autores">
                                    <i class="material-icons center">contacts</i>
                                </a>
                                <a href="Control?act=Editorial" class="btn white-text blue darken-2 tooltipped" data-position="left" data-tooltip="Lista editoriales">
                                    <i class="material-icons center">description</i>
                                </a>
                                <a href="Control?act=mnuUbicaciones" class="btn white-text red darken-2 tooltipped" data-position="left" data-tooltip="Lista ubicaciones">
                                    <i class="material-icons center">flag</i>
                                </a>
                            </span></div>
                    </li>
                </ul>
            </div>

        </div>
    </div>
    <!Perfil>
    <div id="profile" style="margin: 1%">
        <br>
        <br>
        <br>
        <div class="card">
            <i class="material-icons">person</i><span class="title">Nickname: <b> <%= nick%></b></span><br><br>
            <span class="title"><b>Datos Personales</b></span><br>
            <div class="row">
                <div class="col s4">
                    <p>Nombre:<b> <%= nombre%></b></p>
                    <p>Apellido: <b><%= apellido%></b></p>
                </div>
                <div class="col s4">
                    <p>E-mail:<b> <%= correo%></b></p>
                    <p>Teléfono:<b> <%= tel%></b></p>
                </div>
                <div class="col s4">
                    <p>Dirección: <b><%= direc%></b></p>
                </div>
            </div>
            <br><br>
            <div class="fixed-action-btn" style="position: absolute">
                <a class="btn-floating btn-large blue tooltipped" data-position="top" data-tooltip="Opciones">
                    <i class="large material-icons">apps</i>
                </a>
                <ul>
                    <li><a href="#datosPersonales" class="modal-trigger btn-floating yellow darken-1 tooltipped" data-position="top" data-tooltip="Editar Datos Personales"><i class="material-icons">edit</i></a></li>
                    <li><a href="#datosUsuario" class="modal-trigger btn-floating yellow darken-1 tooltipped" data-position="top" data-tooltip="Editar Datos de Usuario"><i class="material-icons">settings</i></a></li>
                </ul>
            </div>
        </div>        
        <div class="card">
            <i class="material-icons">book</i>
            <span class="title">
                <b>
                    Historial de Libros
                </b>
            </span>
            <table class="centered highlight">
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Fecha</th>
                    <th>Cantidad</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Ejemplo</td>
                    <td>12-12-12</td>
                    <td>0</td>
                </tr>
            </table>
        </div>
    </div>
    <div div id="admon" style="margin: 1%">
        <div class="row">
            <div class="col s6">
                <h4 class="header">Aministrar libros</h4>
                <div class="card horizontal">
                    <div class="card-image">
                        <img src="resources/img/libros_mnu.jpg" alt=""/>
                    </div>
                    <div class="card-stacked">
                        <div class="card-content">
                            <p>Accedera al maestro de libros donde podra agregar editar y eliminar libros asi como todos
                            los datos de los mismos (autores, generos, ubicaciones)</p>
                        </div>
                        <div class="card-action">
                            <a href="Control?act=listaLibros" class="btn">ir a Libros</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s6 card-action">
                <h4 class="header">Aministrar clientes y empleados</h4>
                <div class="card horizontal">
                    <div class="card-image">
                        <img src="resources/img/personas_mnu.jpg" alt=""/>
                    </div>
                    <div class="card-stacked">
                        <div class="card-content">
                            <p>Este menu le permite crear editar y eliminar a sus clientes y empleados crear editar y/o eliminar
                            sus respectivos usuarios</p>
                        </div>
                        <div class="card-action">
                            <a href="Control?act=listaPersona" class="btn">ir al listado</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s3"></div>
            <div class="col s6 card-action">
                <h4 class="header">Aministrar Compras</h4>
                <div class="card horizontal">
                    <div class="card-image">
                        <img src="resources/img/compras_mnu.jpg" alt=""/>
                    </div>
                    <div class="card-stacked">
                        <div class="card-content">
                            <p>En este apartado podra registrar y consultar las compras de libros con sus fechas</p>
                        </div>
                        <div class="card-action">
                            <a href="Control?act=compras" class="btn">ir a Compras</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!Sección de Modales>
<jsp:include page="/resources/componentes/Modal/datosUsuario.jsp"/>
<jsp:include page="/resources/componentes/Modal/datosPersonales.jsp"/>
<jsp:include page="/resources/componentes/Modal/iniciarSesion.jsp"/>
<jsp:include page="/resources/componentes/Modal/crearCuenta.jsp"/>

<!Foot>
<jsp:include page="/resources/componentes/foot.jsp"/>