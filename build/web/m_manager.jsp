<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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

            <header class="bg-white shadow">
                <div class="mx-auto max-w-7xl py-6 px-4 sm:px-6 lg:px-8">
                    <h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900">Página del Gerente de Mantenimiento</h1>
                </div>
            </header>
            <main>
                <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
                    <!-- Replace with your content -->
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <h1 class="text-xl font-semibold text-gray-900">Reportes</h1>
                                    <p class="mt-2 text-sm text-gray-700">Aquí se mostrarán todos los reportes mandados por el gerente de soporte para su mantenimiento</p>
                                </div>
                                <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">

                                </div>
                            </div>
                            <%
                                String color_status;

                                Class.forName(
                                        "com.mysql.cj.jdbc.Driver");
                                Connection dbConnection = null;

                                try {
                                    String url = "jdbc:mysql://localhost:3306/elet";
                                    Properties info = new Properties();
                                    info.put("user", "root");
                                    info.put("password", "n0m3l0");
                                    dbConnection = DriverManager.getConnection(url, info);
                                    Statement statement = null;
                                    ResultSet rs = null;

                                    statement = dbConnection.createStatement();
                                    String SQLQuery = "SELECT c.id_case, c.case_name, u.user_name as user_username,c.case_area, u2.user_name as admin_username, c.case_status, c.case_creation_date, c.case_last_update_date FROM tbl_cases "
                                            + "c INNER JOIN tbl_users u ON c.usr_id = u.id_user LEFT JOIN tbl_case_admin ca ON c.id_case = ca.case_id "
                                            + "LEFT JOIN tbl_users u2 ON ca.admin_id = u2.id_user where case_area='Mantenimiento' order by c.id_case;";
                                    rs = statement.executeQuery(SQLQuery);

                                    if (!rs.isBeforeFirst()) {
                            %>
                            <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 p-5">No existen registros</h1>
                            <%
                            } else {
                            %>
                            <div class="mt-8 flex flex-col">
                                <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                                    <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                                        <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                                            <table class="max-w-full divide-y divide-gray-200">
                                                <thead>
                                                    <tr>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Nombre</th>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Usuario</th>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Area</th>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Asignado a</th>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Creado</th>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Ultima actualizacion</th>
                                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider"></th>
                                                    </tr>
                                                </thead>

                                                <tbody class="bg-white divide-y divide-gray-200">

                                                    <%
                                                        while (rs.next()) {
                                                            int id_case = rs.getInt("id_case");
                                                            String case_name = rs.getString("case_name");
                                                            String user_username = rs.getString("user_username");
                                                            String case_area = rs.getString("case_area");
                                                            String admin_username = rs.getString("admin_username");
                                                            String case_status = rs.getString("case_status");
                                                            String case_creation_date = rs.getString("case_creation_date");
                                                            String case_last_update_date = rs.getString("case_last_update_date");
                                                            if (case_last_update_date == null) {
                                                                case_last_update_date = "";
                                                            }
                                                            if (admin_username == null) {
                                                                admin_username = "";
                                                            }
                                                    %>

                                                    <tr class="bg-white">
                                                        <!-- id -->
                                                        <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-500">
                                                            <span class="text-gray-900 font-medium"><%=id_case%></span>
                                                        </td>
                                                        <!-- nombre -->
                                                        <td class="max-w-0 w-full px-6 py-4 text-center whitespace-nowrap text-sm text-gray-900">
                                                            <div class="flex">
                                                                <a href="#" class="group inline-flex space-x-2 truncate text-sm">
                                                                    <!-- Heroicon name: solid/cash -->
                                                                    <svg class="flex-shrink-0 h-5 w-5 text-gray-400 group-hover:text-gray-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                    <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd" />
                                                                    </svg>
                                                                    <p class="text-gray-500 truncate group-hover:text-gray-900"><%=case_name%></p>
                                                                </a>
                                                            </div>
                                                        </td>
                                                        <!-- usuario -->
                                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                                            <span class="text-gray-900 font-medium"><%=user_username%></span>
                                                        </td>
                                                        <!-- area -->
                                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                                            <span><%=case_area%></span>
                                                        </td>
                                                        <!-- asignado a -->
                                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                                            <span class="text-gray-900 font-medium"><%=admin_username%></span>
                                                        </td>
                                                        <!-- status -->
                                                        <td class="hidden px-6 py-4 whitespace-nowrap text-sm text-gray-500 md:block">
                                                            <%
                                                                if (case_status != "En mantenimiento") {
                                                                    color_status = "yellow";
                                                                } else {
                                                                    color_status = "green";
                                                                }
                                                            %>
                                                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-<%=color_status%>-100 text-<%=color_status%>-800 capitalize"> <%=case_status%> </span>
                                                        </td>
                                                        <!-- fecha de creacion -->
                                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                                            <time><%=case_creation_date%></time>
                                                        </td>
                                                        <!-- fecha ultima actualizacion -->
                                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                                            <time><%=case_last_update_date%></time>
                                                        </td>
                                                        <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                                                            <a href="rep_vya_mm.jsp?id_case=<%= id_case%>" class="text-indigo-600 hover:text-indigo-900">Analizar</a>     
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                            <%
                                        }
                                        statement.close();
                                        dbConnection.close();
                                    }
                                } catch (SQLException e) {
                                    out.println("SQLException caught: " + e.getMessage());
                                }
                            %>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>