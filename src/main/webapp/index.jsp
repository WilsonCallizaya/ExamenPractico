<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Estudiante"%>
<%
    if(session.getAttribute("Califestud")== null){
        ArrayList<Estudiante> Calest= new ArrayList<Estudiante>();
        session.setAttribute("Califestud", Calest);
    }
    ArrayList<Estudiante> calificaciones =(ArrayList<Estudiante>) session.getAttribute("Califestud");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parcial Practico</title>
        <style>
        body {
            text-align: center; /* Alineación del texto al centro */
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 10px auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            display: inline-block; 
            text-align: left;
        }
        .titulo {
            width: 50%;
            margin: 10px auto;
            border: 1px solid #ccc;
            border-radius: 1px;
            background-color: #f9f9f9;
            display: inline-block; 
            text-align: center;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        </style>
    </head>
    <body>
    <div class="titulo">
    <p>PRIMER PARCIAL TEMP-742 </p>
    <p>Nombre: Wilson Ariel Callizaya Mamani </p>                  
    <p>Carnet: 13693963</p>
    </div>
    <h2>Registro de Calificaciones</h2>
<a href="MainServlet?op=nuevo">Nuevo</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>P1(30)</th>
            <th>P2(30)</th>
            <th>P3(40)</th>
            <th></th>
            <th></th>
        </tr>
        <%
            if (calificaciones != null){
                for(Estudiante item: calificaciones){
                    
                
            %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getNombre()%></td>
            <td><%= item.getPp()%></td>
            <td><%= item.getSp() %></td>
            <td><%= item.getTp() %></td>
            <td><a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a></td>
            <td><a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                   onclick="return(confirm('¿Seguro desea eliminar?'))">Borrar</a></td>
        </tr>
        <%
            }
            }
            %>
    </table>
    </body>
    
    
</html>
