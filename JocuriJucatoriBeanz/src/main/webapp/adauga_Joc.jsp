<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Adauga Joc</title>
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
        String nume = request.getParameter("nume");
        if (nume == "") nume = null; 
        String nr_jucatori = request.getParameter("nr_jucatori");
        if (nr_jucatori == "") nume = null; 
        String tip = request.getParameter("tip");
        if (tip == "") tip = null; 
        String data_lansarii = request.getParameter("data_lansarii");
        if (data_lansarii == "") data_lansarii = null; 
        String developer = request.getParameter("developer");
        if (developer == "") developer = null; 
        String urmatorul_campionat =request.getParameter("urmatorul_campionat");
        if ( urmatorul_campionat == "")  urmatorul_campionat = null; 
        String numar_campionate = request.getParameter("numar_campionate");
        if (numar_campionate == "") numar_campionate = null; 
        String campion_actual = request.getParameter("campion_actual");
        if (campion_actual == "") campion_actual = null; 
            if (nume != null && nr_jucatori != null && numar_campionate != null) {
                	jb.connect();
                	jb.adaugaJoc(nume, java.lang.Long.parseLong(nr_jucatori), tip, data_lansarii, developer, urmatorul_campionat, java.lang.Long.parseLong(numar_campionate), campion_actual);
                	jb.disconnect();
        %>
        <p align="center" class="display-4 text-break text-uppercase text-left d-xl-flex justify-content-start align-items-start align-content-start" style="font-family: 'Anonymous Pro', monospace;color: rgb(143,52,232);margin: 20px 30px 0px;font-style: normal;font-weight: bold;"align="center">Datele au fost adaugate.</p>
        <%
        } else {
        	jb.connect();
            ResultSet rs = jb.vedeTabela("jucatori");
        %>
        <h1 align="center" class="display-4 text-break text-uppercase text-left d-xl-flex justify-content-start align-items-start align-content-start" style="font-family: 'Anonymous Pro', monospace;color: rgb(143,52,232);margin: 20px 30px 0px;font-style: normal;font-weight: bold;"align="center">Adauga Joc Nou:</h1>
        <h1 align="center" class="display-4 text-break text-uppercase text-left d-xl-flex justify-content-start align-items-start align-content-start" style="font-family: 'Anonymous Pro', monospace;color: rgb(143,52,232);margin: 20px 30px 0px;font-style: normal;font-weight: bold;"align="center">Toate datele cu * sunt obligatorii</h1>
        <form action="adauga_Joc.jsp" method="post">
        <div class="table-responsive" style="color: rgb(255,255,255);margin-top: 30px;margin-bottom: 30px;font-family: 'Anonymous Pro', monospace;">
            <table align="center" class="table">
                <tbody style="color: rgb(255,255,255);"> 
                <tr>
                    <td align="right">*Nume Joc:</td>
                    <td> <input type="text" name="nume" size="45" /></td>
                </tr>
                <tr>
                    <td align="right">*Numar Jucatori:</td>
                    <td> <input type="text" name="nr_jucatori" size="45" /></td>
                </tr>
                <tr>
                    <td align="right">Tipul Jocului:</td>
                    <td> <input type="text" name="tip" size="45" /></td>
                </tr>
                <tr>
                    <td align="right">*Data Lansarii (Format YYYY-MM-DD):</td>
                    <td> <input type="text" name="data_lansarii" size="45" /></td>
                </tr>
                <tr>
                    <td align="right">Developer:</td>
                    <td> <input type="text" name="developer" size="45" /></td>
                </tr>
                <tr>
                    <td align="right">Urmatorul Campionat (Format YYYY-MM-DD):</td>
                    <td> <input type="text" name="urmatorul_campionat" size="45" /></td>
                </tr>
                <tr>
                    <td align="right">*Numar Campionate:</td>
                    <td> <input type="text" name="numar_campionate" size="45" /></td>
                </tr>
                <tr>
                    <td align="right">Campion Actual:</td>
                    <td> <SELECT NAME="campion_actual" id="campion_actual" class="btn btn-primary dropdown-toggle d-xl-flex justify-content-xl-center align-items-xl-center" data-toggle="dropdown" aria-expanded="false" style="background-color: rgb(178,112,224);font-family: Aldrich, sans-serif;">
                            <OPTION VALUE="None">None</OPTION>
                            <%
                                while (rs.next()) {
                                    Long idjucator = rs.getLong("idjucator");
                                    String Nume = rs.getString("nume");
                                    String Prenume = rs.getString("prenume");
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
            <div class="d-flex flex-shrink-1 justify-content-center align-items-center align-content-center align-self-center justify-content-xl-center">
            <input value="Adauga joc" class="btn btn-primary border-dark shadow-sm" type="submit" style="background-color: rgb(178,112,224);opacity: 1;font-family: Aldrich, sans-serif;color: rgb(255,255,255);margin-top: 5px;"id="adauga_Joc" name="adauga_Joc"/>
       		</div>
        </form>
        <%
            }
        %>
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