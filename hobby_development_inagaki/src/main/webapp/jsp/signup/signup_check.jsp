<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規ユーザー登録確認</title>
<link rel="stylesheet" href="../../css/ress.css">
<link rel="stylesheet" href="../../css/login.css">
</head>
<body>

<div id="home" class="mv-top">

    <div class="wrapper">

        <h1>新規ユーザー登録確認</h1>

        <%-- フォームからのデータを取得し、Mapに格納 --%>
        <% 
        Map<String, String> userData = new HashMap<>();
        userData.put("username", request.getParameter("username"));
        userData.put("password", request.getParameter("password"));
        %>

        <%-- データベースに接続し、データを格納 --%>
        <% 
        try {
            // JDBCドライバを読み込み
            Class.forName("org.postgresql.Driver");
            
            // データベースに接続
            String url = "jdbc:postgresql://localhost5431/inagakitokuhito"; // データベースのURL
            String user = "inagakitokuhito"; 
            String pass = "tokuto4052"; 
            Connection conn = DriverManager.getConnection(url, user, pass);
			
         // 既に同じデータがあるかをチェックする
            String sqlCheck = "SELECT COUNT(*) AS count FROM players WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(sqlCheck);
            checkStmt.setString(1, userData.get("username"));
            ResultSet checkRs = checkStmt.executeQuery();
            checkRs.next();
            int count = checkRs.getInt("count");
            checkRs.close();
            checkStmt.close();
            if(count > 0){
                out.println("<p>そのユーザー名は既に使われています。</p>");
            } else {
                // 現在の最大のidを取得
                String sqlMaxId = "SELECT MAX(id) AS max_id FROM users";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sqlMaxId);
                int id = 1;
                if(rs.next()){
                    id = rs.getInt("max_id") + 1;
                }

            // SQL文を準備
            String sql = "INSERT INTO players (id, username, password) VALUES (?, ? ,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, userData.get("username"));
            pstmt.setString(3, userData.get("password"));

            // 実行結果を判定
            int result = pstmt.executeUpdate();
            if(result > 0){
                out.println("<p>ユーザー登録が完了しました。</p>");
            }

            // データベースを切断
            rs.close();
            stmt.close();
            pstmt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            out.println("<p>ユーザー登録に失敗しました。</p>");
        }

        %>

        <p><a href="../login/login.jsp" class="link">ログインページへ戻る</a></p>

    </div><!-- /wrapper -->

</div><!-- home -->


</body>
</html>
