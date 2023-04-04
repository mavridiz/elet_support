<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-full bg-gray-100">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerente de Soporte</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="h-full">
        <div class="min-h-full">
            <nav class="bg-stone-900">
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div class="flex h-16 items-center justify-between">
                        <div class="flex items-center">
                            <div class="flex-shrink-0">

                            </div>
                            <div class="hidden md:block">
                                <div class="ml-10 flex items-baseline space-x-4">
                                    <!-- Current: "bg-indigo-700 text-white", Default: "text-white hover:bg-indigo-500 hover:bg-opacity-75" -->
                                    <h1 class="text-white">Alknos Support</h1>
                                </div>
                            </div>
                        </div>
                        <div class="hidden md:block">
                            <div class="ml-4 flex items-center md:ml-6">
                                <form action="logout.jsp">
                                <button type="submit" id="btnSubmit" name="btnSubmit" class="rounded-md bg-stone-600 py-2 px-3 text-sm font-semibold text-white shadow-sm hover:bg-stone-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-stone-600">Cerrar Sesión</button>
                                </form>
                            </div>
                        </div>
                        <div class="-mr-2 flex md:hidden">
                            <!-- Mobile menu button -->
                            <button type="button" class="inline-flex items-center justify-center rounded-md bg-stone-900 p-2 text-indigo-200 hover:bg-stone-500 hover:bg-opacity-75 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-indigo-600" aria-controls="mobile-menu" aria-expanded="false">
                                <span class="sr-only">Open main menu</span>
                                <!--
                                  Heroicon name: outline/bars-3
                    
                                  Menu open: "hidden", Menu closed: "block"
                                -->
                                <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                                </svg>
                                <!--
                                  Heroicon name: outline/x-mark
                    
                                  Menu open: "block", Menu closed: "hidden"
                                -->
                                <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </nav>
            <header class="bg-white shadow">
                <div class="mx-auto max-w-7xl py-6 px-4 sm:px-6 lg:px-8">
                    <h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900">Página del Gerente de Soporte</h1>
                </div>
            </header>
            <main>
                 <%
                    // Almacenar el id_case con el que fue mandado
                    String ids = request.getParameter("id_case");
                    
                  
                    // Conectaresultadoe a la base de datos
                    String url = "jdbc:mysql://localhost:3306/elet";
                    String usuario = "root";
                    String password = "n0m3l0";
                    
                    Class.forName("com.mysql.jdbc.Driver"); 
                    
                    //String de conexión
                    Connection conexion = DriverManager.getConnection(url, usuario, password);
                    
                    // Ejecutar la consulta SQL para obtener los reportes
                    //Query
                    PreparedStatement pst = conexion.prepareStatement("SELECT id_case, case_name, usr_id, case_area, case_status, case_creation_date, case_last_update_date, case_desc FROM tbl_cases where id_case=?");
                    //Posición del id
                    pst.setString(1, ids);
                    //Almacenamos el Query
                    ResultSet resultado = pst.executeQuery();
                    
                    %>
                                      
                    <%
                    while (resultado.next()) {
                    Integer id_case = resultado.getInt("id_case");
                    String case_name = resultado.getString(2);
                    String usr_id = resultado.getString(3);
                    String case_area = resultado.getString(4);
                    String case_status = resultado.getString(5);
                    String case_creation_date = resultado.getString(6);
                    String case_last_update_date = resultado.getString(7);
                    String case_desc = resultado.getString(8);
                                             
                    %>
                    <div class="mx-auto max-w-8xl py-6 sm:px-6 lg:px-8">
                    <!-- Replace with your content -->
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <h1 class="text-xl font-semibold text-gray-900">Análisis y Verificación de Reportes</h1>
                                    <p class="mt-2 text-sm text-gray-700">Aquí se mostrará el reporte seleccionado para su verificación y determinar si es tarea de soporte o de mantenimiento</p>
                                </div>
                                <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
                                </div>
                            </div>
                            <div class="mt-8 flex flex-col">
                                <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">                                    
                                    <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">

                                        <table class="table-fixed border-spacing-2">
                                            <tbody>
                                                <tr>
                                                    <td>

                                                        <div class="overflow-hidden bg-white shadow sm:rounded-lg max-w-5xl">
                                                            <div class="px-4 py-5 sm:px-6">
                                                                <h3 class="text-base font-semibold leading-6 text-gray-900">Reporte</h3>
                                                                <p class="mt-1 max-w-2xl text-sm text-gray-500">Identificador del Reporte: <%= id_case %></p>
                                                            </div>
                                                            <div class="border-t border-gray-200">
                                                                <dl>
                                                                    <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Nombre del Reporte</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%= case_name %></dd>
                                                                    </div>

                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Id Usuario</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%= usr_id %></dd>
                                                                    </div>
                                                                    
                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Area que va seleccionada</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%= case_area %></dd>
                                                                    </div>
                                                                              
                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Estatus del Reporte</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%= case_status %></dd>
                                                                    </div>

                                                                    <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Fecha de creación</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%= case_creation_date %></dd>
                                                                    </div>

                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Fecha de su última actualización</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%= case_last_update_date %></dd>
                                                                    </div>

                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Descripción del reporte</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%= case_desc %></dd>
                                                                    </div>
                                                                </dl>
                                                            </div>
                                                        </div>
                                                    <%
                                                        }                                                      
                                                        
                                                        %> 
                                                    </td>
                                                    <td>
                                                        <div class='p-8'></div>
                                                    </td>
                                                    <td>
                                                        <div class="sm:flex-auto">
                                                            <h1 class="text-xl font-semibold text-gray-900">Actualización del estatus del reporte</h1>
                                                            <p class="mt-2 text-sm text-gray-700">En este apartado se actualiza el estatus para cuando se empieza a análizar</p>
                                                        </div>
                                                        <form action="status_act.jsp" method="post">
                                                        <label for="case_statusM">Estatus:</label>
                                                        <select id="case_statusM" name="case_statusM">
                                                          <option value="En proceso">En proceso</option>
                                                          <option value="abierto">Abierto</option>
                                                        </select>
                                                        <input type="hidden" name="id_case" value="<%= request.getParameter("id_case") %>">
                                                        <button type="submit">Actualizar</button>
                                                      </form>
                                                        <div class="sm:flex-auto">
                                                            <h1 class="text-xl font-semibold text-gray-900">Para que área va a ser asignado</h1>
                                                            <p class="mt-2 text-sm text-gray-700">En este apartado se selecciona para que areá va a ser el reporte</p>
                                                        </div>

                                                      <div>
                                                        <label for="area">Área que va dirigido el reporte:</label>
                                                        <button type="button" name="area" value="Soporte" >
                                                            <a href="rep_eng.jsp?id_case=<%= ids %>" class="text-indigo-600 hover:text-indigo-900">Ingeniero de Soporte</a>
                                                        </button>
                                                        <button type="button" name="area" value="Mantenimiento">
                                                            <a href="rep_man.jsp?id_case=<%= ids %>" class="text-indigo-600 hover:text-indigo-900">Gerente de mantenimiento</a>
                                                        </button>
                                                      </div>

                                                    </td>
                                                    <%
                                                        
                                                        pst.close();
                                                                conexion.close();
                                                        
                                                        %> 
                                                </tr>
                                            </tbody>
                                        </table>
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