<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificare Joc</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aldrich">
    	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Anonymous+Pro:400,400i,700,700i">
    	<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    	<link rel="stylesheet" href="assets/css/Footer-Dark.css">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    	<link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    	<link rel="stylesheet" href="assets/css/Simple-Slider.css">
    	<link rel="stylesheet" href="assets/css/styles.css">
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-image: url(&quot;assets/img/bckg1.jpg&quot;);background-color: rgba(255,255,255,0);">
    <nav class="navbar navbar-light navbar-expand-md text-uppercase navigation-clean" style="background-color: rgba(88,88,88,0.54);font-family: Aldrich, sans-serif;color: #9a4edc;font-size: 19px;">
        <div class="container-fluid"><a class="navbar-brand" href="index.html"><img class="img-fluid" src="assets/img/gamezone.png" width="430" height="95" style="width: 480px;"></a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" style="color: rgb(154,78,220);" href="jocuri.jsp">Games</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="jucatori.jsp" style="color: #9a4edc;">Gamers</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="profil.jsp" style="color: #9a4edc;">Profiles</a></li>
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="color: #9a4edc;">Register</a>
                        <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation" href="adauga_Jucator.jsp">Yourself</a><a class="dropdown-item" role="presentation" href="adauga_Joc.jsp">Game</a><a class="dropdown-item" role="presentation" href="adauga_Profil.jsp">Profile</a></div>
                    </li>
                </ul>
        </div>
        </div>
    </nav>
        <%	
            String check = request.getParameter("primarykey");
            if(check == null){
		%>
           <h1 align="center" class="display-4 text-break text-uppercase text-left d-xl-flex justify-content-start align-items-start align-content-start" 
           style="font-family: 'Anonymous Pro', monospace;color: rgb(143,52,232);margin: 20px 30px 0px;font-style: normal;font-weight: bold;"align="center"> Trebuie sa bifezi cel putin o linie!</h1>
        <% }else{
        	Long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
            jb.connect();
            ResultSet rs = jb.intoarceLinieDupaId("jocuri", "idjoc", aux);
            rs.first();
            String nume = rs.getString("nume");
            Long nr_jucatori = rs.getLong("nr_jucatori");
            String tip = rs.getString("tip");
            String data_lansarii = rs.getString("data_lansarii");
            String developer = rs.getString("developer");
            String urmatorul_campionat = rs.getString("urmatorul_campionat");
            Long numar_campionate =rs.getLong("numar_campionate");
            String campion_actual = rs.getString("campion_actual");
            rs.close();
            jb.disconnect();
        %>
        <h1 style="margin-left: 20px;margin-top: 10px;margin-bottom: 0px;color: rgb(148,74,208);font-family: 'Anonymous Pro', monospace;">Modifica datele jocului:</h1>
        <br/>
        <form action="m2_Joc.jsp" method="post">
        <div class="table-responsive" style="color: rgb(255,255,255);margin-top: 30px;margin-bottom: 30px;font-family: 'Anonymous Pro', monospace;">
            <table align="center" class="table">
                <tbody style="color: rgb(255,255,255);"> 
                <tr>
                    <td align="right">ID Joc:</td>
                    <td><input type="text" name="idjoc" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume Joc:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Numar jucatori:</td>
                    <td> <input type="text" name="nr_jucatori" size="30" value="<%= nr_jucatori%>"/></td>
                </tr>
                <tr>
                    <td align="right">Tip:</td>
                    <td> <input type="text" name="tip" size="30" value="<%= tip%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data Lansarii: (FORMAT YYYY-MM-DD)</td>
                    <td> <input type="text" name="data_lansarii" size="30" value="<%= data_lansarii%>"/></td>
                </tr>
                <tr>
                    <td align="right">Developer:</td>
                    <td> <input type="text" name="developer" size="30" value="<%= developer%>"/></td>
                </tr>
                <tr>
                    <td align="right">Urmatorul Campionat: (FORMAT YYYY-MM-DD)</td>
                    <td> <input type="text" name="urmatorul_campionat" size="30" value="<%= urmatorul_campionat%>"/></td>
                </tr>
                <tr>
                    <td align="right">Numar Campionate:</td>
                    <td> <input type="text" name="numar_campionate" size="30" value="<%= numar_campionate%>"/></td>
                </tr>
                <tr>
                    <td align="right">Campion Actual:</td>
                    <td> <SELECT NAME="campion_actual" id="campion_actual" class="btn btn-primary dropdown-toggle d-xl-flex justify-content-xl-center align-items-xl-center" data-toggle="dropdown" aria-expanded="false" style="background-color: rgb(178,112,224);font-family: Aldrich, sans-serif;">
                            <OPTION VALUE="None">None</OPTION>
                            <%
                            	jb.connect();
                        		ResultSet rs1 = jb.vedeTabela("jucatori");
                                while (rs1.next()) {
                                    Long idjucator = rs1.getLong("idjucator");
                                    String Nume = rs1.getString("nume");
                                    String Prenume = rs1.getString("prenume");
                            %>
                            <OPTION VALUE="<%= Nume%> <%= Prenume%>"><%= idjucator%>, <%= Nume%>, <%= Prenume%></OPTION>
                             <%
                                }
                             %>  
                        </SELECT></td>
                </tr>
                </tbody>
            </table>
            </div>
            <p align="center">
                <input class="btn btn-primary border-dark shadow-sm" type="submit" style="background-color: rgb(178,112,224);opacity: 1;font-family: Aldrich, sans-serif;color: rgb(255,255,255);margin-top: 5px;"id="modificaJoc" name="modificaJoc" value="Modifica linia">
            </p>
        </form>
        <%}%>
        <div class="footer-dark"
        style="margin-top: 30px;">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 item">
                        <h3>View</h3>
                        <ul>
                            <li><a href="jucatori.jsp">Gamers</a></li>
                            <li><a href="jocuri.jsp">Games</a></li>
                            <li><a href="profil.jsp">Profiles</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3>Register</h3>
                        <ul>
                            <li><a href="adauga_Jucator.jsp">Yourself</a></li>
                            <li><a href="adauga_Joc.jsp">Your Game</a></li>
                            <li><a href="adauga_Profil.jsp">Your Profile</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 item text">
                        <h3>Purpose of the site</h3>
                        <p>This site is the largest and most important database among the true gamers. It contains all important eSports games and many other with the posibility of adding your own game. Players can register themselves&nbsp; and their profile
                            they have on their games, with the posibility of updating them.</p>
                    </div>
                    <div class="col item social"><a href="https://www.facebook.com/alex.titu.19"><i class="icon ion-social-facebook"></i></a><a href="https://twitter.com/alex_titu_19"><i class="icon ion-social-twitter"></i></a><a href="https://www.instagram.com/alex.titu.19/"><i class="icon ion-social-instagram"></i></a></div>
                </div>
                <p class="copyright">GameZone © 2021</p>
            </div>
        </footer>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="assets/js/Simple-Slider.js"></script>     
    </body>
</html>