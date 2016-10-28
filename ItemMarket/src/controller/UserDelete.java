package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.ItemMarketService;

public class UserDelete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String url = "view/index.jsp";
		int result = ItemMarketService.userDelete(id, pw);
		ServletContext application =request.getServletContext();
		PrintWriter out = response.getWriter();
			if(result <= 0){
				out.println("<script>alert('비밀번호가 맞지 않습니다 다시 입력해 주십시오');</script>");
				url = "view/ModifyInformation.jsp";
				}else{
				out.println("<script>alert('삭제가 완료되었습니다 그동안 사용해 주셔서 감사합니다.')</script>");	
				}
			response.sendRedirect(application.getRealPath("/")+url);
	
	}

}
