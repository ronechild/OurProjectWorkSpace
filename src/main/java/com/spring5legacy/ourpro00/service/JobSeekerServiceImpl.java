package com.spring5legacy.ourpro00.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		return jobSeekerMapper.selectJobSeekerList(awriter);
	}
	
	// 구직글 목록 조회 
		@Override
		public List<JobSeekerVO> getJobSeekerListForDetail(Long bno) {
			System.out.println("구직글 목록");
			return jobSeekerMapper.selectJobSeekerListForDetail(bno);
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
		
		// 이력서 등록
	@Transactional
	@Override
		public String registerJobSeeker(JobSeekerVO jobSeeker) {
			System.out.println("등록 전달 jobSeeker: " + jobSeeker);
			jobSeekerMapper.insertJobSeeker(jobSeeker) ;
			System.out.println("등록 후 jobSeeker: " + jobSeeker);
			
			List<JobSeekerAttachFileVO> attachFileList = jobSeeker.getJobSeekerAttachFileList() ;
			
//			if(attachFileList != null && attachFileList.size() > 0) {
//				for(JobSeekerAttachFileVO attachFile : attachFileList) {
//					attachFile.setAno(jobSeeker.getAno());
//					jobSeekerAttachFileMapper.instertAttachFile(attachFile);
//				}
//			}
			System.out.println(attachFileList + "나오냐?");
			System.out.println("여기?");
			if (attachFileList != null && attachFileList.size() > 0) {
	            attachFileList
	            .forEach(attachFile -> { attachFile.setAno(jobSeeker.getAno()) ;
	            System.out.println("아님 여기?");
	                                        jobSeekerAttachFileMapper.insertAttachFile(attachFile) ;
	                    }); //forEach-end
	        }

			return jobSeeker.getAwriter();
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
			System.out.println("서비스 - 수정 메서드에 전달: " + jobSeeker);
			
			Long ano = jobSeeker.getAno() ;
		
			boolean modifyResult = jobSeekerMapper.updateJobSeeker(jobSeeker) == 1;
			System.out.println("가져온 ano: "  + ano);
			jobSeekerAttachFileMapper.deleteAttachFiles(ano);
			System.out.println("여기까진 된거지?2");
			
			List<JobSeekerAttachFileVO> attachFileList = jobSeeker.getJobSeekerAttachFileList() ;
			
			if (attachFileList != null && attachFileList.size() > 0) {
	            attachFileList
	            .forEach(attachFile -> { attachFile.setAno(jobSeeker.getAno()) ;
	            System.out.println("아님 여기?");
	                                        jobSeekerAttachFileMapper.insertAttachFile(attachFile) ;
	                            			System.out.println("되지??");
	                    }); //forEach-end
	        }
			
			return modifyResult ;
		}
		
		// 특정 구직글 삭제
		@Override
		public JobSeekerVO deleteJobSeeker(JobSeekerVO jobSeeker) {
			Long ano = jobSeeker.getAno();
			System.out.println("게시물 삭제 ano: " + ano);
			
		//	List<JobSeekerAttachFileVO> attachFileList = jobSeekerAttachFileMapper.selectAttachFiles(ano) ;
			
			int deletedAttachFileCnt = jobSeekerAttachFileMapper.deleteAttachFiles(ano);
					
			System.out.println("db로부터 삭제된 파일 갯수: " + jobSeekerAttachFileMapper.deleteAttachFiles(ano));
			if(jobSeekerMapper.deleteJobSeeker(ano)) {
				jobSeeker.setDeletedAttachFileCnt(deletedAttachFileCnt);
				System.out.println("controller로 전달: " + jobSeeker);
				return jobSeeker;
			} else {
				System.out.println("삭제 한거 없음~~~");
				return null ;
			}
			
		}


}
