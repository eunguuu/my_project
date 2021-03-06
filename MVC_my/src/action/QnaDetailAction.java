package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import svc.QnaDetailService;
import vo.ActionForward;
import vo.QnaBean;


public class QnaDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaDetailAction!");
		
		ActionForward forward = null;
		
		// 파라미터로 전달받은 게시물 번호(num) 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
//		System.out.println("게시물 번호 : " + num);
		String nowPage = request.getParameter("page"); 
//		System.out.println("게시물 페이지 : " + nowPage);
		
		// QnaDetailService 클래스의 인스턴스 생성 후
		// getArticle() 메서드를 호출하여 게시물 번호에 해당하는 글내용 가져오기
		// => 파라미터 : 글번호(num), 리턴타입 : 게시물 1개 정보(BoardBean)

		QnaDetailService qnaDetailService = new QnaDetailService();
		QnaBean article = qnaDetailService.getArticle(num);
		
		// 글내용이 저장된 NoticeBean 객체를 request 객체에 저장
		request.setAttribute("article", article);
		
//		request.setAttribute("page", request.getParameter("page"));
		// => 뷰페이지(notice_view.jsp)에서 getAttribute() 메서드로 가져오기
		
		// notice 폴더 내의 notice_view.jsp 페이지로 포워딩
		// => request 객체를 유지하고, 서블릿 주소가 유지되어야 하므로
		//    Dispatcher 방식으로 포워딩
		forward = new ActionForward();
		forward.setPath("/qna/qna_view.jsp");
//		forward.setRedirect(false); // 생략 가능
		
		return forward;
	}

}