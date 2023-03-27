<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%　　
// フォームからのデータを取得し、Mapに格納
Map<String, String> userData = new HashMap<>();
userData.put("username", request.getParameter("username"));
userData.put("password", request.getParameter("password"));

// データベースへの接続情報
String url = "jdbc:mysql://localhost5431/postgres"; // データベースのURL
String user = "root"; 
String pass = "tokuto4052"; 

// データベースに接続して、ログイン情報を照合する
try {
Class.forName("/com.mysql.cj.jdbc.Driver"); // JDBCドライバをロードする
Connection conn = DriverManager.getConnection(url, user, pass); // データベースに接続する
// SQLクエリを準備し、パラメータを設定する
String sql = "SELECT * FROM players WHERE username = ? AND password = ?";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, userData.get("username"));
stmt.setString(2, userData.get("password"));
ResultSet rs = stmt.executeQuery(); // SQLクエリを実行し、結果セットを取得する

// ログインが成功した場合は、セッションにユーザー情報を設定して、index.jspにリダイレクトする
if (rs.next()) {%>
    session.setAttribute("username", userData.get("username"));  <!-- セッションにユーザー名を設定する -->
    response.sendRedirect("index.jsp"); <!-- index.jspにリダイレクトする --> 
<% } else { %>
    request.setAttribute("error", "ユーザー名またはパスワードが正しくありません。");  <!-- エラーメッセージをリクエストに設定する -->
    request.getRequestDispatcher("login.jsp").forward(request, response);  <!-- login.jspにフォワードする -->
<% }

rs.close(); // 結果セットをクローズする
stmt.close(); // SQLステートメントをクローズする
conn.close(); // データベースへの接続をクローズする
} catch (ClassNotFoundException | SQLException e) {
out.println("<p>エラーが発生しました。</p>");
out.println("<p>" + e.getMessage() + "</p>");
e.printStackTrace();
}

%>	