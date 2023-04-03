<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="p-10">
        <h2><center><b>Pagina del Ingeniero</b></center></h2>



        <h2><center><br>Reportes Pendientes</br></br></center></h2>


        <div class="min-h-full">

            <main>
                <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <main>
                                        <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
                                            <!-- Replace with your content -->
                                            <div class="px-4 py-4 sm:px-0">
                                                <div class="px-4 sm:px-6 lg:px-8">
                                                    <div class="sm:flex sm:items-center">
                                                        <div class="sm:flex-auto">
                                                            <h1 class="text-xl font-semibold text-gray-900">Reportes</h1>
                                                            <p class="mt-2 text-sm text-gray-700">Aquí se mostrarán los reportes abiertos para su análisis</p>
                                                        </div>
                                                    </div>


                                                    <% //Conexión a la bdd
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection dbConnection = null;
                                                        try {
                                                            String url = "jdbc:mysql://localhost:3306/elet";
                                                            String user = "root";
                                                            String pwd = "n0m3l0";
                                                            dbConnection = DriverManager.getConnection(url, user, pwd);
                                                            Statement statement = null;
                                                            ResultSet rs = null;
                                                            statement = dbConnection.createStatement();
                                                            String SQLQuery = "SELECT id_case_admin,admin_id,case_id,case_name,case_desc,case_status,case_creation_date,case_solution FROM tbl_case_admin "
                                                                    + "INNER JOIN tbl_cases ON tbl_case_admin.case_id = tbl_cases.id_case;";
                                                            rs = statement.executeQuery(SQLQuery);

                                                    %>
                                                    <div class="mt-8 flex flex-col">
                                                        <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                                                            <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                                                                <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                                                                    <table class="min-w-full divide-y divide-gray-300">
                                                                        <thead class="bg-gray-50">
                                                                            <tr>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">ID del Admin</th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">ID del reporte</th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Nombre del caso</th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Estatus</th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Solución del reporte</th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Fecha de creación</th>
                                                                                <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6"/>


                                                                            </tr>
                                                                        </thead>
                                                                        <tbody class="divide-y divide-gray-200 bg-white">
                                                                            <%      
                                                                                while (rs.next()) {
                                                                                    Integer id_usuario /*En vez de id_user vas a poner el nombre de la variable para Java que necesites*/ = rs.getInt("admin_id");
                                                                                    /*En vez de usr_id vas a poner el nombre del campo en MySQL que ocupes*/
                                                                                    Integer id_case = rs.getInt("case_id");
                                                                                    String report_name = rs.getString("case_name");
                                                                                    String status_report = rs.getString("case_status");
                                                                                    String last_update_date = rs.getString("case_creation_date");
                                                                                    String case_desc = rs.getString("case_desc");
                                                                                    String case_solution = rs.getString("case_solution");
                                                                                    if (case_solution == null) case_solution="";
                                                                            %>
                                                                            <tr>
                                                                                <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6"><%=id_usuario%></td> <!--En vez de id_user vas a poner el nombre de la variable en Java que vas a desplegar -->                                                                                
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=id_case%></td>
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=report_name%></td>
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=status_report%></td>
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=case_solution%></td>
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=last_update_date%></td>
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                                                                    <a href="eng_main.jsp?case_id=<%=id_case%>">Editar</a>  
                                                                                </td>
                                                                            </tr>                
                                                                            <%
                                                                                    }
                                                                                    statement.close();
                                                                                    dbConnection.close();

                                                                                } catch (SQLException e) {
                                                                                    out.println("SQLException caught: " + e.getMessage());
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
                            </div>
    </body>
</html>