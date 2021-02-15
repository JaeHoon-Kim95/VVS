package com.vvs.shop.file;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	/*
	 * @Resource(name="uploadPath") private String uploadPath;
	 */
	
	
	@Autowired
	FileServiceImpl fileServiceImpl;
	
	@RequestMapping(value = "file/doUpload.do", method = RequestMethod.POST)
	public String doUpload(FileVO fileVO, MultipartFile file, HttpServletRequest req) throws Exception {
		String path2 = System.getProperty("user.home") + "\\git\\VVS\\VVS\\src\\main\\webapp\\resources";	
		//String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String imgUploadPath = path2 + File.separator + "imgUpload";
		LOG.debug("imgUploadPath"+imgUploadPath);
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		
		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = path2 + File.separator + "images" + File.separator + "none.png";
		}

		fileVO.setImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		fileVO.setThunImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		fileVO.setProductNum(43);
		LOG.debug("fileVO"+fileVO);
		fileServiceImpl.doUpload(fileVO);
		
		return "redirect:/member/homeBack.do";
	}
}

