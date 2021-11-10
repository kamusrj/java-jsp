<%-- 
    Document   : EdiEditorial
    Created on : 12-24-2019, 12:48:14 PM
    Author     : Kamus
--%>

<!kamus>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/resources/componentes/menu.jsp"/>
</div>
<div class="container ">   
    <form method="post" action="Control?act=saveEditorial">
        <div class="row">
            <div class=" card light-green white-text center z-depth-2">
                <h3>Editorial</h3>
            </div>
        </div>
        <h5>Editar</h5>
        <div class="row">
            <div class="col m6">
                <input type="hidden" name="idEditorial" value="${edi.id_editorial}"/>
                <input type="text" name="saveEditorial" required="" value="${edi.editorial}"/>
            </div>
            <div class="col m3"></div>
        </div>
        <div class="row">
            <div class="col m2">
                <input type="submit" name="btnSGenero" value="GUARDAR" class="btn btn-block btn-danger" >
            </div>
            <div class="col s1">
                    <a href="Control?act=Editorial" data-position="right" data-tooltip="Volver a lista" class="btn tooltipped btn-block large waves-effect waves-green red lighten-1">
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
