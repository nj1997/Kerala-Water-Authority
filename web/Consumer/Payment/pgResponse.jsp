
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%@page import="java.util.TreeMap"%>

<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%!
            public class PaytmConstants {

                public final static String MID = "IUJbZL98988991377704";
                public final static String MERCHANT_KEY = "f6p#2_lw#lR#UoS9";
                public final static String INDUSTRY_TYPE_ID = "Retail";
                public final static String CHANNEL_ID = "WEB";
                public final static String WEBSITE = "WEBSTAGING";
                public final static String PAYTM_URL = "https://securegw-stage.paytm.in/order/process";
            }
        %>
       

        <%
            
            
            Enumeration<String> paramNames = request.getParameterNames();

            Map<String, String[]> mapData = request.getParameterMap();
            TreeMap<String, String> parameters = new TreeMap<String, String>();
            String paytmChecksum = "";
            while (paramNames.hasMoreElements()) {
                String paramName = (String) paramNames.nextElement();
                if (paramName.equals("CHECKSUMHASH")) {
                    paytmChecksum = mapData.get(paramName)[0];
                } else {
                    parameters.put(paramName, mapData.get(paramName)[0]);
                }
            }
            boolean isValideChecksum = false;
            String outputHTML = "";
            try {
                isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY, parameters, paytmChecksum);
                if (isValideChecksum && parameters.containsKey("RESPCODE")) {
                    if (parameters.get("RESPCODE").equals("01")) {
                        outputHTML = parameters.toString();
                        Enumeration aa = request.getParameterNames();

                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection Conn;

                        Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                        PreparedStatement ps = (PreparedStatement) Conn.prepareStatement("insert into KWA.paymentlist (date,status) values(?,2)");

                        java.util.Date utilDate = new Date();
                        java.sql.Date date = new java.sql.Date(utilDate.getTime());

                        ps.setDate(1, date);

                        int rs = ps.executeUpdate();

                        if ((rs > 0)) {

                            //out.print("Success");
                            
                             response.sendRedirect("../../bill/bill.jsp");

                        }

                        while (aa.hasMoreElements()) {
                            Object a = aa.nextElement();

                                  // out.println(a);

        %>
        <h2>
            Your Payment Has been Done Successfully
            
            
            
            
            
        </h2>

        <%                                    }

                    } else {
                        outputHTML = "<b>Payment Failed.</b>";
                        Enumeration aa = request.getParameterNames();
                        while (aa.hasMoreElements()) {
                            Object a = aa.nextElement();

                            out.println(a);
                        }
                    }
                } else {
                    outputHTML = "<b>Checksum mismatched.</b>";
                }
            } catch (Exception e) {
                outputHTML = e.toString();
            }
        %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title></title>
        </head>
        <body>
            <%= outputHTML%>
            
            
            
            
              
 <%
		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
                              //  session.getAttribute("amount");
                                session.getAttribute("amount3");
                               String amount5 = (String) session.getAttribute("amount3");
				//out.print("Hello, " + name + "  Welcome to ur Profile");
                               
                               session.setAttribute("amount6",amount5 );
				//out.print("Hello, " + name + "  Welcome to ur Profile");
			} else {
				response.sendRedirect("../../home.html");
			}
		}
	%>
        </body>
    </html>