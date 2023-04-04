<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Integer id_case = Integer.parseInt(request.getParameter("id_case"));

            Connection conn = null;
            String case_status = request.getParameter("case_status");
            String case_area = request.getParameter("case_area");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elet", "root", "n0m3l0");
            PreparedStatement stmt1 = null;
            PreparedStatement stmt2 = null;

            try {
                if (request.getParameter("id_user") != null) {
                    Integer id_user = Integer.parseInt(request.getParameter("id_user"));
                    String query1 = "INSERT INTO tbl_case_admin (case_id, admin_id) VALUES (?, ?);";
                    stmt1 = conn.prepareStatement(query1);
                    stmt1.setInt(1, id_case);
                    stmt1.setInt(2, id_user);
                    try {
                        int rowsInserted = stmt1.executeUpdate();
                    } catch (SQLException e) {
                        System.out.println(e);
                    }
                } else {

                    String query2 = "UPDATE tbl_cases SET case_area='Soporte' WHERE id_case = ? ;";
                    stmt2 = conn.prepareStatement(query2);
                    stmt2.setInt(1, id_case);
                    int rowsUpdated = stmt2.executeUpdate();
                }
                // Confirmar la transacción
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                if (stmt1 != null) {
                    stmt1.close();
                }
                if (stmt2 != null) {
                    stmt2.close();
                }
                if (conn != null) {
                    conn.close();
                    response.sendRedirect("indexmm.jsp");
                }
            }
        %>
    </body>
</html>