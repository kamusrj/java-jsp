/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.*;
import Entity.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
/*import java.io.PrintWriter;*/
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Gustavo
 */
@WebServlet(name = "Control", urlPatterns = {"/Control"})
public class Control extends HttpServlet {

    HttpSession bibliopSes;
    RequestDispatcher send;
    LibroDAO libDAO;
    AutorDAO autDAO;
    GeneroDAO genDAO;
    EditorialDAO ediDAO;
    EstanteDAO estDAO;
    pasilloDAO pDAO;
    UsuarioDAO usrDAO;
    PersonaDAO perDAO;
    RolDAO rolDAO;
    FinalidadDAO finDAO;
    LibroVentaDAO libVDAO;
    LibroAlquilerDAO libADAO;

    public Control() {
        super();
        libDAO = new LibroDAO();
        autDAO = new AutorDAO();
        genDAO = new GeneroDAO();
        ediDAO = new EditorialDAO();
        estDAO = new EstanteDAO();
        usrDAO = new UsuarioDAO();
        perDAO = new PersonaDAO();
        rolDAO = new RolDAO();
        pDAO = new pasilloDAO();
        finDAO = new FinalidadDAO();
        libVDAO = new LibroVentaDAO();
        libADAO = new LibroAlquilerDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String act = request.getParameter("act");
        String url;
        switch (act) {
            case "iniciar":
                url = "view/Home.jsp";
                this.iniciar(request, response, url);
                break;
            case "listaPersona":
                url = "view/lista_persona.jsp";
                this.listaPersona(request, response, url);
                break;
            case "ingresar":
                this.ingresar(request, response);
                break;
            case "perfil":
                this.perfil(request, response);
                break;
            case "logOut":
                url = "view/Home.jsp";
                this.salir(request, response, url);
                break;
            case "listaLibros": //muestra la lista de libros registrados
                url = "view/lista_libros.jsp";
                this.listaLibros(request, response, url);
                break;
            case "nuevoLibro"://abre formulario para registrar nuevo libro
                url = "view/nuevo_libro.jsp";
                this.nuevoLibro(request, response, url);
                break;
            case "guardarInfo"://guarda la informacion del formulario de registro de nuevo libro y guarda los cambios
                url = "view/lista_libros.jsp";
                this.guardarInfo(request, response, url);
                break;
            case "guardarPortada"://guarda la portada 
                url = "index.jsp";
                this.guardarPortada(request, response, url);
                break;
            case "editarLibro"://recupera la informacion de libro a editar
                url = "view/nuevo_libro.jsp";
                this.editarLibro(request, response, url);
                break;
            case "eliminarLibro":
                url = "index.jsp";
                this.eliminarLibro(request, response, url);
                break;
            case "create":
                url = "view/lista_persona.jsp";
                this.create(request, response, url);
                break;
            case "delete":
                url = "view/lista_persona.jsp";
                this.delete(request, response, url);
                break;
            case "readID":
                url = "view/editar_persona.jsp";
                this.readID(request, response, url);
                break;
            case "update":
                url = "view/lista_persona.jsp";
                this.update(request, response, url);
                break;
            case "crearUsuarioCliente":
                url = "view/Home.jsp";
                this.crearUsuarioCliente(request, response, url);
                break;
            case "Editorial":
                url = "view/Editorial.jsp";
                this.Editorial(request, response, url);
                break;
            case "saveEditorial":
                url = "view/Editorial.jsp";
                this.InsertarEditorial(request, response, url);
                break;
            case "EditarEditorial":
                url = "view/EdiEditorial.jsp";
                this.EdiEditorial(request, response, url);
                break;
            case "EliminarEditorial":
                url = "view/Editorial.jsp";
                this.EliminarEditorial(request, response, url);
                break;
            case "Genero":
                url = "view/Genero.jsp";
                this.Genero(request, response, url);
                break;
            case "saveGenero":
                url = "view/Genero.jsp";
                this.InsertarGenero(request, response, url);
                break;
            case "EditarGenero":
                url = "view/EdiGenero.jsp";
                this.EdiGenero(request, response, url);
                break;
            case "EliminarGenero":
                url = "view/Genero.jsp";
                this.EliminarGenero(request, response, url);
                break;
            case "autor":
                url = "view/Autor.jsp";
                this.autor(request, response, url);
                break;
            case "saveA":
                url = "view/Autor.jsp";
                this.saveA(request, response, url);
                break;
            case "eliminarA":
                url = "view/Autor.jsp";
                this.eliminarAutor(request, response, url);
                break;
            case "editarA":
                url = "view/newAutor.jsp";
                this.editara(request, response, url);
                break;
            case "mnuUbicaciones":
                url = "view/menu.jsp";
                this.iniciar(request, response, url);
                break;
            case "pasillo":
                url = "view/pasillos.jsp";
                this.listaPasillo(request, response, url);
                break;
            case "estante":
                url = "view/estantes.jsp";
                this.Estante(request, response, url);
                break;
            case "inventario":
                url = "view/inventario_venta.jsp";
                this.inventarioVenta(request, response, url);
                break;
             case "addInVenta":
                url = "view/addInvenVenta.jsp";
                this.addInventarioVenta(request, response, url);
                break;
            case "addlibroV":
                url = "view/inventario_venta.jsp";
                this.addLibroVenta(request, response, url);
                break;
            case "editLibVenta":
                url = "view/addInvenVenta.jsp";
                this.editInventarioVenta(request, response, url);
                break;
        }
    }

