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
		
		String saveDir=request.getServletContext().getRealPath("/images");
		int maxSize=1024*1024*100; // 100M
		String encoding="UTF-8";
		
		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, 
				new DefaultFileRenamePolicy());
		
		//���̵�,
		//String id = request.getParameter("id");
		
		String id="aaa";
		int bordernumber=70;
		
		String content = m.getParameter("content");
		String title = m.getParameter("title");
		int price = Integer.parseInt(m.getParameter("price").trim());
		String category = m.getParameter("category");
		String subcategory = m.getParameter("subcategory");
		String itemState = "���Ŵ����";
		int i= 0; String files[] = new String[10]; // maximum 10���� ����..
		String savefilename="";
		 Enumeration<String> em=m.getFileNames();
		 
		 while(em.hasMoreElements()){
		        //���۵� file�� name�Ӽ�(�Ķ�����̸�) ������
		        String fileName=em.nextElement();
		        
		       savefilename=m.getFilesystemName(fileName);
		       
		       files[i++] = saveDir+"/"+savefilename; 
		 }
		 
		 for(i=0;i<files.length;i++){
			 System.out.print(files[i]+",");
		 }
		BorderDTO borderDTO = new BorderDTO(id, bordernumber, content, title, price, "", category, subcategory, itemState);
		
		//ItemMarketService.imgWrite(borderDTO.getBorderNumber(), imgName);
		PrintWriter out = response.getWriter();
		if(ItemMarketService.write(borderDTO)>0){
			//if(ItemMarketService.imgWrite(borderNumber, imgName))
			response.sendRedirect("view/noticeboard.jsp");
		}else{
			out.println("<script>");
			out.println("alert('���� ���Ե��� �ʾҽ��ϴ�.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
