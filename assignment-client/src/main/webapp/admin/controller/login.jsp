<%-- 
    Document   : login
    Created on : 26 Aug 2022, 17:25:28
    Author     : thilanmaduranga
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="assignment.User"%>
<%@include file="../../includes/wsdlConnection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    String mobile = request.getParameter("user_mobile");
    String password = request.getParameter("user_password");
    HttpSession ses = request.getSession();

    if (proxy.authUser(mobile, password)) {
        User user = proxy.getUserByMobile(mobile);
        Cookie userMobileCookie = new Cookie("USERMOBILE", mobile);
        response.addCookie(userMobileCookie);
        
        Date expdate= new Date();
        expdate.setTime (expdate.getTime() + (3600 * 1));
        DateFormat df = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz", java.util.Locale.US);
        df.setTimeZone(TimeZone.getTimeZone("Asia/Colombo"));
        String cookieExpire = "expires=" + df.format(expdate);
        
        out.print(cookieExpire);

        if (user.getType() == 3) {
            Cookie isAdmin = new Cookie("ISADMIN", "true");
            Cookie isSuper = new Cookie("ISSUPER", "true");
            isAdmin.setPath("/");
            isSuper.setPath("/");
            isAdmin.setMaxAge(60*60*24);//set for 1 day
            isSuper.setMaxAge(60*60*24);//set for 1 day
            
//            isAdmin.setMaxAge(0);
//            isSuper.setMaxAge(0);
            
            response.addCookie(isAdmin);
            response.addCookie(isSuper);
            
            response.sendRedirect("/assignment-client/admin/index.jsp");
        } else {

            out.print("under developing");
        }

    } else {
        ses.setAttribute("error", "Login failed. Please try again");
        response.sendRedirect("/assignment-client/index-admin-login.jsp");
    }


%>