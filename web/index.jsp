<%-- 
    Document   : index
    Created on : Apr 13, 2018, 5:18:59 AM
    Author     : maple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ww3_recruitmentPackage.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%! int id;String name; int age; String email; Session session1 = null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table width="220" border="1">
            <tr><th>ID</th><th>NAME</th><th>AGE</th><th>EMAIL</th></tr>                     
            <%
                Configuration cf=new Configuration();
                cf.configure();
                SessionFactory sf = cf.buildSessionFactory();
                session1 =sf.openSession();
                String SQL_QUERY ="from Soldier";
                Query query = session1.createQuery(SQL_QUERY);
                Iterator it=query.iterate();
                while(it.hasNext())
                {
                    Soldier s = (Soldier) it.next();
                    id = s.getId();
                    name = s.getName();
                    age = s.getAge();
                    email = s.getEmail();
                    %>                  
                    <tr>
                        <td><%=id%></td>
                        <td><%=name%></td>
                        <td><%=age%></td>
                        <td><%=email%></td>
                    </tr>
                    <%
                }
            session1.close();
            %>
        </table>
        
        <h1>We want you for the war!</h1>
        <form action="SoldierManagement" method="POST">
            First Name:<input type="text" name="name"/><br><br/>
            Age:<input type="text" name="age"/><br><br/>
            Email:<input type="text" name="email"/><br><br/>
            <input type="submit" name="action" value="add"/>
        </form>
    </body>
</html>
