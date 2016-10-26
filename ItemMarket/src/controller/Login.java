package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.UserDTO;
import model.service.ItemMarketService;




public class Login implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		//response.setContentType("");
		GetProfile getProfile = new GetProfile();
		String id  = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		int result= 0 ;
		ItemMarketService marketService = new ItemMarketService();
		
		result  = marketService.login(id, pwd);
		if(result==1){
			getProfile.execute(request, response);
		}
		
}


}
