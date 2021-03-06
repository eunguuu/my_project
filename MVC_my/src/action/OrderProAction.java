package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.OrderProService;
import svc.OrderProService2;
import vo.ActionForward;
import vo.StoreBean;

//////스토어메인, 디테일에서 넘어옴 //////
public class OrderProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
	      
	      System.out.println("OrderProAction으로 이동!");
	      
	      HttpSession session = request.getSession(); //MemberBean id 값 가져오기
	      String id = (String)session.getAttribute("id");
	      int goodsId = Integer.parseInt(request.getParameter("goodsId"));
	      int sumPrice = Integer.parseInt(request.getParameter("sumPrice")); //sumPrice 값 가져오기
	      int totalPrice = Integer.parseInt(request.getParameter("totalPrice")); //totalPrice 값 가져오기
	      String orderNum = request.getParameter("orderNum");
	      String reserveNum = request.getParameter("reserveNum");
	      
	      StoreBean order = new StoreBean();
	      order.setOrderNum(orderNum);
	      order.setReserveNum(reserveNum);
	      order.setSumPrice(sumPrice);
	      order.setTotalPrice(totalPrice);
	      order.setGoodsId(goodsId);
	      
	      String[] basketCount = request.getParameterValues("basketCount");
	      for(String num:basketCount) {
	    	  System.out.println(num);
	      }
	      
	      System.out.println("구매한 goodsId : " + goodsId);
	      
	      OrderProService orderProService = new OrderProService();
	      
	      boolean isOrderSuccess = orderProService.OrderGoods(id, order, basketCount);
	      
	      //멤버십 추가
	      boolean isMembershipSuccess = orderProService.createMembership(id, order);
	      
		  
		  if(isOrderSuccess && isMembershipSuccess) {
			  if(orderNum != null) {
				  forward = new ActionForward();
				  forward.setPath("OrderResult.go?orderNum=" + orderNum);
				  forward.setRedirect(true);
			  } else {
		         response.setContentType("text/html; charset=UTF-8");
		         
		         PrintWriter out = response.getWriter();
		         
		         out.println("<script>");
		         out.println("alert('주문번호 없음!')");
		         out.println("history.back()");
		         out.println("</script>");
		      }
		  } else {
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('결제 실패!')"); 
				out.println("history.back()");
				out.println("</script>"); 
			}
	      
	      
//	      forward = new ActionForward();
//	      forward.setPath("/goods/orderResult.jsp");
//	      forward.setRedirect(false);
	      
	      return forward;
	}

}
