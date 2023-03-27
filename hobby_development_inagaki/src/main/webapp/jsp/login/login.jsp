<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="../../css/ress.css">
<link rel="stylesheet" href="../../css/login.css">
</head>
<body>

    <div id="home" class="mv-top">

        <div class="wrapper">

            <h1>ログイン</h1>
            <form method="post" action="signup_check.jsp">
                <label for="username">メールアドレス：</label>
                <input type="text" id="login" name="username"><br>

                <label for="password">パスワード：</label>
                <input type="password" id="password" name="password"><br>

                <input type="submit" id="submit" value="ログイン">
            </form>

            <p>新規ユーザーの方は<a href="../signup/signup.jsp">こちら</a>から登録してください。</p>

            <%-- エラー表記 --%>
            <% if(request.getAttribute("error") != null) { %>
                <p><%= request.getAttribute("error") %></p>
            <% } %>

        </div><!-- /wrapper -->

    </div><!-- home -->

</body>
</html>
