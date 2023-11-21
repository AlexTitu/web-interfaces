
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Alege Profil</title>
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
   <body style="background-image: url(&quot;assets/img/bckg1.jpg&quot;);">
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
        <h1 class="text-break text-uppercase" style="margin-left: 20px;margin-top: 10px;margin-bottom: 0px;color: rgb(148,74,208);font-family: 'Anonymous Pro', monospace;">Alege profilul ce doresti sa modifici:</h1>
        <br/>
        <form action="m1_Profil.jsp" method="post">
    	<div class="d-flex flex-shrink-1 justify-content-center align-items-center align-content-center align-self-center justify-content-xl-center">
    	<p class="text-left d-xl-flex align-items-center align-content-center align-items-xl-center" style="font-family: 'Anonymous Pro', monospace;font-size: 30px;margin: 10px 10px 10px;color: rgb(254,255,255);font-style: normal;margin-left: 80px;margin-top: 5px;margin-right: 30px;margin-bottom: 0px;min-height: 60px;">Selecteaza o singur linie si apasa:</p>
    	<input id="modificaProfil" value="Modifica linia" name="modificaProfil" class="btn btn-primary border-dark shadow-sm" type="submit" style="background-color: rgb(178,112,224);opacity: 1;font-family: Aldrich, sans-serif;color: rgb(255,255,255);margin-top: 5px;">
    	</div>
            <div class="table-responsive" style="color: rgb(255,255,255);margin-top: 30px;margin-bottom: 30px;font-family: 'Anonymous Pro', monospace;">
        <table class="table">
            <thead style="color: rgb(255,255,255);">
                <tr>
                	<th>Mark:</th>
                    <th>ID Profil</th>
                    <th>ID Jucator</th>
                    <th>ID Joc</th>
                    <th>Nume Jucator</th>
                    <th>Prenume Jucator</th>
                    <th>Nationalitate</th>
                    <th>Nume Joc</th>
                    <th>Tip</th>
                    <th>Data Creare Cont</th>
                    <th>Username</th>
                    <th>Grad</th>
                    <th>Campionate Participate</th>
                    <th>Numar Medalii</th>
                    <th>Campion</th>
                </tr>
            </thead>
            <tbody style="color: rgb(255,255,255);">
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeProfil();
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idprofil");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getLong("idjucator_profil")%></td>
                    <td><%= rs.getLong("idjoc_profil")%></td>
                    <td><%= rs.getString("numeJucator")%></td>
                    <td><%= rs.getString("prenumeJucator")%></td>
                    <td><%= rs.getString("Nation")%></td>
                    <td><%= rs.getString("numeJoc")%></td>
                    <td><%= rs.getString("tip")%></td>
                    <td><%= rs.getDate("data_creare")%></td>
                    <td><%= rs.getString("username")%></td>
                    <td><%= rs.getString("grad")%></td>
                    <td><%= rs.getString("campionate_participate")%></td>
                    <td><%= rs.getString("nr_medalii")%></td>
                    <td><%= rs.getString("campion")%></td>
                    <%
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </div>
        </form>
        <%
    jb.disconnect();
    	%>
        <div class="footer-dark" style="margin-top: 30px;">
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