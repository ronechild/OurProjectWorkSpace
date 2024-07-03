package com.spring5legacy.ourpro00.common.fileupload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class FileUploadController {

	private String uploadFileRepoDir = "C:/myupload";
	
	 //파일 업로드 요청 JSP 호출
    @GetMapping("/fileUploadByAjax")
    public String showFileUploadPage() {
        return "sample/fileUploadByAjax";
    }
    
    //썸네일 파일 전송: 썸네일 이름을 받아서 썸네일 파일을 byte배열 타입으로 웹브라우저로 전송(GET 방식 사용)
    @GetMapping(value = "/displayThumbnail")
    public ResponseEntity<byte[]> sendThumbnail(String thumbnail) {
    	System.out.println("받은 썸네일: " + thumbnail);
        File thumbnailFile = new File(thumbnail) ;
        System.out.println("썸네일: " + thumbnailFile);

        if(!thumbnailFile.exists()) {
			         return new ResponseEntity<byte[]>(new byte[0], HttpStatus.NOT_FOUND) ;
		      }
        
        ResponseEntity<byte[]> result = null ;
        HttpHeaders httpHeaders = new HttpHeaders() ;

        try {
            httpHeaders.add("Content-Type", Files.probeContentType(thumbnailFile.toPath())) ;
            result = new ResponseEntity<byte[]>(	FileCopyUtils.copyToByteArray(thumbnailFile),
                                                   	httpHeaders, HttpStatus.OK) ;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result ;
    }

	@PostMapping(value = "/doFileUpload" , produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<AttachFileDTO> doFileUpload(MultipartFile[] uploadFiles){
		
		if (uploadFiles == null) {
			return new ArrayList<AttachFileDTO>();
		}
		
		List<AttachFileDTO> attachFileList = new ArrayList<AttachFileDTO>(); 
		AttachFileDTO attachFile = null;
		
		String dateDir = getDatePathName();	
		File fileUploadPath = new File(uploadFileRepoDir, dateDir);
		fileUploadPath.mkdirs();
		
		 String uploadFileName = null ;
	        String uuid = null ;
	        File thumbnailFile = null ;
	        FileOutputStream myfos = null ;
	        InputStream myis = null ;
		
		for (MultipartFile uploadFile : uploadFiles) {
			
			attachFile = new AttachFileDTO();
			
			attachFile.setUploadPath(dateDir);
			attachFile.setRepoPath(uploadFileRepoDir);
			
			uploadFileName = uploadFile.getOriginalFilename(); 
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			attachFile.setFileName(uploadFileName);

			uuid = UUID.randomUUID().toString();
			uploadFileName = uuid + "_" + uploadFileName;
			
			attachFile.setUuid(uuid);

			File saveuploadFile = new File(fileUploadPath, uploadFileName);

			try {
				uploadFile.transferTo(saveuploadFile);
				//이미지파일이면 썸네일 생성
				if(isImageFile(saveuploadFile)) {
	                
                    attachFile.setFileType("I") ;  //파일유형 저장
                    thumbnailFile = new File(fileUploadPath, "s_" + uploadFileName) ;
                    
                    myfos = new FileOutputStream(thumbnailFile) ;
                    myis = uploadFile.getInputStream() ;
                    Thumbnailator.createThumbnail(myis, myfos, 50, 50) ;
                    myis.close() ;
                    myfos.flush() ;
                    myfos.close() ;
                } else {
                    attachFile.setFileType("F") ;  //파일유형 저장
                }

			} catch (IOException e) {
				System.out.println("업로드 실패");
			}
			
			attachFileList.add(attachFile);

		}

		return attachFileList;
	}
	
	@PostMapping(value = {"/deleteFile"}) 
	public ResponseEntity<String>deleteFile(String fileName,String fileType){
	
	try {
		fileName = URLDecoder.decode(fileName,"utf-8");
		System.out.println("fileName: " + fileName);
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	
	File delFile = new File(fileName);
	
	boolean delResult = delFile.delete();
	
	return delResult? new ResponseEntity<String>("DelSuccess",HttpStatus.OK) 
			        : new ResponseEntity<String>("DelFail",HttpStatus.OK);
}
	
	private String getDatePathName() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		return sdf.format(new Date());
	}
	
	 //이미지 파일 확인 메서드
    private boolean isImageFile(File myFile) {
    	
        String myFileContentType = null;
        try {
            myFileContentType = Files.probeContentType(myFile.toPath());   //파일의 MIME 타입 확인
            System.out.println("fileContentType: " + myFileContentType);
            return myFileContentType.startsWith("image"); //파일의 MIME 타입이 image로 시작(이미지 파일임)하면 true 반환

        } catch (IOException e) {
            System.out.println("오류: " + e.getMessage());
            return false ;
        }
    }
	
}
