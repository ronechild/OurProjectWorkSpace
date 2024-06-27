package com.spring5legacy.ourpro00.common.fileupload;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {

	private String uploadFileRepoDir = "C:/myupload";
	
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
		
		String uploadFileName = null;
		String uuid = null;
		
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

			File saveUploadFile = new File(fileUploadPath, uploadFileName);

			try {
				uploadFile.transferTo(saveUploadFile);
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
	
}
