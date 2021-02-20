package com.vvs.shop.file;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface FileService {
	int doUpload(FileVO fileVO);
	
	int doUploadTitle(FileVO fileVO);
	
	public List<FileVO> doSelectList(FileVO fileVO);
	
	public FileVO doSelectOne(FileVO fileVO);
}
