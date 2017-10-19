<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DBCSConnection"%>
<%@ page import="database.DBCSConnectionManager" %>
<!DOCTYPE HTML>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>CI Demo GameShop</title>
        <!-- Default Stylesheets -->
        <%@include file="includesPage/_stylesheets.jsp" %>

        <link rel="stylesheet" href="css/slider.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/slider.js"></script>
        <script type="text/javascript" >
            // This is the script for the banner slider
            $(document).ready(function () {
                $('#slider').s3Slider({
                    timeOut: 7000
                });
            });
        </script>
        <script type="text/javascript" src="js/myScript.js"></script>
    </head>
    <body>

        <%
            Integer hitsCount = (Integer) application.getAttribute("hitCounter");
            if (hitsCount == null || hitsCount == 0) {
                /* First visit */
                hitsCount = 1;
                System.out.println("Visit number " + hitsCount + " from " + request.getRemoteAddr());
            } else {
                /* Return visit */
                hitsCount++;
                System.out.println("Visit number " + hitsCount + " from " + request.getRemoteAddr());
            }
            application.setAttribute("hitCounter", hitsCount);
        %>

        <%  if (session.getAttribute("src/main/java/user") == null) {// New user, show join now
                System.out.println("[DEBUG INFO] User NOT logged in");
        %>
        <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%
        } else {
            System.out.println("[DEBUG INFO] User logged in");
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%
            }
        %>

        <%
            // Log Headers received to see if health check sends something unique...
            System.out.println("\n** Logging headers:");
            Enumeration enumeration = request.getHeaderNames();
            while (enumeration.hasMoreElements()) {
                String name = (String) enumeration.nextElement();
                String value = request.getHeader(name);
                System.out.println(name + " = " + value);
            }
            System.out.println("** Header logging complete\n");
            
            System.out.println("request.getMethod() = " + request.getMethod());
// It appears the OTD health check is a GET request...
//            if (request.getMethod().equals("HEAD")) {
//                // OTD does a regular health check on the app by doing a HEAD request on the root URL. 
//                // We want to ignore these requests.
//                System.out.println("Ignoring OTD health check HEAD request.");
           
            // Skip requests from OTD health check (no user-agent header)...
            String userAgent = request.getHeader("user-agent");            
            if (userAgent == null) {
                System.out.println("Ignoring OTD health check request");
            } else {

        %>
        <div id = "banner">
            <div class="container_16">
                <div class="grid_16" style="padding-left: 20px; " id="slider">	
                    <ul id="sliderContent">		
                        <!-- Duplicate this code for each image -->				
                        <li class="sliderImage" style="display: none; ">
                            <img src="images/banner/paladins.png" width="900" height="300" /> 
                            <span class="top" style="display: none; ">
                                <strong>Paladins: Champions of the Realms</strong>	
                                <br>Paladins is a First Person Shooter game developed by Hi-Rez Studios, creators of the MOBA SMITE. The game is rooted in a colorful sci-fi fantasy setting featuring Champions, playable characters that have their own unique fire-function and abilities. 
                            </span>
                        </li>  
                        <li class="sliderImage" style="display: none; ">
                            <img src="images/banner/halo5.png" width="900" height="300" /> 
                            <span class="top" style="display: none; ">
                                <strong>Halo 5: Guardians</strong>				
                                <br>Halo 5: Guardians is a first-person shooter game developed by 343 Industries and published by Microsoft Studios in October 2015. It is the latest installment of the popular Halo series, and its story continues from the events of Halo 4.
                            </span>
                        </li>  
                        <li class="sliderImage" style="display: none; ">
                            <img src="images/banner/ride.png" width="900" height="300" /> 
                            <span class="top" style="display: none; ">
                                <strong>Ride</strong>				
                                <br>You’re likely looking at this and groaning at yet another game that takes delight in the sordid filth of motorsport. Of course, if you’re reading this then that’s probably what gets you revved up
                            </span>
                        </li>  
                        <li class="sliderImage" style="display: none; ">
                            <img src="images/banner/motoGP15.png" width="900" height="300" /> 
                            <span class="top" style="display: none; ">
                                <strong>MOTOGP 15</strong>				
                                <br>MotoGP 15 is the third instalment in the motorcycle racing series "dedicated to the most adrenalin-charged championship in the world". It's coming to Xbox 360, Xbox One, PS3 and PS4 from June 24th. Sébastien Loeb Rally Evo, meanwhile, is "an all-new off-road racing game experience" in which you can "drive the best rally cars in the best rallies and off-road events around the world." It's out on Xbox One and PS4 later this year.
                            </span>
                        </li>   
                        <li class="sliderImage" style="display: none; ">
                            <img src="images/banner/GofW4.png" width="900" height="300" /> 
                            <span class="top" style="display: none; ">
                                <strong>GEARS OF WAR 4</strong>				
                                <br>Prepare for the biggest ever update in the history of Gears of War 4  with the Rise of the Horde available now!  

                            </span>
                        </li>   
                    </ul>
                </div>
            </div>
        </div>

        <div class="container_16">
            <div id = "contents">
                <!-- LeftSide -->                
                <%
                    Connection c = DBCSConnectionManager.getConnection().getConnection();
                    Statement st = c.createStatement();
                    String getCategory = "SELECT * FROM category";

                    ResultSet rs = st.executeQuery(getCategory);
                %>
                <div id="leftside" class="grid_3">
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Categories</strong></a></li>

                            <%
                                while (rs.next()) {
                                    String category = rs.getString("category_name");
                            %>
                            <li><a href="viewProducts_.jsp?cat=<%= category%>"><%= category%></a></li>
                                <%
                                    }
                                %>

                        </ul>
                    </div>
                    <div class="adv">
                        <h2><br/>Advertise your product here</h2>
                        <p>Sponsor ads will appear in this section</p>
                        Total number of visits: <%= hitsCount%>
                    </div>
                </div>
            </div>

            <!-- Middle -->
            <div id="middle"class="grid_13">
                <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include> 
                </div>
                <!--The Middle Content Div Closing -->
            </div>
            <!--The Center Content Div Closing -->

        <jsp:include page="includesPage/_footer.jsp"></jsp:include>
        <%} // End else (not internal ACCS IP)%> 

    </body>
</html>



