<%-- 
    Document   : update
    Created on : 14 Feb, 2017, 2:56:37 PM
    Author     : mca1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.java.*,org.hibernate.*,org.hibernate.cfg.*"%>
<%! int id;String pw;String name;String em;Session session1=null;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
    </head>
    <h1>Before Updation</h1>
    <jsp:include page="showuser.jsp"/>
    <body>
        <h1>After Updation</h1>
        <table width="220" border="1" class="table-bordered">
            <tr><th>Id</th><th>Name</th><th>Password</th><th>Email</th></tr>
            <% int i=Integer.parseInt(request.getParameter("id"));
            String name=request.getParameter("name");
            String pw=request.getParameter("password");
            String em=request.getParameter("email");
            Configuration cf=new Configuration();
            cf.configure();
            SessionFactory sf=cf.buildSessionFactory();
            session1=sf.openSession();
            User user=null;
            session1.beginTransaction();
            user=(User)session1.get(User.class,i);//retive object which we want to update
            user.setName(name);
            user.setPassword(pw);
            user.setEmail(em);
            
            session1.update(user);//update to database table
            session1.getTransaction().commit();
            String SQL_QUERY="from User";
            Query query=session1.createQuery(SQL_QUERY);
            Iterator it=query.iterate();
            while(it.hasNext())
            {
                User e=(User)it.next();
                id=e.getId();
                name=e.getName();
                pw=e.getPassword();
                em=e.getEmail();
                %>
            <tr><td><%=id%></td><td><%=name%></td><td><%=pw%></td><td><%=em%></td></tr>
            <%}
            session1.close();%>
        </table>
    </body>
</html>
