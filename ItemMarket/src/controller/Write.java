package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dto.BorderDTO;
import model.service.ItemMarketService;

public class Write implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = (String) request.getSession().getAttribute("id");
		String saveDir=request.getServletContext().getRealPath("/img/");
		int maxSize=1024*1024*100; // 100M
		String encoding="UTF-8";
		
		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, 
				new DefaultFileRenamePolicy());
		
		String content = m.getParameter("content");
		content = content.replace("\r\n", "<br>"); // 엔터 html태그로 변환
		String title = m.getParameter("title");
		int price = Integer.parseInt(m.getParameter("price").trim());
		String category = m.getParameter("category");
		String subcategory = m.getParameter("subcategory");
		String itemState = "거래대기중";
		String files="";
		String savefilename="";
		 Enumeration<String> em=m.getFileNames();
		 
		
		BorderDTO borderDTO = new BorderDTO(id, content, title, price, "", category, subcategory, itemState);
		
		
		PrintWriter out = response.getWriter();
		if(ItemMarketService.write(borderDTO)>0){
			
			 while(em.hasMoreElements()){
			        //파일 여러개 들어왔을
			        String fileName=em.nextElement();
			        
			       savefilename=m.getFilesystemName(fileName);
			       System.out.println(savefilename);
			       ItemMarketService.imgWrite(savefilename);
			 }
		
			response.sendRedirect("view/index.jsp");
		}else{
			out.println("<script>");
			out.println("alert('파일을 다운로드 받지 못했다?')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}