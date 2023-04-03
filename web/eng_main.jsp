<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    </head>
    <body class="p-10">

        <h2><center><b>Pagina del Ingeniero</b></center></h2>
        </hr>

        <%
            if (request.getMethod().equalsIgnoreCase("post")) 
            {
                String status = request.getParameter("status");
                String solution = request.getParameter("solution");

                String solutionQuery = "";
                
                if (solution!="")
                {
                    solutionQuery = ", case_solution = '" + solution + "' ";
                }
                
                String query = "update tbl_cases set case_status = '" + status + "'" + solutionQuery + " where id_case=" + session.getAttribute("case_id") + ";" ;
                

                
                try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = null;
                        Statement statement = null;
                        String connectionURL = "jdbc:mysql://localhost:3306/elet", USER = "root", PWD = "n0m3l0";

                        connection = DriverManager.getConnection(connectionURL, USER, PWD);
                        statement = connection.createStatement();
                        statement.executeUpdate(query);

                        statement.close();
                        connection.close();
                        
                        response.sendRedirect("pen_rep.jsp");
                    } catch (SQLException e) {

                        out.println(e.getMessage());
                    }

            }
            else if (request.getMethod().equalsIgnoreCase("get")) {
                int case_id = Integer.parseInt(request.getParameter("case_id"));
                session.setAttribute("case_id", case_id);
            }


        %>

        <h2><center><br>Solución al reporte y estatus</br></br></center></h2>

        <form method="post" action="<%= request.getRequestURI()%>">
            <div class="mt-2">
                <div id="tabs-1-panel-1" class="-m-0.5 rounded-lg p-0.5" aria-labelledby="tabs-1-tab-1" role="tabpanel" tabindex="0">
                    <label for="comment" class="sr-only">Comment</label>
                    <div>
                        <textarea rows="5" name="solution" id="solution" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="Solución al reporte."></textarea>
                    </div>
                </div>

                <h2 class="text-lg font-medium text-gray-900 mt-4">Cambio de estatus</h2>
                <div class="pt-4">

                    <fieldset>
                        <legend class="sr-only">Tipo de estatus</legend>
                        <div class="space-y-4 sm:flex sm:items-center sm:space-y-0 sm:space-x-10">

                            <select name="status">
                                <option value="En programacion">En programación</option>
                                <option value="En soporte">En soporte</option>
                                <option value="En mantenimiento">En mantenimiento</option>
                                <option value="Ya programado">Ya programado</option>
                                <option value="Cerrado">Cerrado</option>
                            </select>

                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="mt-2 flex justify-end">
                <button type="submit" class="inline-flex items-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">Subir</button>
            </div>

        </form>

    </body>
</html>
