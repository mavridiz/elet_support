<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charesultadoet=UTF-8">
        <title>Soli_Rep</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="h-full">
        <div class="min-h-full">
            
        <header class="bg-white">
                <div class="mx-auto max-w-7xl py-6 px-4 sm:px-6 lg:px-8">
                    <h1 class="text-2xl font-bold leading-tight tracking-tight text-gray-900">Reportes pendientes</h1>
                </div>
        </header>
        <main>
                <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <h1 class="text-xl font-semibold text-gray-900">Reportes</h1>
                                    <p class="mt-2 text-sm text-gray-700">Aquí se mostrarán todos los reportes abiertos para su análisis</p>
                                </div>
                                <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">

                                </div>
                            </div>
                   <%
                    try{
                    // Conectaresultadoe a la base de datos
                    String url = "jdbc:mysql://localhost:3306/elet";
                    String usuario = "root";
                    String password = "n0m3l0";
                    
                    Class.forName("com.mysql.jdbc.Driver"); 
                   
                    Connection conexion = DriverManager.getConnection(url, usuario, password);
                    
                    // Ejecutar la consulta SQL para obtener los reportes
                    Statement consulta = conexion.createStatement();
                    ResultSet resultado = consulta.executeQuery("SELECT id_case, usr_id, case_name, case_status, case_area, case_creation_date, case_last_update_date, case_solution FROM tbl_cases");
                    
                    %>
                    
                    <div class="mt-8 flex flex-col">
                         <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                                <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                                    <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                                        <table class="min-w-full divide-y divide-gray-300">
                                            <thead class="bg-gray-50">
                                                <tr>
                                                    <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">ID de Reporte</th>
                                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Id de Usuario</th>
                                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Nombre del Caso</th>
                                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Estatus</th>
                                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Areá que va asignado</th>
                                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Fecha de creación</th>
                                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Fecha de última actualización</th>
                                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Solución del reporte</th>
                                                    <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                                                        <span class="sr-only">Analizar</span>
                                                    </th>
                            </tr>
                        </thead>
                    <tbody class="divide-y divide-gray-200 bg-white">
                    
                    <%
                    while (resultado.next()) {
                    String case_last_update_date;
                    String case_solution;
                    Integer id_case = resultado.getInt("id_case");
                    String case_name = resultado.getString(2);
                    String usr_id = resultado.getString(3);
                    String case_status = resultado.getString(4);
                    String case_area = resultado.getString(5);
                    String case_creation_date = resultado.getString(6);
                    if(resultado.getString(7)==null){
                        case_last_update_date = "Sin modificaciones";
                    }
                    else{
                    case_last_update_date = resultado.getString(7);}
                    if(resultado.getString(8)==null){
                        case_solution = "Sin solución";
                    }
                    else{
                    case_solution = resultado.getString(8);
                    }                        
                    %>
                                        <%-- // Mostrar los reportes en una tabla HTML--%>    
                    <tr>
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6"><%= id_case %></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= case_name %></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= usr_id %></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= case_status %></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= case_area %></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= case_creation_date %></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= case_last_update_date %></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= case_solution %></td>
                        <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                        <a href="rep_vya.jsp?id_case=<%= id_case %>" class="text-indigo-600 hover:text-indigo-900">Analizar</a>     
                        </td>
                    </tr>                           
                    
                    <% 
                        }
                        }
                        catch(Exception e){
                        out.println(e);
                        out.println("Something went wrong");
                        }
                    %>
                  </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>