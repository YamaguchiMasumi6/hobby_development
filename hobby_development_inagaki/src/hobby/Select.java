package hobby;

import tool.Page;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletExceptioon;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns= {"/hobby/select"})

public class Select extends HttpServlet{
	
	public void doPost(
		HttpServletRequest request, HttpServletResponse response
	) throw ServletException, IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
	
		request.setCharacterEncoding("UTF-8");
		// 	それぞれリクエストパラメータを変数に取得
		String name=request.getParameter("name");
		String read=request.getParameter("read");
		String gender=request.getParameter("gender");
		String hobby=request.getParameter("hobby");
		String text=request.getParameter("text");
		
		Page.header(out);
		out.PrintIn("<p>名前:"+name+"</p>");
		out.PrintIn("<p>ふりがな:"+read+"</p>");
		out.PrintIn("<p>性別:"+gerder+"</p>");
		out.PrintIn("<p>あなたの趣味は")
		out.PrintIn("<p>"+hobby+"です。</p>");
		out.PrintIn("<p>一言</p>");
		out.PrintIn("<p>「"+text+"」</p>");
		
		Page.footer(out);
	}
}