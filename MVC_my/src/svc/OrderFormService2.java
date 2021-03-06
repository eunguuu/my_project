package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.StoreDAO;
import vo.StoreBean;

//장바구니에서 구매하기시 - 구매하기 목록
public class OrderFormService2 {

	public ArrayList<StoreBean> getBasketList(String[] checkRows, String id) {
		System.out.println("OrderFormService2 - getBasketList() !");
	    
	    ArrayList<StoreBean> basketList = null;
	    
	    Connection con = getConnection();
	    StoreDAO storeDAO = StoreDAO.getInstance();
	    storeDAO.setConnection(con);
	       
	    basketList = storeDAO.selectBasketList(checkRows, id);
	    
	    close(con);
	       
	    return basketList;
	}

	public String createOrderNum() {
		System.out.println("OrderFormService2 - createOrderNum !");
		
		String orderNum = null;
		
		Connection con = getConnection();
	    StoreDAO storeDAO = StoreDAO.getInstance();
	    storeDAO.setConnection(con);
	    
	    orderNum = storeDAO.createOrderNum();
	    
	    close(con);
	    
		return orderNum;
	}

	public String[] createReserveNum(int length) {
		System.out.println("OrderFormService2 - createReserveNum !");
		
		String[] reserveNum = null;
		
		Connection con = getConnection();
	    StoreDAO storeDAO = StoreDAO.getInstance();
	    storeDAO.setConnection(con);
	    
	    reserveNum = storeDAO.createReserveNum(length);
	    
	    close(con);
	    
		return reserveNum;
	}



}
