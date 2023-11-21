package com.mama.doc.adno;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mama.doc.Execute;
import com.mama.doc.Result;
import com.mama.doc.dao.NoticeDAO;
import com.mama.doc.vo.SearchVO;

public class AdNoticeListController implements Execute{
	 @Override
	   public Result execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 NoticeDAO noticeDAO = new NoticeDAO();
		 SearchVO searchVO = new SearchVO();
		 System.out.println("AdNoticeListController 실행");
		 
	      
	     
	      // 페이징 처리
	        String temp = request.getParameter("page");
			int page = temp == null ? 1 : Integer.parseInt(temp);
			int pageSize = 20;
			int totalCount = noticeDAO.getTotal();
			
			int endRow = page * pageSize;
			int startRow = endRow - (pageSize - 1);
			
			int startPage = ((page - 1) / pageSize) * pageSize + 1;
			int endPage = startPage + 9;
			int realEndPage = (int)(Math.ceil((double)totalCount / pageSize));
			
			//검색		
			String cate = request.getParameter("cate");
			cate = cate == null? "" : cate;
			String keyword = request.getParameter("keyword");
			keyword = keyword == null?"":keyword;
			
			searchVO.setCate(cate);
			searchVO.setKeyword(keyword);
			
			endPage = endPage > realEndPage ? realEndPage : endPage;
			
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("realEndPage", realEndPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("nowPage", page);
			request.setAttribute("adNoticeList", noticeDAO.adNoticeList(startRow, endRow, searchVO));
			request.setAttribute("cate", cate);
			request.setAttribute("keyword", keyword);
	      
	      return null;
	   }
}
