package com.vvs.shop.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vvs.shop.member.MemberVO;

@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	FileDao fileDao;
	
	@Override
	public int doUpload(FileVO fileVO) {

		return fileDao.doUpload(fileVO);
	}

	@Override
	public List<FileVO> doSelectList(FileVO fileVO) {
		
		return fileDao.doSelectList(fileVO);
	}

}
