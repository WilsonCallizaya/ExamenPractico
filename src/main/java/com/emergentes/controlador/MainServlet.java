
package com.emergentes.controlador;
import com.emergentes.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
           Estudiante miestu= new Estudiante();
           int id, pos;
           HttpSession ses= request.getSession();
           ArrayList<Estudiante> calificaciones= (ArrayList<Estudiante>)ses.getAttribute("Califestud");
        switch(op){
            case "nuevo": 
                request.setAttribute("miestudent", miestu);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id=Integer.parseInt(request.getParameter("id"));
                pos=buscarIndice(request,id);
                miestu=calificaciones.get(pos);
                request.setAttribute("miestudent", miestu);
                request.getRequestDispatcher("editar.jsp").forward(request,response);
                break;
            case "eliminar":
                id=Integer.parseInt(request.getParameter("id"));
                pos=buscarIndice(request,id);
                if( pos>=0){
                    calificaciones.remove(pos);
                }
                request.setAttribute("miestudent", calificaciones);
                response.sendRedirect("index.jsp");
            break;
        default:
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        HttpSession ses= request.getSession();
         ArrayList<Estudiante> calificaciones =(ArrayList<Estudiante>) ses.getAttribute("Califestud");
         Estudiante miestu= new Estudiante();
         miestu.setId(id);
         miestu.setNombre(request.getParameter("nombre"));
         miestu.setPp(Integer.parseInt(request.getParameter("pp")));
         miestu.setSp(Integer.parseInt(request.getParameter("sp")));
         miestu.setTp(Integer.parseInt(request.getParameter("tp")));
         if(id == 0){
             int idNuevo=crearId(request);
             miestu.setId(idNuevo);
             calificaciones.add(miestu);
         }
         else{
             int pos=buscarIndice(request,id);
             calificaciones.set(pos,miestu);
         }
         request.setAttribute("Califestud", calificaciones);
         response.sendRedirect("index.jsp");
    }
    
    public int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses= request.getSession();
        ArrayList<Estudiante> calificaciones = (ArrayList<Estudiante>) ses.getAttribute("Califestud");
        int pos=-1;
         if(calificaciones != null){
             for(Estudiante ele: calificaciones){
                 ++pos;
                 if( ele.getId()==id){
                     break;
                 }
             }
         }
         return pos;
    }
    public int crearId(HttpServletRequest request){
        HttpSession ses= request.getSession();
        ArrayList<Estudiante> calificaciones=(ArrayList<Estudiante>) ses.getAttribute("Califestud");
        int idn=0;
        for (Estudiante ele: calificaciones){
            idn=ele.getId();
        }
        return idn+1;
    }
}

