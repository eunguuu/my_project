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

public class gBoardDAO {
	
	public Connection getConnection() throws Exception {
		
		Connection con = null;
		
		Class.forName("com.mysql.jdbc.Driver");
			
		String dbUrl = "jdbc:mysql://localhost:3306/mandle";
		String dbUser = "mandleid";
		String dbPass = "mandlepass";
		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		return con;
		
	}
	
	public void insertgBoard(gBoardBean bb) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		
		try {
			
			con = getConnection();
			
			String sql = "select max(num) from gboard";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bb.setNum(rs.getInt("max(num)")+1);
			}
			
			String sql2 = "insert into gboard(name, subject, content, num, readcount, date, file) values(?, ?, ?, ?, ?, ?, ?)";
			ps2 = con.prepareStatement(sql2);
			ps2.setString(1, bb.getName());
			ps2.setString(2, bb.getSubject());
			ps2.setString(3, bb.getContent());
			ps2.setInt(4, bb.getNum());
			ps2.setInt(5, bb.getReadcount());
			ps2.setTimestamp(6, bb.getDate());
			ps2.setString(7, bb.getFile());
			
			ps2.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			// 마무리 => 기억장소 해제
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(ps2 != null) try {ps2.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
				
	}
	
	public gBoardBean getgBoard(int num) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		gBoardBean bb = null;
		
		try {

			con = getConnection();
			
			String sql = "select * from gboard where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				bb = new gBoardBean();
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setNum(rs.getInt("num"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setFile(rs.getNString("file"));
								
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return bb;
		
	}
	
	public void updategBoard(gBoardBean bb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "update gboard set name=?, subject=?, content=?, file=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, bb.getName());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getContent());
			ps.setString(4, bb.getFile());
			ps.setInt(5, bb.getNum());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			
		}
		
	}
	
	public void deletegBoard(gBoardBean bb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "delete from gboard where num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bb.getNum());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			
		}
		
	}
	
	public List getgBoardList(int startRow, int pageSize) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		// 여러 개의 바구니를 저장할 큰 바구니(기억장소) 만들기(배열형태)
		List boardList = new ArrayList();
		
		try {
			
			con = getConnection();
			
			String sql = "select * from gboard order by num desc limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow-1);
			ps.setInt(2, pageSize);

			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				// 바구니에 게시판 첫번째 행 글 저장
				gBoardBean bb = new gBoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setNum(rs.getInt("num"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setFile(rs.getString("file"));
				
				// 배열에 첫번째 칸에 바구니 하나 저장
				boardList.add(bb);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return boardList;
		
	}
	
	public List getgBoardList(int startRow, int pageSize, String search) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		// 여러 개의 바구니를 저장할 큰 바구니(기억장소) 만들기(배열형태)
		List boardList = new ArrayList();
		
		try {
			
			con = getConnection();
			
//			String sql = "select * from gboard where subject like '%검색어%' order by num desc limit ?,?";
			String sql = "select * from gboard where subject like ? order by num desc limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setInt(2, startRow-1);
			ps.setInt(3, pageSize);

			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				// 바구니에 게시판 첫번째 행 글 저장
				gBoardBean bb = new gBoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setNum(rs.getInt("num"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setFile(rs.getString("file"));
				
				// 배열에 첫번째 칸에 바구니 하나 저장
				boardList.add(bb);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return boardList;
		
	}
	
	public void updategReadcount(int num) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "update gboard set readcount = readcount+1 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			
		}
		
	}
	
	public int getgBoardCount() {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			
			con = getConnection();
			
			String sql = "select count(*) from gboard";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt("count(*)");
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return count;
		
	}
	
	public int getgBoardCount(String search) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			
			con = getConnection();
			
//			String sql = "select count(*) from gboard where subject like '%검색어%'";
			String sql = "select count(*) from gboard where subject like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt("count(*)");
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return count;
		
	}
	

}
