package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.dto.TradeHistoryDTO;
import model.service.ItemMarketService;

public class Write implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디,
		//String id = request.getParameter("id");
		String id="aaa";
		int bordernumber=30;
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String price = request.getParameter("price").trim();
		String category = request.getParameter("category");
		String subcategory = request.getParameter("subcategory");
		String itemState = "구매대기중";
		
		//BorderDTO borderDTO = new BorderDTO(id, bordernumber, content, title, Integer.parseInt(price), "", category, subcategory, itemState);
		
		//ItemMarketService.imgWrite(borderDTO.getBorderNumber(), imgName);
		PrintWriter out = response.getWriter();
		/*if(ItemMarketService.write(borderDTO)>0){
			response.sendRedirect("view/noticeboard.jsp");
		}else{
			out.println("<script>");
			out.println("alert('글이 삽입되지 않았습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}*/
		
	}

}
