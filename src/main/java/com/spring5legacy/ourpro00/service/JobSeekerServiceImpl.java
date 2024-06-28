package com.spring5legacy.ourpro00.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring5legacy.ourpro00.domain.JobSeekerAttachFileVO;
import com.spring5legacy.ourpro00.domain.JobSeekerVO;
import com.spring5legacy.ourpro00.mapper.JobSeekerAttachFileMapper;
import com.spring5legacy.ourpro00.mapper.JobSeekerMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class JobSeekerServiceImpl implements JobSeekerService{
	
	private JobSeekerMapper jobSeekerMapper ;
	private JobSeekerAttachFileMapper jobSeekerAttachFileMapper ;

	// 구직글 목록 조회 
	@Override
	public List<JobSeekerVO> getJobSeekerList(String awriter) {
		System.out.println("구직글 목록");
		return jobSeekerMapper.selectJobSeekerList();
	}

	// 특정 구직글 조회
	@Override
	public JobSeekerVO getJobSeeker(Long ano) {
			System.out.println("받은 ano: " + ano);
			JobSeekerVO jobSeeker = jobSeekerMapper.selectJobSeeker(ano) ;
			
			return jobSeeker;
	}
		
		// 구직글 총 수
	@Override
		public void getRowTotal() {
			System.out.println("구직글 총 수" + jobSeekerMapper.selectRowTotal());
			jobSeekerMapper.selectRowTotal() ;
		}
		
		// 구직글 등록
	@Override
		public Long registerJobSeeker(JobSeekerVO jobSeeker) {
			System.out.println("등록 전달 jobSeeker: " + jobSeeker);
			jobSeekerMapper.insertJobSeeker(jobSeeker) ;
			System.out.println("등록 후 jobSeeker: " + jobSeeker);
			
			List<JobSeekerAttachFileVO> attachFileList = jobSeeker.getJobSeekerAttachFileList() ;
			
			if(attachFileList != null && attachFileList.size() > 0) {
				for(JobSeekerAttachFileVO attachFile : attachFileList) {
					attachFile.setAno(jobSeeker.getAno());
					jobSeekerAttachFileMapper.instertAttachFile(attachFile);
				}
			}
			return jobSeeker.getAno();
		}
	
	//이력서 수정페이지 호출
	 @Override
		public JobSeekerVO showModify(Long bno) {
			System.out.println("서비스: 수정bno: " + bno);
			JobSeekerVO jobSeeker = jobSeekerMapper.selectJobSeeker(bno) ;
			return jobSeeker;
		}
		
		// 특정 구직글 수정
	@Override
		public boolean modifyJobSeeker(Long ano, String atitle, String acontent) {
			System.out.println("수정 메서드에 전달된 값들" + ano + ", " + atitle + ", " + acontent);
			return jobSeekerMapper.updateJobSeeker(ano, atitle, acontent) == 1;
		}
		

		@Override
		public boolean modifyJobSeeker(JobSeekerVO jobSeeker) {
			System.out.println("서비스: 게시물 수정 메서드에 전달된 VO: " + jobSeeker);
			
			long ano = jobSeeker.getAno() ;
		
			boolean modifyResult = jobSeekerMapper.updateJobSeeker(jobSeeker) == 1;
			
			jobSeekerAttachFileMapper.deleteAttachFiles(ano);
			
			List<JobSeekerAttachFileVO> attachFileList = jobSeeker.getJobSeekerAttachFileList() ;
			
			if(modifyResult && attachFileList != null) {
				for(JobSeekerAttachFileVO attachFile : attachFileList) {
					attachFile.setAno(ano);
					jobSeekerAttachFileMapper.instertAttachFile(attachFile); 
				}
			}
			
			return modifyResult ;
		}
		
		// 특정 구직글 삭제
		@Override
		public JobSeekerVO deleteJobSeeker(JobSeekerVO jobSeeker) {
			long ano = jobSeeker.getAno();
			System.out.println("게시물 삭제 ano: " + ano);
			
		//	List<JobSeekerAttachFileVO> attachFileList = jobSeekerAttachFileMapper.selectAttachFiles(ano) ;
			
			Integer deletedAttachFileCnt = jobSeekerAttachFileMapper.deleteAttachFiles(ano) ;
			System.out.println("db로부터 삭제된 파일 갯수: " + jobSeekerAttachFileMapper.deleteAttachFiles(ano));
			if(jobSeekerMapper.deleteJobSeeker(ano) == 1) {
				jobSeeker.setDeletedAttachFileCnt(deletedAttachFileCnt);
				System.out.println("controller로 전달: " + jobSeeker);
				return jobSeeker;
			} else {
				return null;
			}
			
		}


}
