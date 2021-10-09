package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.board.BoardDAO;
import model.board.BoardVO;

public class ActionDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");
		BoardDAO boardDAO = new BoardDAO();
		BoardVO board = new BoardVO();
		
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		board.setbId(bId);
		
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(boardDAO.delete(board)) {
			out.println("<script>alert('삭제가 완료되었습니다!');location.href='index.jsp'</script>"); // 어디로 갈지 정해야함!
			
		}else {
			out.println("<script>alert('삭제가 실패했습니다!');location.href='index.jsp'</script>"); // 어지로 갈지 정해야 함!

		}
		
		
		
		return null;
	}
	

}
