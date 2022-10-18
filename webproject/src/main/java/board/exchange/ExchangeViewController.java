package board.exchange;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Page/exchangePage.do")
public class ExchangeViewController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ExchangeViewController() {
		super();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ExchangeBoardDAO dao = new ExchangeBoardDAO();
		String exc_num = request.getParameter("exc_num");
		ExchangeBoardDTO dto = dao.selectView(exc_num);
		String writenickname= dto.getNickname();
		int exc_idx = dto.getIdx();
		
		dao.close();
		
	
		
		//상품상태
		String condition = null;
		if(dto.getExc_condition() == 1) {
			condition = "새상품";
		}else {
			condition = "중고";
		}
		
		//차액 흥정 여부
		String diff = null;
		if(dto.getExc_diff() ==1) {
			diff = "가능";
		}else {
			diff = "불가능";
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("condition", condition);
		request.setAttribute("writenickname", writenickname);
		request.setAttribute("diff", diff);
		request.setAttribute("exc_idx", exc_idx);
		request.getRequestDispatcher("/Page/exchangePage.jsp").forward(request, response);
	}
	
}
