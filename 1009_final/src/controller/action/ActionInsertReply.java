package controller.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.board.ReplyDAO;
import model.board.ReplyVO;

public class ActionInsertReply implements Action{

	@SuppressWarnings("null")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyVO reply = new ReplyVO();
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		int userNum = Integer.parseInt(request.getParameter("userNum"));
		String rContent = request.getParameter("rContent");
		String rWriter = request.getParameter("rWriter");
		int parentId = Integer.parseInt(request.getParameter("parentId"));
		
		reply.setbId(bId);
		reply.setParentId(parentId);
		reply.setrContent(rContent);
		reply.setrWriter(rWriter);
		reply.setUserNum(userNum);
	
		if(replyDAO.insert(reply)) {
			System.out.println("댓글 입력 성공!");
		}else {
			System.out.println("댓글 입력 실패!");
		}
		String path = "detail.do";
		path += "?bId"+bId;
		if (request.getParameter("pageNum") !=null) {
			path +="&pageNum="+request.getParameter("pageNum");
		}
		forward = new ActionForward();
		forward.setPath(path);
		forward.setRedirect(false);
			
		
		
		
		return forward;
	}
	
	

}
