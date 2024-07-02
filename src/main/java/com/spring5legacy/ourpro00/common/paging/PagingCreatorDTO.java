package com.spring5legacy.ourpro00.common.paging;


import java.util.List;

import com.spring5legacy.ourpro00.domain.RecruiterVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PagingCreatorDTO {

		private PagingDTO paging;
		
		private Long startPagingNum;
		private Long endPagingNum;
		
		private Boolean prev;
		private Boolean next;
		
		private Long rowTotal;
		private Integer pagingNumCnt;
		private Long lastPageNum;
		
		private List<RecruiterVO> recruiter;
		
		public PagingCreatorDTO(PagingDTO paging, Long rowTotal, List<RecruiterVO> recruiter ) {
			this.paging = paging;
			this.rowTotal = rowTotal;
			this.pagingNumCnt = 20;
			this.recruiter = recruiter;
			
			this.endPagingNum = (long)(Math.ceil(paging.getPageNum()/(double)this.pagingNumCnt))*this.pagingNumCnt;
			this.startPagingNum = this.endPagingNum-this.pagingNumCnt+1;
			
			
			//행 총수를 기준으로 한 실제 마지막 페이지 번호 저장(총 페이지 수 = 맨 마지막 페이지의 페이징 번호)
			
			//this.lastPageNum = rowTotal/this.paging.getRowAmountPerPage()+1;//0단위로 맞아떨어지면 문제가생김
			this.lastPageNum = (long) Math.ceil(1.0*rowTotal/this.paging.getRowAmountPerPage());
			
			//lastPageNum의 값이 endPageingNum보다 작으면
			//lastPageNum값을 endPagingNum에 대입
			if(lastPageNum<endPagingNum) {
				endPagingNum=lastPageNum;
			}
			
			this.prev = this.startPagingNum>1;
			this.next = this.endPagingNum < this.lastPageNum;
			
			
	        System.out.println("전달된 페이징 기본데이터(paging): " + this.paging.toString());
	        System.out.println("시작 페이징번호: " + this.startPagingNum);
	        System.out.println("끝 페이징번호: " + this.endPagingNum);
	        System.out.println("이전버튼 표시 여부: " + this.prev);
	        System.out.println("다음버튼 표시 여부: " + this.next);
	        System.out.println("마지막 페이지 번호: " + this.lastPageNum);
		}
		

}
