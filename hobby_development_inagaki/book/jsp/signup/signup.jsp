<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規ユーザー登録</title>
<link rel="stylesheet" href="../../css/ress.css">
<link rel="stylesheet" href="../../css/login.css">
</head>
<body>

    <div id="home" class="mv-top">

        <div class="wrapper">

            <h1>新規ユーザー登録</h1>
            <form method="post" action="signup_check.jsp">
                <label for="username">ユーザー名：</label>
                <input type="text" id="username" name="username"><br>

                <label for="password">パスワード：</label>
                <input type="password" id="password" name="password"><br>

                <input type="submit" id="submit" value="登録">
            </form>

            <p>すでにアカウントをお持ちの方は<a href="login.jsp" class="link">こちら</a>からログインしてください。</p>

            <%-- エラー表記 --%>
            <% if(request.getAttribute("error") != null) { %>
                <p><%= request.getAttribute("error") %></p>
            <% } %>

        </div><!-- /wrapper -->

    </div><!-- home -->

</body>
</html>
