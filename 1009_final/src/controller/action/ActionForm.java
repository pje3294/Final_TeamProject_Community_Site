package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.board.BoardDAO;
import model.board.BoardVO;

public class ActionForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8"); 
		ActionForward forward = null;
		
		BoardDAO boardDAO= new BoardDAO();
		BoardVO boardVO = new BoardVO();
		
		int userNum =  Integer.parseInt(request.getParameter("userNum"));
		String bTitle= request.getParameter("bTitle");
		String bWriter = request.getParameter("bWriter");
		String bCtgr = request.getParameter("bCtgr");
		String bLang = request.getParameter("bLang");
		String bContent = request.getParameter("bContent");
		
		boardVO.setUserNum(userNum);
		boardVO.setbTitle(bTitle);
		boardVO.setbWriter(bWriter);
		boardVO.setbCtgr(bCtgr);
		boardVO.setbLang(bLang);
		boardVO.setbContent(bContent);
		
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path= "board.do";
		if(bCtgr.equals("question")) {
			path = "question.do";
		}
		
		if(boardDAO.insert(boardVO)) {
			out.println("<script>alert('글작성이 완료되었습니다!');location.href='"+path+"'</script>");
			
		}else {
			out.println("<script>alert('글작성이 실패했습니다!');location.href='"+path+"'</script>");

		}
		
		
		
		
		return forward;
	}

}
