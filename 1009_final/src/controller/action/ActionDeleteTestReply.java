package controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.test.TestReplyDAO;
import model.test.TestReplyVO;

public class ActionDeleteTestReply implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		TestReplyDAO replyDAO= new TestReplyDAO();
		TestReplyVO reply = new TestReplyVO();
		
		int rId = Integer.parseInt(request.getParameter("rId"));
		int tId = Integer.parseInt(request.getParameter("tId"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		reply.setrId(rId);
		reply.settId(tId);
		
		if(replyDAO.delete(reply)) {
			System.out.println("���� ����");
		} else {
			System.out.println("���� ����");
		}
		
		
		String path= "detailTest.do";
		path += "?tId="+tId;
		path += "&pageNum="+pageNum;
		
		forward.setPath(path);
		forward.setRedirect(false);
		return forward;
	}

}
