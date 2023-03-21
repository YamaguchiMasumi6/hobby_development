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

            <%-- フォームからのデータを取得 --%>
            <% String username = request.getParameter("username"); %>
            <% String password = request.getParameter("password"); %>

            <%-- データベースに接続し、データを格納 --%>
            <% 
            try {
                // JDBCドライバを読み込み
                ("org.postgresql.Driver").newInstance();
                // データベースに接続
                String url = "jdbc:postgresql://localhost5431/inagakitokuhito"; // データベースのURL
    			String user = "inagakitokuhito"; 
    			String pass = "tokuto4052"; 
                Connection conn = DriverManager.getConnection(url, user, pass);
				
                // 現在の最大のidを取得
                String sqlMaxId = "SELECT MAX(id) AS max_id FROM users";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sqlMaxId);
                int id = 1;
                if(rs.next()){
                    id = rs.getInt("max_id") + 1;
                }

                // SQL文を準備
                String sql = "INSERT INTO customer (id, username, password) VALUES (?, ? ,?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, id);
                pstmt.setString(2, username);
                pstmt.setString(3, password);

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

            } catch (SQLException e) {
                out.println("<p>ユーザー登録に失敗しました。</p>");
            }

            %>

            <p><a href="../login/login.jsp" class="link">ログインページへ戻る</a></p>

        </div><!-- /wrapper -->

    </div><!-- home -->

</body>
</html>
