<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%　　
    String username = request.getParameter("username"); // フォームから入力されたユーザー名を取得
    String password = request.getParameter("password"); // フォームから入力されたパスワードを取得

    // データベースへの接続情報
    String url = "jdbc:mysql://localhost8003/phpMyAdmin5"; // データベースのURL
    String user = "root"; 
    String pass = "root"; 
　
    // データベースに接続して、ログイン情報を照合する
    try {
        Class.forName("/com.mysql.cj.jdbc.Driver"); // JDBCドライバをロードする
        Connection conn = DriverManager.getConnection(url, user, pass); // データベースに接続する
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM costomer WHERE username = ? AND password = ?"); // SQLクエリを用意する
        stmt.setString(1, username); // パラメーターを設定する
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery(); // SQLクエリを実行し、結果セットを取得する

        // ログインが成功した場合は、セッションにユーザー情報を設定して、index.jspにリダイレクトする
        if (rs.next()) {%>
            session.setAttribute("username", username); // セッションにユーザー名を設定する
            response.sendRedirect("index.jsp"); // index.jspにリダイレクトする
        <% } else { %>
            request.setAttribute("error", "ログインに失敗しました。"); // エラーメッセージをリクエストに設定する
            request.getRequestDispatcher("login.jsp").forward(request, response); // login.jspにフォワードする
        <% }

        rs.close(); // 結果セットをクローズする
        stmt.close(); // SQLステートメントをクローズする
        conn.close(); // データベースへの接続をクローズする
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
