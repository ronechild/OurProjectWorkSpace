package com.spring5legacy.ourpro00.common.fileupload;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AttachFileDTO {
	
	private String uuid;
	private String fileName;
	private String uploadPath;
	
	private String repoPath = "C:myupload";
	
}
