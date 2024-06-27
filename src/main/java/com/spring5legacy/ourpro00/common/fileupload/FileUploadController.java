package com.spring5legacy.ourpro00.common.fileupload;

import java.util.ArrayList;
import java.util.List;

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
		
		return null;
	}
	
}
