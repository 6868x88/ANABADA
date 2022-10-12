package board.trade;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Page/sellPage.do")
public class SellViewController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SellViewController() {
		super();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		SellBoardDAO dao = new SellBoardDAO();
		String sell_num = request.getParameter("sell_num");
		SellBoardDTO dto = dao.selectView(sell_num);
		String writenickname= dto.getNickname();
		int sell_idx = dto.getIdx();
		
		dao.close();
		
		
		//상품상태
		String condition = null;
		if(dto.getSell_condition() == 1) {
			condition = "새상품";
		}else {
			condition = "중고";
		}
		
		//가격 천 단위 표시(JSTL-자바 사용)
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String price = decFormat.format(dto.getSell_price());
		
		
		//카테고리 분류
		String category_str[] = {"패션/잡화/뷰티","테크/가전","홈/리빙","베이비/키즈","반려동물","게임/취미","기타"};
		
		for(int i=0; i<7; i++) {
			if(dto.getSell_category() == i) {
				request.setAttribute("category", category_str[i]);
			}
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("condition", condition);
		request.setAttribute("price", price);
		request.setAttribute("writenickname", writenickname);
		request.setAttribute("sell_idx", sell_idx);
		request.getRequestDispatcher("/Page/sellPage.jsp").forward(request, response);
	}
	
}
