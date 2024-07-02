package com.spring5legacy.ourpro00.mapper;

<<<<<<< Updated upstream
public interface RecruiterMapper {

	// 구인글 목록 조회
	public void selectRecruitList();
	
	// 특정 구인글 조회
	public void selectRecruit();
	
	// 구인글 총 수
	public void selectRowTotal();
	
	// 구인글 등록
	public void insertRecruit();
	
	// 특정 구인글 수정
	public void updateRecruit();
	
	// 특정 구인글 블라인드 처리
	public void updateDelFlag();
	
	// 특정 구인글 삭제
	public void deleteRecruit();
}
=======
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring5legacy.ourpro00.common.paging.PagingDTO;
import com.spring5legacy.ourpro00.domain.RecruiterVO;

public interface RecruiterMapper {

	// 구인글 목록 조회
	public List<RecruiterVO> selectRecruitList(PagingDTO paging);

	//NEW!! 구인글 총갯수 
	public Long selectRowTotal(PagingDTO paging);

	
	// 특정 구인글 조회
		public RecruiterVO selectRecruit (Long bno);
		
		// 구인글 총 수
		public Long selectRowTotal();
		
		// 구인글 등록
		public void insertRecruit(RecruiterVO recruiterVO);
		public void insertRecruit(
								@Param("bno") Long bno, 
								@Param("btitle") String btitle, 
								@Param("bcontent") String bcontent, 
								@Param("bwriter") String bwriter, 
								@Param("bregDate") Date bregDate, 
								@Param("bendDate") Date bendDate, 
								@Param("breplyCnt") Integer breplyCnt, 
								@Param("bappCnt") Integer bappCnt, 
								@Param("bblind") Integer bblind, 
								@Param("boccupation") String boccupation, 
								@Param("bregion") String bregion, 
								@Param("bhcnt") Integer bhcnt
								);
		
		// 특정 구인글 수정
		public Integer updateRecruit(RecruiterVO recruiterVO);
		public Integer updateRecruit(
								@Param("bno") Long bno, 
								@Param("btitle") String btitle, 
								@Param("bcontent") String bcontent, 
								@Param("bwriter") String bwriter, 
								@Param("bregDate") Date bregDate, 
								@Param("bendDate") Date bendDate, 
								@Param("breplyCnt") Integer breplyCnt, 
								@Param("bappCnt") Integer bappCnt, 
								@Param("bblind") Integer bblind, 
								@Param("boccupation") String boccupation, 
								@Param("bregion") String bregion, 
								@Param("bhcnt") Integer bhcnt
								);

		// 특정 구인글 블라인드 처리
		public void updateDelFlag(Long bno);
		
		// 특정 구인글 삭제
		public void deleteRecruit(Long bno);
		
		// *
		// userid의 username을 찾기
		public String findRecruiter(String userid);
	}
>>>>>>> Stashed changes
