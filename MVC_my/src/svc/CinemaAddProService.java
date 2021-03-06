package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReserveDAO;
import vo.ReserveBean;

public class CinemaAddProService {

	// 영화관 등록 요청 처리를 위한 registArticle() 메서드
	public boolean registArticle(ReserveBean cinema) {
		
		boolean isCinemaAddSuccess = false;
		
		Connection con = getConnection();
		
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		
		reserveDAO.setConnection(con);
		
		int addCount = reserveDAO.insertCinema(cinema);
		
		if(addCount > 0) {
			isCinemaAddSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isCinemaAddSuccess;
		
	}
	
}
