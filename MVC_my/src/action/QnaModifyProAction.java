package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import svc.QnaModifyProService;

import vo.ActionForward;

import vo.QnaBean;

public class QnaModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 특정 게시물 수정을 요청하는 Action 클래스
		System.out.println("QnaModifyProAction");
		
		ActionForward forward = null;
		

	
		ServletContext context = request.getServletContext();
		
		String saveFolder = "/noticeUpload";
		
		String realFolder = context.getRealPath(saveFolder);
		
		int fileSize = 1024 * 1024 * 10;
		
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request) 객체 
				realFolder, // 실제 업로드 폴더 
				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8", // 파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
		);
		
		// 게시물 수정에 필요한 글번호(num) 가져오기
		int num = Integer.parseInt(multi.getParameter("num"));
		String nowPage = multi.getParameter("page");
//		System.out.println("게시물 페이지 : " +nowPage);
		
		QnaModifyProService qnaModifyProService = new QnaModifyProService();
		
		QnaBean article = new QnaBean();
		article.setNum(num);
		article.setSubject(multi.getParameter("subject"));
		article.setContent(multi.getParameter("content"));
		article.setFile(multi.getOriginalFileName("file"));
		
//		System.out.println("글 번호 : " + num);
//		System.out.println("글 페이지 : " + nowPage);
//		
//		System.out.println("제목 : "+multi.getParameter("subject"));
//		System.out.println("내용 : "+multi.getParameter("content"));
//		System.out.println("글쓴이 : "+multi.getParameter("member_id"));
		System.out.println("원글쓴이 : " +multi.getParameter("p_member_id"));
		// QnaModifyProService 클래스의 modifyArticle() 메서드를 호출하여
		// 글 수정 작업 요청
		// => 파라미터 : QnaBean, 리턴타입 : boolean(isModifySuccess)
		
		boolean isModifySuccess =
				qnaModifyProService.modifyArticle(article);
		
	
		// 수정 결과에 따른 처리
		// => 수정 실패(isModifySuccess 가 false)일 경우 
		//    자바스크립트를 사용하여 "글 수정 실패!" 출력 후 
		//    이전페이지로 이동
		// => 아니면 ActionForward 객체 생성 후 QnaDetail.qn 로 포워딩
		//    새 요청이 발생하므로 Redirect 방식으로 이동
		//    파라미터로 글번호(num)와 페이지번호(page) 전달 필요
		
		System.out.println("확인 : " + multi.getParameter("re_ref") + ", " + multi.getParameter("re_lev"));
		
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("QnaDetail.qn?num=" + num + 
									"&page=" + nowPage + 
									"&re_ref=" + multi.getParameter("re_ref") + 
									"&re_lev=" + multi.getParameter("re_lev"));
			
			
			System.out.println("게시물 페이지 : " +nowPage);

			forward.setRedirect(true);
		}
		
		return forward;
	}

}
