package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**---------------------------------------------------------------------------------
  Servlet implementation class ListViewServlet
  TODO #500 一覧画面　prayersテーブルから全データを取得する
 ---------------------------------------------------------------------------------- */
@WebServlet("/ListViewServlet")
public class ListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/** --------------------------------------------------------------------------------
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * GETリクエストを受け付けて、DBからデータを取得する
	 ----------------------------------------------------------------------------------- */
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// データベースに接続するための情報
	    String url = "jdbc:postgresql://localhost:5432/worldcup";
	    String user = "yamaguchimasumi";
	    String password = "gkf798092";
	    
	    // データベースに接続する
	    try {
	    	Class.forName("org.postgresql.Driver");
	    	
	    	try (Connection con = DriverManager.getConnection(url, user, password);
	                Statement st = con.createStatement();){
	    		
	    		// SQLを実行して、テーブルからデータを取得する
	    		ResultSet res = st.executeQuery("SELECT id,position,name FROM players");
	    		
	    		// 取得した件数分繰り返す
	    		while(res.next()) {
	    			int id = res.getInt("id");
	    			String position = res.getString("position");
	    			String name = res.getString("name"); 
	    		} // while
	    	} catch(SQLException e) {
	            e.printStackTrace();
	        }
	    } catch(ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    
	 // リクエストスコープへオブジェクト設定する
	    ListViewServlet lst = new ListViewServlet(); 
	    request.setAttribute("", lst);
	    
	 // 次の画面に遷移
	    request.getRequestDispatcher("src/main/webapp/ListView.jsp").forward(request, response);
	    
	 } // protected void doGet

} // public class ListViewServlet extends HttpServlet
