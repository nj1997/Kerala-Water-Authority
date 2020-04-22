

<%@page import="com.paytm.pg.merchant.CheckSumServiceHelper"%>
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
   <body   style=" background-size: cover; position: relative; ">
     
        <%!
    public class PaytmConstants {
  
  public final static String MID="IUJbZL98988991377704";
  public final static String MERCHANT_KEY="f6p#2_lw#lR#UoS9";
  public final static String INDUSTRY_TYPE_ID="Retail";
  public final static String CHANNEL_ID="WEB";
  public final static String WEBSITE="WEBSTAGING";
   public final static String PAYTM_URL="https://securegw-stage.paytm.in/order/process";
   
 } %>
     
     
<%
Enumeration<String> paramNames = request.getParameterNames();
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
 String paramName = (String)paramNames.nextElement();
 parameters.put(paramName,mapData.get(paramName)[0]); 
}

parameters.put("MID",PaytmConstants.MID);
parameters.put("CHANNEL_ID",PaytmConstants.CHANNEL_ID);
parameters.put("INDUSTRY_TYPE_ID",PaytmConstants.INDUSTRY_TYPE_ID);
parameters.put("WEBSITE",PaytmConstants.WEBSITE);
parameters.put("MOBILE_NO","9744017816");
parameters.put("EMAIL","nibujose1997@gmail.com");
parameters.put("CALLBACK_URL", "http://localhost:8080/Kerala%20Water%20Authority/Consumer/Payment/pgResponse.jsp");  //if payment is canceled then return this page


String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(PaytmConstants.MERCHANT_KEY, parameters);  //interface which is generate transection id


StringBuilder outputHtml = new StringBuilder();
outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
outputHtml.append("<html>");
outputHtml.append("<head>");
outputHtml.append("<title>Merchant Check Out Page</title>"); 
outputHtml.append("</head>");
outputHtml.append("<body>");
outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
outputHtml.append("<form method='post' action='"+ PaytmConstants.PAYTM_URL +"' name='f1'>");
outputHtml.append("<table border='1'>");
outputHtml.append("<tbody>");

for(Map.Entry<String,String> entry : parameters.entrySet()) {
 String key = entry.getKey();
 String value = entry.getValue();
 outputHtml.append("<input type='hidden' name='"+key+"' value='" +value+"'>"); 
} 
 


outputHtml.append("<input type='hidden' name='CHECKSUMHASH' value='"+checkSum+"'>");
outputHtml.append("</tbody>");
outputHtml.append("</table>");
outputHtml.append("<script type='text/javascript'>");
outputHtml.append("document.f1.submit();");
outputHtml.append("</script>");
outputHtml.append("</form>");
outputHtml.append("</body>");
outputHtml.append("</html>");
out.println(outputHtml);
%>
</body>
  
 <%
		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
                                  String amount = request.getParameter("TXN_AMOUNT");
                              // session.getAttribute("amount");
                                session.getAttribute("amount1");
                               String amount2 = (String) session.getAttribute("amount");
				//out.print("Hello, " + name + "  Welcome to ur Profile");
                               
                               session.setAttribute("amount3",amount2 );
			} else {
				response.sendRedirect("../../home.html");
			}
		}
	%>


</html>
