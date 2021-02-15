package com.vvs.shop;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UploadPaths {

	@Bean(name="uploadPath")
	public String uploadPath() {
		return "a";
	}
	
	
}