    protected void editInventarioVenta(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
         try {
             int id = Integer.parseInt(request.getParameter("id"));
             request.setAttribute("prop", "hide");
             request.setAttribute("listaProd", libVDAO.listaDisponibles());
             request.setAttribute("objEdit", libVDAO.recuperarPorID(id));
         } catch (Exception e) {
             e.printStackTrace();
         }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }
    
    protected void addLibroVenta(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            Libro lib = new Libro();
            LibroVenta libv = new LibroVenta();
            lib.setId_libro(Integer.parseInt(request.getParameter("cmbLibro")));
            libv.setExistencia(0);
            libv.setStock(Integer.parseInt(request.getParameter("txtStock")));
            libv.setPrecio_venta(Double.parseDouble(request.getParameter("txtPrecio")));
            libv.setLibro(lib);
            String msj = libVDAO.guardar(libv);
            request.setAttribute("msjS", msj);
            request.setAttribute("listaInventario", libVDAO.listaLibros());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }
    
    protected void inventarioVenta(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            String ti = request.getParameter("tipo");
            if(ti.equalsIgnoreCase("venta")){
                request.setAttribute("listaInventario", libVDAO.listaLibros());
            }else{
                url="view/inventario_alquiler.jsp";
                request.setAttribute("listaInventario", libADAO.listaLibros());
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }
    
    protected void addInventarioVenta(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
         try {
             request.setAttribute("listaProd", libVDAO.listaDisponibles());
         } catch (Exception e) {
             e.printStackTrace();
         }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }
    
    protected void listaPasillo(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        try {
            request.setAttribute("pasillo", pDAO.listaPasillos());
        } catch (Exception e) {
            System.out.println("Erro pC "+e.getMessage());
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }
    
    protected void Estante(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        try {
            request.setAttribute("estante", estDAO.listaEstante());
            request.setAttribute("pasillo", pDAO.listaPasillos());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }
    
    /*Muestra Vista Autor*/
    protected void autor(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        try {
            request.setAttribute("autor", autDAO.llenarAutor());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error" + e.getMessage());
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }
    
    protected void eliminarAutor(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        String msj="";
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            msj = autDAO.Eliminar(id);
            request.setAttribute("autor", autDAO.llenarAutor());
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error" + e.getMessage());
        }
        request.setAttribute("msjS", msj);
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }

    protected void editara(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
                int idEditar = Integer.parseInt(request.getParameter("id"));
               try {
                   request.setAttribute("auto", autDAO.llenarPorID(idEditar));
               } catch (Exception e) {
                   e.printStackTrace();
                   
                   System.out.println("Error" + e.getMessage());
               }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }
    
    protected void saveA(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        Autor a = new Autor();
        String idDAto = request.getParameter("txtID");
        a.setNombre(request.getParameter("txtNombre"));
        a.setApellido(request.getParameter("txtApellido"));
        a.setPseudonimo(request.getParameter("txtPseudonimo"));
        String msj = "";
        try {
            if (idDAto == null || idDAto.isEmpty()) {
                msj = autDAO.guardar(a);
            } else {
                a.setId_autor(Integer.parseInt(idDAto));
                msj = autDAO.actualizar(a);
            }
            request.setAttribute("msjS", msj);
            request.setAttribute("autor", autDAO.llenarAutor());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error" + e.getMessage());
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }

    /* Llenar dtos Edicion*/
    protected void EdiEditorial(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        int idEditar = Integer.parseInt(request.getParameter("id"));
        try {
            request.setAttribute("edi", ediDAO.EditarIdEditorial(idEditar));
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }

    /*Eliminar datos*/
    protected void EliminarEditorial(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        int idEliminar = Integer.parseInt(request.getParameter("id"));
        try {
            String msj = ediDAO.EliminarEditorial(idEliminar);
            request.setAttribute("msjS", msj);
            request.setAttribute("Editorial", ediDAO.llenarEditorial());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);

    }

    protected void InsertarEditorial(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        Editorial ed = new Editorial();
        String idEdi = request.getParameter("idEditorial");
        ed.setEditorial(request.getParameter("saveEditorial"));
        String msj = "";
        try {
            if (idEdi == null || idEdi.isEmpty()) {
                msj = ediDAO.InsertarEditorial(ed);
            } else {
                ed.setId_editorial(Integer.parseInt(idEdi));
                msj = ediDAO.ActualizarEditorial(ed);

            }

            request.setAttribute("msjS", msj);
            request.setAttribute("Editorial", ediDAO.llenarEditorial());

        } catch (Exception e) {
        }

        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);

    }

    protected void Editorial(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {

        try {
            request.setAttribute("Editorial", ediDAO.llenarEditorial());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }

    /*Mostrar datos*/
    protected void Genero(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {

        try {

            request.setAttribute("Genero", genDAO.llenarGenero());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);

    }

    /*Insertar datos / Modificar datos*/
    protected void InsertarGenero(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        Genero g = new Genero();
        String idGen = request.getParameter("idGenero");
        g.setGenero(request.getParameter("saveGenero"));
        String msj = "";
        try {
            if (idGen == null || idGen.isEmpty()) {
                msj = genDAO.InsertarGenero(g);
            } else {
                g.setId_genero(Integer.parseInt(idGen));
                msj = genDAO.ActualizarGenero(g);
            }
            request.setAttribute("msjS", msj);
            request.setAttribute("Genero", genDAO.llenarGenero());
        } catch (Exception e) {
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }

    /* Llenar datos Genero*/
    protected void EdiGenero(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        int idGenero = Integer.parseInt(request.getParameter("id"));
        try {
            request.setAttribute("gen", genDAO.EditarIdGenero(idGenero));
        } catch (Exception e) {
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }

    /*Eliminar datos*/
    protected void EliminarGenero(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        int idEliminar = Integer.parseInt(request.getParameter("id"));
        try {
            String msj = genDAO.EliminarGenero(idEliminar);
            request.setAttribute("msjS", msj);
            request.setAttribute("Genero", genDAO.llenarGenero());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(ruta);
        send.forward(request, response);
    }

    protected void listaPersona(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            request.setAttribute("usuario", usrDAO.readUsuario());
            request.setAttribute("listaRoles", rolDAO.readRol());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        Persona per = new Persona();
        Usuario usr = new Usuario();
        per.setId_persona(Integer.parseInt(request.getParameter("id_usr")));
        per.setNombre(request.getParameter("txtNombre"));
        per.setApellido(request.getParameter("txtApellido"));
        per.setCorreo(request.getParameter("emaCorreo"));
        per.setTelefono(request.getParameter("txtTelefono"));
        per.setDireccion(request.getParameter("txtDireccion"));
        usr.setId_usr(Integer.parseInt(request.getParameter("id_usr")));
        usr.setNickname(request.getParameter("txtNickname"));
        usr.setClave(request.getParameter("passClave"));
        try {
            String msj = perDAO.updatePersona(per);
            String msj2 = usrDAO.updateUsuario(usr);
            request.setAttribute("msj", msj);
            request.setAttribute("msj2", msj2);
            request.setAttribute("usuario", usrDAO.readUsuario());
            request.setAttribute("listaRoles", rolDAO.readRol());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void readID(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            send = request.getRequestDispatcher(url);
            request.setAttribute("usr", usrDAO.readUsuarioID(id));
            send.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String msj = usrDAO.deleteUsuario(id);
            request.setAttribute("msj", msj);
            request.setAttribute("usuario", usrDAO.readUsuario());
            request.setAttribute("listaRoles", rolDAO.readRol());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void create(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            Usuario usr = new Usuario();
            Persona per = new Persona();
            Rol r = new Rol();
            per.setNombre(request.getParameter("txtNombre"));
            per.setApellido(request.getParameter("txtApellido"));
            per.setCorreo(request.getParameter("emaCorreo"));
            per.setTelefono(request.getParameter("txtTelefono"));
            per.setDireccion(request.getParameter("txtDireccion"));
            usr.setNickname(request.getParameter("txtNickname"));
            usr.setClave(request.getParameter("passClave"));
            r.setId_rol(Integer.parseInt(request.getParameter("cmbRol")));
            usr.setPersonadato(per);
            usr.setRoldato(r);
            String msj = usrDAO.createUsuario(usr);
            request.setAttribute("usuario", usrDAO.readUsuario());
            request.setAttribute("listaRoles", rolDAO.readRol());
            request.setAttribute("msj", msj);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void ingresar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usr = new Usuario();
        usr.setNickname(request.getParameter("txtNombre"));
        usr.setClave(request.getParameter("passContrasenia"));
        String m = "", url = "view/Home.jsp";
        try {
            if (usrDAO.validarUsr(usr)) {
                if (usrDAO.validarPass(usr)) {
                    if (usrDAO.validarUsrPass(usr)) {
                        Usuario ousr;
                        ousr = usrDAO.llenarSesion(usr);
                        bibliopSes = request.getSession(true);
                        bibliopSes.setAttribute("nick", ousr.getNickname());
                        bibliopSes.setAttribute("nombre", ousr.getPersonadato().getNombre());
                        bibliopSes.setAttribute("apellido", ousr.getPersonadato().getApellido());
                        bibliopSes.setAttribute("direccion", ousr.getPersonadato().getDireccion());
                        bibliopSes.setAttribute("correo", ousr.getPersonadato().getCorreo());
                        bibliopSes.setAttribute("telefono", ousr.getPersonadato().getTelefono());
                        bibliopSes.setAttribute("rol", ousr.getRoldato().getRol());
                        if (ousr.getRoldato().getRol().equalsIgnoreCase("propietario")) {
                            url = "view/profile_prop.jsp";
                        } else if (ousr.getRoldato().getRol().equalsIgnoreCase("empleado")) {
                            url = "view/profile_emp.jsp";
                        } else if (ousr.getRoldato().getRol().equalsIgnoreCase("cliente")) {
                            url = "view/profile_cli.jsp";
                        }
                        m = "$(document).ready(function () {\n"
                                + "alertify.success('Bienvenido/a')\n"
                                + "});";
                    } else {
                        m = "$(document).ready(function () {\n"
                                + "alertify.error('Sus credenciales no coinciden')\n"
                                + "});";
                    }
                } else {
                    m = "$(document).ready(function () {\n"
                            + "alertify.error('La clave no es valida')\n"
                            + "});";
                    request.setAttribute("usrErr", usr.getNickname());
                }
            } else {
                m = "$(document).ready(function () {\n"
                        + "alertify.error('El usuario no existe')\n"
                        + "});";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("msjS", m);
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void eliminarLibro(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        String msj = "Aun no se procesa la peticion";
        try {
            int idElim = Integer.parseInt(request.getParameter("id"));
            msj = libDAO.eliminarLibro(idElim);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("msj", msj);
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void editarLibro(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));//capruta el id del libro a editar 
            request.setAttribute("libroEd", libDAO.recuperarPorID(id)); //recupera el registro del libro a editar
            //llena los cmb con la informacion necesaria
            request.setAttribute("listaAutores", autDAO.listaAutores());
            request.setAttribute("listaGenero", genDAO.listaGenero());
            request.setAttribute("listaEditorial", ediDAO.listaEditorial());
            request.setAttribute("listaEstante", estDAO.listaEstante());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void guardarPortada(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            Libro lib = new Libro();
            FileItemFactory file_factory = new DiskFileItemFactory();
            ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
            List items = servlet_up.parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
                FileItem item = (FileItem) items.get(i);
                /*item.isFormField() false=input file; true=text field*/
                if (!item.isFormField()) {
                    /*cual sera la ruta al archivo en el servidor*/
                    File archivo_server = new File("C:\\Users\\LENOVO\\Documents\\NetBeansProjects\\Bibliop\\src\\main\\webapp\\resources\\img\\portadas\\" + item.getName());
                    /*y lo escribimos en el servido*/
                    item.write(archivo_server);
                    lib.setPortada("resources/img/portadas/" + item.getName());
                } else {
                    lib.setId_libro(Integer.parseInt(item.getString()));//captura el id del libro al que pertenece la imagen
                }
                String msj = libDAO.subirImagen(lib);//actualiza los datos de la portada en la bd
                request.setAttribute("listaLibro", libDAO.listaLibros());//actualiza la lista de libros
                request.setAttribute("msj", msj);
            }
        } catch (Exception e) {
            System.out.println("error gp " + e.getMessage());
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void guardarInfo(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        //Crea los obajetos necesarios para guardar un libro
        Libro lib = new Libro();
        Genero gen = new Genero();
        Autor aut = new Autor();
        Editorial edi = new Editorial();
        Estante est = new Estante();
        //captura los datos del formulario para llenar el objeto con el que guardamos el nuevo libro
        lib.setTitulo(request.getParameter("txtTitulo"));
        lib.setPortada("resources/img/default.jpg");//guarda una portada por defecto para cada libro
        lib.setSinopsis(request.getParameter("txtSinopsis"));
        lib.setCosto(Double.parseDouble(request.getParameter("txtCosto")));
        gen.setId_genero(Integer.parseInt(request.getParameter("cmbGenero")));
        aut.setId_autor(Integer.parseInt(request.getParameter("cmbAutor")));
        edi.setId_editorial(Integer.parseInt(request.getParameter("cmbEditorial")));
        est.setId_estante(Integer.parseInt(request.getParameter("cmbEstante")));
        lib.setAutor(aut);
        lib.setEditorial(edi);
        lib.setGenero(gen);
        lib.setEstante(est);
        String msj = "Algo salio mal... ";
        try {
            if (request.getParameter("txtId").isEmpty() || request.getParameter("txtId") == "") {
                msj = libDAO.guardarInfoLibro(lib); //guarda la informacion y devuelve un msj de exito o fallo
            } else {
                lib.setId_libro(Integer.parseInt(request.getParameter("txtId")));//asignamos el id del libro a editar
                msj = libDAO.actualizarLibro(lib);//actualiza la informacion y devuelve un msj de exito o fallo
            }
            request.setAttribute("listaLibro", libDAO.listaLibros());//Actualizamos la lista
        } catch (Exception e) {
            msj += e.getMessage();
            e.printStackTrace();
        }
        request.setAttribute("msj", msj);//mostramos el msj
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void nuevoLibro(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            //llena los cmb con los datos necesarios
            request.setAttribute("listaAutores", autDAO.listaAutores());
            request.setAttribute("listaGenero", genDAO.listaGenero());
            request.setAttribute("listaEditorial", ediDAO.listaEditorial());
            request.setAttribute("listaEstante", estDAO.listaEstante());
            request.setAttribute("finalidad", finDAO.listaFinalidad());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void listaLibros(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        try {
            request.setAttribute("listaLibro", libDAO.listaLibros());
        } catch (Exception e) {
            e.printStackTrace();
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void salir(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        bibliopSes.invalidate();
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void crearUsuarioCliente(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        Usuario usr = new Usuario();
        Persona per = new Persona();
        Rol r = new Rol();
        String msj = "";
        per.setNombre(request.getParameter("txtNombre"));
        per.setApellido(request.getParameter("txtApellido"));
        per.setCorreo(request.getParameter("emaCorreo"));
        per.setTelefono(request.getParameter("txtTelefono"));
        per.setDireccion(request.getParameter("txtDireccion"));
        usr.setNickname(request.getParameter("txtNickname"));
        usr.setClave(request.getParameter("passClave"));
        r.setId_rol(3);
        usr.setPersonadato(per);
        usr.setRoldato(r);
        try {
            msj = usrDAO.createUsuario(usr);

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("msjS", "$(document).ready(function () {\n"
                + "alertify.success('Ya puede iniciar sesion')\n"
                + "});");//mostramos el msj  
        request.setAttribute("msj", msj);//mostramos el msj   
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void iniciar(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    protected void perfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "", tipo = request.getParameter("tipo");
        if (tipo.equalsIgnoreCase("propietario")) {
            url = "view/profile_prop.jsp";
        } else if (tipo.equalsIgnoreCase("empleado")) {
            url = "view/profile_emp.jsp";
        } else if (tipo.equalsIgnoreCase("cliente")) {
            url = "view/profile_cli.jsp";
        }
        send = request.getRequestDispatcher(url);
        send.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
