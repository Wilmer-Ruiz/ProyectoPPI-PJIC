/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servidores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelodeclases.Ayudas;
import modelodeclases.Entradas;


public class Login extends HttpServlet {

    /**
     *
     * @param request Para las solicitudes que hagamos.
     * @param response Las respuestas que nos da el servidor
     * @throws ServletException
     * @throws IOException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("<a src=\"\">My link al futuro</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override //Get = Pedir
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override //Post = enviar
    //request = enviando una solicitud0
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pagina = request.getParameter("pagina");
        

        if (pagina.equals("index")) {

            //Atrapamos los tres datos que el usuaro escribe en el Login = inputs
            String paramNombre = request.getParameter("nombre");
            String paramUsuario = request.getParameter("usuario");
            String paramPassword = request.getParameter("password");

            //Crear la sesión del usuario
            HttpSession sesion = request.getSession();

            ArrayList<Entradas> entradas = Ayudas.getEntradas();

            Entradas e = entradas.get(Ayudas.conteo);

            e.setSesion(sesion.getId());
            //Crear variables de sesión de usuario:
            sesion.setAttribute("nombre", paramNombre);
            sesion.setAttribute("user", paramUsuario);
            sesion.setAttribute("pass", paramPassword);

            String respuesta = request.getParameter("res");

            if (respuesta.equals("valido")) {
                //Nos envia a nuestra otra página JSP
                RequestDispatcher despachador = request.getRequestDispatcher("jsp/newHome.jsp");
                despachador.forward(request, response);
            } else {
                request.setAttribute("respuesta", respuesta);
                //Si el String es vacio
                //Nos envia a nuestra otra página JSP
                RequestDispatcher despachador = request.getRequestDispatcher("index.jsp");
                despachador.forward(request, response);
            }
        } 

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
