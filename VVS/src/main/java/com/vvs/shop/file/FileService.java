package com.vvs.shop.file;

import org.springframework.stereotype.Service;

@Service
public interface FileService {
	int doUpload(FileVO fileVO);
}
