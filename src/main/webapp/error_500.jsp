
<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CI Demo Game Store</title>
        <!-- Default Stylesheets -->
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/myScript.js"></script>

    </head>
    <body>

        <%
            if (session.getAttribute("src/main/java/user") == null) {// THen new user, show join now
        %>
        <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        %>


        <div class="container_16">
            <div class="grid_14 push_1" id="whiteBox" style="padding: 10px;">
                <br/><h1 style="padding: 10px;">Error Status <span class="blue">500</span> - Internal Server Error!!
                </h1><hr/><br/>
                <p  class="grid_4" style="text-align: right; font-size: 72px;">500</p>
                <p class="grid_7">
                    There were issues loading the page you requested. Possibly the following will help:<br/><br/>
                    <%= exception.getMessage() %>
                    <br/><br/>
                    Please check your web logs for additional error details. 
                    <br/> Thank you!
                </p>
            </div>
        </div>    
    </body>
</html>
