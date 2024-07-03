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

	public PagingCreatorDTO(PagingDTO paging, Long rowTotal, List<RecruiterVO> recruiter) {
		this.paging = paging;
		this.rowTotal = rowTotal;
		this.pagingNumCnt = 20;
		this.recruiter = recruiter;

		this.endPagingNum = (long) (Math.ceil(paging.getPageNum() / (double) this.pagingNumCnt)) * this.pagingNumCnt;
		this.startPagingNum = this.endPagingNum - this.pagingNumCnt + 1;
		this.lastPageNum = (long) Math.ceil(1.0 * rowTotal / this.paging.getRowAmountPerPage());

		if (lastPageNum < endPagingNum) {
			endPagingNum = lastPageNum;
		}

		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < this.lastPageNum;

	}

}
