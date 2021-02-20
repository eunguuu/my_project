package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDAO {
	
	public Connection getConnection() throws Exception {
		
		Connection con = null;
		
		Class.forName("com.mysql.jdbc.Driver");
			
		String dbUrl = "jdbc:mysql://localhost:3306/mandle";
		String dbUser = "mandleid";
		String dbPass = "mandlepass";
		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		
		//커넥션 풀(Connection Pool)
		// 데이터베이스와 연결된 Connection객체를 미리 생성하여 Pool(풀,기억장소) 저장
		// 필요할때마다 풀에 접근하여 Connection객체 사용, 작업 끝나면 반환
		// 프로그램은 서버에 미리 설치
		// 1. WebContent META-INF context.xml 만들어 미리 자원준비
		// 2. DAO 자원이름을 불러서 사용
		// 장점 : 속도 증가 , 수정시 하나의 파일 context.xml수정 
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		
		return con;
		
		}

	public void insertComment(CommentBean cb) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
	
		try {
		
			con = getConnection();
			
			String sql = "select max(cnum) from comment";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				cb.setCnum(rs.getInt("max(cnum)")+1);
			}
			
			String sql2 = "insert into comment(name, content, cnum, bnum, date) values(?, ?, ?, ?, ?)";
			ps2 = con.prepareStatement(sql2);
			ps2.setString(1, cb.getName());
			ps2.setString(2, cb.getContent());
			ps2.setInt(3, cb.getCnum());
			ps2.setInt(4, cb.getBnum());
			ps2.setTimestamp(5, cb.getDate());
			
			ps2.executeUpdate();
		
		} catch (Exception e) {
		
			e.printStackTrace();
		
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(ps2 != null) try {ps2.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
			
	}
	
	public CommentBean getComment(int bnum) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		CommentBean cb = null;
		
		try {

			con = getConnection();
			
			String sql = "select * from comment where bnum = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bnum);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				cb = new CommentBean();
				cb.setCnum(rs.getInt("cnum"));
				cb.setBnum(rs.getInt("bnum"));
				cb.setName(rs.getString("name"));
				cb.setContent(rs.getString("content"));
				cb.setDate(rs.getTimestamp("date"));
								
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return cb;
		
	}
	
	public List getCommentList(int bnum, int startRow, int pageSize) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		// 여러 개의 바구니를 저장할 큰 바구니(기억장소) 만들기(배열형태)
		List commentList = new ArrayList();
		
		try {
			
			con = getConnection();
			
			String sql = "select * from comment where bnum = ? order by cnum limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bnum);
			ps.setInt(2, startRow-1);
			ps.setInt(3, pageSize);

			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				// 바구니에 게시판 첫번째 행 글 저장
				CommentBean cb = new CommentBean();
				cb.setCnum(rs.getInt("cnum"));
				cb.setBnum(rs.getInt("bnum"));
				cb.setName(rs.getString("name"));
				cb.setContent(rs.getString("content"));
				cb.setDate(rs.getTimestamp("date"));
				
				// 배열에 첫번째 칸에 바구니 하나 저장
				commentList.add(cb);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(ps != null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
			
		}
		
		return commentList;
		
	}

	public int getCommentCount(int bnum) {
		
		int count = 0;
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "select count(*) from comment where bnum = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bnum);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt("count(*)");
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(ps != null) try{ps.close();}catch(SQLException ex){}
			if(con != null) try{con.close();}catch(SQLException ex){}
			
		}
		
		return count;
		
	}
	
	public void updateComment(CommentBean cb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "update comment set name=?, content=? where cnum=? && bnum=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, cb.getName());
			ps.setString(2, cb.getContent());
			ps.setInt(3, cb.getCnum());
			ps.setInt(4, cb.getBnum());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			
		}
		
	}
	
	public void deleteComment(CommentBean cb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "delete from comment where cnum=? && bnum=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, cb.getCnum());
			ps.setInt(2, cb.getBnum());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			
		}
		
	}
	

}
