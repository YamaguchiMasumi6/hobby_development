package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDAO;
import bean.Customer;
import tool.Action;

public class LoginAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String login = request.getParameter("username");
        String password = request.getParameter("password");

        CustomerDAO dao = new CustomerDAO();
        Customer customer = dao.search(login, password);

        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer.getLogin());
            return "login_out.jsp";
        } else {
            request.setAttribute("error", "ログイン名またはパスワードが違います。");
            return "login_error.jsp";
        }
    }
}
