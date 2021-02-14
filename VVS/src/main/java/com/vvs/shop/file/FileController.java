package com.vvs.shop.file;

import java.io.File;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class FileController {
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	FileServiceImpl fileServiceImpl;
	
	@RequestMapping(value = "file/doUpload.do", method = RequestMethod.POST)
	public String doUpload(FileVO fileVO, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		fileVO.setVvsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		fileVO.setVvsThunImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		LOG.debug("fileVO"+fileVO);
		fileServiceImpl.doUpload(fileVO);
		
		return "redirect:/member/homeBack.do";
	}
}

