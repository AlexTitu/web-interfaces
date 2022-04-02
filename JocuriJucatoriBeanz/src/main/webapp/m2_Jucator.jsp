
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
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <title>Modifica Jucator</title>
       
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
        <h1 align="center" class="display-4 text-break text-uppercase text-left d-xl-flex justify-content-start align-items-start align-content-start" style="font-family: 'Anonymous Pro', monospace;color: rgb(143,52,232);margin: 20px 30px 0px;font-style: normal;font-weight: bold;"align="center"> Modificare jucator:</h1>
        <br/>
        <%
            jb.connect();
            Long aux = java.lang.Long.parseLong(request.getParameter("idjucator"));
            String nume = request.getParameter("nume");
            if(nume == "") nume ="N/A";
            String prenume = request.getParameter("prenume");
            if(prenume == "") prenume ="N/A";
            String email = request.getParameter("email");
            if(email == "") email ="N/A";
            String data_nasterii = request.getParameter("data_nasterii");
            if(data_nasterii == "") data_nasterii ="0000-0-0";
            String gen = request.getParameter("gen");
            String nationalitate = request.getParameter("nationalitate");
            String[] valori = {nume, prenume, email, data_nasterii, gen, nationalitate};
            String[] campuri = {"nume", "prenume", "email", "data_nasterii", "gen", "nationalitate"};
            jb.modificaTabela("jucatori", "idjucator", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="left" class="display-4 text-break text-uppercase text-left d-xl-flex justify-content-start align-items-start align-content-start" style="font-family: 'Anonymous Pro', monospace;color: rgb(143,52,232);margin: 20px 30px 0px;font-style: normal;font-weight: bold;">Modificarile au fost efectuate!</h1>
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