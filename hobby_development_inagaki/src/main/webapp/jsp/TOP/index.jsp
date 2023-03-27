<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>今から始める趣味</title>
<link rel="stylesheet" href="../css/ress.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<header class="header" id="header">
    <ul class="g-nav" id="g-navi">
        <li><a href="#" class="active navi-home">Home</a></li>
        <li><a href="outdoor.jsp" class="navi-outdoor">Outdoors</a></li>
        <li><a href="indoor.jsp" class="navi-indoor">Indoors</a></li>
        <li><a href="../contact/contact.jsp" class="nav-content">Contact</a></li>
        <li><a href="" class="navi-db">DateBase</a></li>
    </ul>
</header>
    
<div class="openbtn1"><span></span><span></span><span></span></div>
    
<main>   
<div id="home" class="mv-top">

<div class="wrapper">
<p class="sub-tytle">今からでも始められる</p>
<img src="../images/sub-tytle.png" alt="ふきだし" class="sub-tytle-deco d-flex">
<h1 class="page-title">大人の趣味</h1>
<div>
    <h2 class="sub-tytle-under">あなたはアウトドア派？<br class="sp">インドア派？</p>
</div>

<div class="d-flex">
<div class="flex-box">
    <p class="button-subtitle">\休みの日はアクティブに動きたい！/</p>
    <a class="button-outdoor button" href="outdoor.jsp">アウトドア派</a>
</div>
<div class="flex-box">
    <p class="button-subtitle">\休みの日はお家時間を充実させたい！/</p>
    <a class="button-indoor button" href="indoor.jsp">インドア派</a>
</div>
</div><!-- /d-flex -->
</div ><!-- /wrapper -->

</div><!-- home -->
</main>
<footer class="footer wrapper">
    <p>&copy;Inagaki/TeamDevelopment</p>
</footer>
</body>
</html>