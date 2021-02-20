package member;

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

public class MemberDAO {
	
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
	
	public void insertMember(MemberBean mb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "insert into member(id, pass, name, email, postcode, address, detailAddress, extraAddress, phone, mobile, date) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getPass());
			ps.setString(3, mb.getName());
			ps.setString(4, mb.getEmail());
			ps.setString(5, mb.getPostcode());
			ps.setString(6, mb.getAddress());
			ps.setString(7, mb.getDetailAddress());
			ps.setString(8, mb.getExtraAddress());
			ps.setString(9, mb.getPhone());
			ps.setString(10, mb.getMobile());
			ps.setTimestamp(11, mb.getDate());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			
		}
		
	}
	
	public int userCheck(String id, String pass) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		int check = -1;
		
		try {
			
			con = getConnection();
			
			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				if(pass.equals(rs.getString("pass"))) {
					// id, pass 일치
					check = 1;
					
				} else {
					// pass 불일치
					check = 0;
				}
				
			} else {
				// id 불일치
				check = -1;
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return check;
	}
	
	public MemberBean getMember(String id) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		MemberBean mb = null;
		
		try {
			
			con = getConnection();
			
			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				mb.setPostcode(rs.getString("postcode"));
				mb.setAddress(rs.getString("address"));
				mb.setDetailAddress(rs.getString("detailAddress"));
				mb.setExtraAddress(rs.getString("extraAddress"));
				mb.setPhone(rs.getString("phone"));
				mb.setMobile(rs.getString("mobile"));
				mb.setDate(rs.getTimestamp("date"));
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return mb;
		
	}
	
	public void updateMember(MemberBean mb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "update member set name = ?, email = ?, postcode = ?, address = ?, detailAddress = ?, extraAddress = ?, phone = ?, mobile = ? where id = ? and pass = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mb.getName());
			ps.setString(2, mb.getEmail());
			ps.setString(3, mb.getPostcode());
			ps.setString(4, mb.getAddress());
			ps.setString(5, mb.getDetailAddress());
			ps.setString(6, mb.getExtraAddress());
			ps.setString(7, mb.getPhone());
			ps.setString(8, mb.getMobile());
			ps.setString(9, mb.getId());
			ps.setString(10, mb.getPass());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			
		}
		
	}
	
	public void deleteMember(MemberBean mb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = getConnection();
			
			String sql = "delete from member where id = ? and pass = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getPass());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			
		}
		
		
	}
	
	public int dupCheck(String id) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		int check = 1;
		
		try {
			
			con = getConnection();
			
			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				check = 1;
				
			} else {
				
				check = 0;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return check;
		
	}
	
	
	public List getMemberList() {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		List memberList = new ArrayList();
		
		try {
			
			con = getConnection();
			
			String sql = "select * from member order by date";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				MemberBean mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				mb.setPostcode(rs.getString("postcode"));
				mb.setAddress(rs.getString("address"));
				mb.setDetailAddress(rs.getString("detailAddress"));
				mb.setExtraAddress(rs.getString("extraAddress"));
				mb.setPhone(rs.getString("phone"));
				mb.setMobile(rs.getString("mobile"));
				mb.setDate(rs.getTimestamp("date"));
				
				memberList.add(mb);
				
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(con != null) try {con.close();} catch(SQLException ex){}
			if(ps != null) try {ps.close();} catch(SQLException ex){}
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			
		}
		
		return memberList;
		
	}
	

}
