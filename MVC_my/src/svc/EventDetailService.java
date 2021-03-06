package svc;

import vo.EventBean;


import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.EventDAO;



public class EventDetailService {

	public EventBean getArticle(int num) throws Exception{
		System.out.println("EventDetailService - getArticle()");
		
		// 1(공통). Connection 객체 가져오기
		Connection con = getConnection();
		
		// 2(공통). PreviewDAO 객체 가져오기
		EventDAO eventDAO = EventDAO.getInstance();
		
		// 3(공통). PreviewDAO 객체에 Connection 객체 전달
		eventDAO.setConnection(con);
		
		// 4. PreviewDAO 객체의 selectArticle() 메서드를 호출하여
		//    게시물 1개 상세내용 조회 결과를 PreviewBean 객체로 리턴받기
		//    => 파라미터 : 글번호(num), 리턴타입 : PreviewBean
		EventBean article = eventDAO.selectArticle(num);
		
		// 게시물 상세 내용 조회가 성공했을 경우 
		// NoticeDAO 객체의 updateReadCount() 메서드 호출하여
		// 해당 게시물 조회수(readcount)를 1만큼 증가시키기
		// => 파라미터 : 글번호(num), 
		//    리턴타입 : int(UPDATE 실행 결과(updateCount))
		if(article != null) { // 게시물 상세 내용이 리턴되었을 경우(= 조회 성공)
			int updateCount = eventDAO.updateReadcount(num);
			
			// 조회수 증가가 성공했을 경우 commit, 실패했을 경우 rollback 수행
			if(updateCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		// 5(공통). Connection 객체 반환하기
		close(con);
		
		return article;
	}

}