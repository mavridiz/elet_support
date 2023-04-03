<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-full bg-gray-100">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerente</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="h-full">
        <div class="min-h-full">
            <header class="bg-white shadow">
                <div class="mx-auto max-w-7xl py-6 px-4 sm:px-6 lg:px-8">
                    <h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900">Página del Gerente</h1>
                </div>
            </header>
            <main>
                 <%
                    // Almacenar el id_case con el que fue mandado
                    String ids = request.getParameter("id_case");
                    
                  
                    // Conectarse a la base de datos
                    String url = "jdbc:mysql://localhost:3306/elet";
                    String usuario = "root";
                    String password = "n0m3l0";
                    
                    Class.forName("com.mysql.jdbc.Driver"); 
                    
                    //String de conexión
                    Connection conn = DriverManager.getConnection(url, usuario, password);
                    //Realizar consulta a la tabla cases
                    PreparedStatement ps = conn.prepareStatement("SELECT id_case, case_name, usr_id, case_area, case_status, case_creation_date, case_last_update_date, case_desc FROM tbl_cases where id_case=?");
                    ps.setString(1, ids);
                    ResultSet rs = ps.executeQuery();
                    
                    while (rs.next()) {
                    Integer id_case = rs.getInt("id_case");
                    String case_name = rs.getString(2);
                    String usr_id = rs.getString(3);
                    String case_area = rs.getString(4);
                    String case_status = rs.getString(5);
                    String case_creation_date = rs.getString(6);
                    String case_last_update_date = rs.getString(7);
                    String case_desc = rs.getString(8);
                                             
                    %>
                    <div class="mx-auto max-w-8xl py-6 sm:px-6 lg:px-8">
                    <!-- Replace with your content -->
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <h1 class="text-xl font-semibold text-gray-900">Asignación de reportes</h1>
                                    <p class="mt-2 text-sm text-gray-700">Aquí se mostrará el reporte que va a ser asignado a un ingeniero</p>
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
                                                                <p class="mt-1 max-w-2xl text-sm text-gray-500">Identificador del Reporte: <%=id_case%></p>
                                                            </div>
                                                            <div class="border-t border-gray-200">
                                                                <dl>
                                                                    <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Nombre del Reporte</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_name%></dd>
                                                                    </div>

                                                                    
                                                                    
                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Area que va seleccionada</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_area%></dd>
                                                                    </div>
                                                                              
                                                                    <div class="bg-gray px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Estatus del Reporte</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_status%></dd>
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
                                                        <form action="update_eng.jsp" method="post">
                                                        <input type="hidden" name="id_case" value="<%= request.getParameter("id_case")%>">    
                                                        <label for="case_statusM">Estatus:</label>
                                                        <select id="case_statusM" name="case_statusM">
                                                          <option value="En proceso">En proceso</option>
                                                          <option value="Fin de proceso">Fin de proceso</option>
                                                        </select>
                                                        <label for="case_areaM">ÁREA QUE VA DIRIGIDO:</label>
                                                        <select id="case_areaM" name="case_areaM">
                                                          <option value="Mantenimiento">Mantenimiento</option>
                                                          <option value="Soporte">Soporte</option>
                                                        </select>
                                                        <label for="id_user">Seleccione un ingeniero:</label>
                                                        <select id="id_user" name="id_user">
                                                            <% 
                                                                PreparedStatement ps2 = conn.prepareStatement("SELECT id_user, user_name FROM tbl_users where is_admin=1");
                                                                ResultSet rs2 = ps2.executeQuery();
                                                                while (rs2.next()) {
                                                                    int userId = rs2.getInt("id_user");
                                                                    String userName = rs2.getString("user_name");
                                                            %>
                                                            <option value="<%=userId%>"><%=userName%></option>
                                                            <% 
                                                                }
                                                            %>
                                                        </select>
                                                        <button type="submit" >Actualizar</button>
                                                      </form>
                                                    </td>
                                                    <% 
                                                                rs.close();
                                                                ps.close();
                                                                rs2.close();
                                                                ps2.close();
                                                                conn.close();
                                                                // Cerrar el ResultSet y la conexión a la base de datos
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