<%-- 
    Document   : menu
    Created on : 01-01-2020, 02:12:36 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="resources/css/materialize.css" rel="stylesheet"/>
    </head>
    <body>
        <%
            HttpSession b_ses = request.getSession();
            if (b_ses.getAttribute("nick") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else if (b_ses.getAttribute("rol").equals("Cliente")) {
                response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
            }
            String rol =(String) b_ses.getAttribute("rol");
        %>
        <jsp:include page="/resources/componentes/menu.jsp"/>
        <div class="container">
            <nav>
                <div class="nav-wrapper grey m12">
                    <a href="#" class="brand-logo center">Ubicaciones B!bliop</a>
                    <ul class="left hide-on-med-and-down">
                        <li><a href="Control?act=pasillo">Pasillos</a></li>
                        <li><a href="Control?act=estante">Estantes</a></li>
                        <li><a href="Control?act=perfil&tipo=<%=rol%>">Perfil</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="row">
            <div class="col m3"></div>
            <div class="col m4">
                <h4 class="header">Aministrar Ubicaciones</h4>
                <div class="card horizontal">
                    <div class="card-image">
                        <img src="resources/img/libros_mnu.jpg" alt=""/>
                    </div>
                    <div class="card-stacked">
                        <div class="card-content">
                            <p>En este apartado podra editar modificar editar y eliminar la 
                                construccion de ubicaiones como lo necesite.<br> Teniendo en consideracion que los pasillos se identifican
                                con letras y los estantes con numeros.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script src="resources/js/jquery-3.4.1.min.js"></script>
        <script src="resources/js/materialize.js"></script>
        <jsp:include page="/resources/componentes/foot.jsp"/>
    </body>
</html>
