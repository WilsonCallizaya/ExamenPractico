
<%@page import="com.emergentes.Estudiante"%>
<%
    Estudiante est= (Estudiante) request.getAttribute("miestudent");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Primer Parcial</title>
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
        </style>
    </head>
    <body>
    <div class="titulo">
    <p>PRIMER PARCIAL TEMP-742 </p>
    <p>Nombre: Wilson Ariel Callizaya Mamani </p>                  
    <p>Carnet: 13693963</p>
    </div>
    <h2>Registro de Calificaciones</h2>
    <div class="container">
        <form action="MainServlet" method="post">
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id" value="<%=est.getId()%>" size="10" readonly></td>
            </tr>
            <tr>
                <td>Nombre del estudiante:</td>
                <td><input type="text" name="nombre" value="<%=est.getNombre()%>" size="10" placeholder></td>
            </tr>
            <tr>
                <td>Primer Parcial (sobre 30 puntos)</td>
                <td><input type="text" name="pp" value="<%=est.getPp()%>" size="3" max="30" placeholder=""></td>
            </tr>
            <tr>
                <td>Segundo Parcial (sobre 30 puntos)</td>
                <td><input type="text" name="sp" value="<%=est.getSp()%>" size="3" max="30" placeholder=""></td>
            </tr>
            <tr>
                <td>Tercer Parcial (sobre 40 puntos)</td>
                <td><input type="text" name="tp" value="<%=est.getTp()%>" size="3" max="40" placeholder=""></td>
            </tr>

        </table>
        </div>
            <div><input type="submit" value="Enviar"></div>
        
    </form>
            
    </body>
</html>
