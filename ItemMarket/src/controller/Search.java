package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.dto.ImageDTO;
import model.service.ItemMarketService;
import net.sf.json.JSONArray;

public class Search implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				response.setContentType("text/html;charset=utf-8");
				
				String word = request.getParameter("word");
				System.out.println(word);
				String category = request.getParameter("category");
				String subCategory = request.getParameter("subCategory");
				String page = request.getParameter("page");
				String bordernumber= request.getParameter("bordernumber");
				
				//System.out.println("��ȣ : "+bordernumber);
				int pageNum = Integer.parseInt(page);
				if(pageNum == 0) {
					pageNum = 1;
				}
				
				List<BorderDTO> list = ItemMarketService.search(word, category, subCategory, pageNum);
				
				for(int index=0;index<list.size();index++){
					List<String> imgList = ItemMarketService.imgRead(list.get(index).getBorderNumber());
					list.get(index).setMainImg(imgList.get(0));
					list.get(index).setImgList(imgList);
					System.out.println("mainImg : " + list.get(index).getMainImg());
				}
				
				int rowNumber = ItemMarketService.pageNumber(word, category, subCategory);
				int pageNumber = rowNumber/9;
				
				if(rowNumber%9 != 0) {
					pageNumber += 1;
				}
				
				if(Integer.parseInt(page) < 1) {
					request.setAttribute("list", list);
					request.setAttribute("word", word);
					request.setAttribute("category", category);
					request.setAttribute("subCategory", subCategory);
					request.setAttribute("pageNumber", pageNumber);
					
					request.getRequestDispatcher("view/noticeboard.jsp").forward(request, response);
				}else {
/*					System.out.println("itemName : " + list.get(0).getItemName());*/
					PrintWriter out = response.getWriter();
					JSONArray jsonArray = JSONArray.fromObject(list);
					jsonArray.add(pageNumber);
					out.println(jsonArray);
					
				}
			}

}
