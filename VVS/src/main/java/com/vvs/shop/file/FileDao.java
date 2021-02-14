package com.vvs.shop.file;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vvs.shop.member.MemberDao;

@Repository("FileDao")
public class FileDao {
final Logger LOG = LoggerFactory.getLogger(MemberDao.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	final String NAMESPACE = "com.vvs.shop.file.";
	
	public FileDao() {
		
	}
	public int doUpload(FileVO fileVO) {
		 LOG.debug("====================");
		 LOG.debug("==doUpload==");
		 LOG.debug("====================");
		 
		 String statement = NAMESPACE + "doUpload";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==fileVO=="+fileVO);
		 
		 int flag = sqlSessionTemplate.insert(statement, fileVO);
		 LOG.debug("flag"+flag);
		 
		 return flag;
	}
}
