package com.jscms.admin.obj;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

import com.jscms.frame.JSUtils;

public class SystemInfo {
	private Properties pp;
	private String siteUrl;
	private String siteName;
	private String indexKey;
	private String indexDes;
	private String defaltTemple;
	private String gzip;
	private String debug;
	private String exceptLog;
	
	private String cahceHost;
	private String cacheUser;
	private String cachePass;
	private String cacheTTL;
	private String cached;
	
	private String smtpHost;
	private String email;
	private String emailPass;
	private String emailName;
	
	private String uploadDir;
	private String uploadTmpDir;
	private String uploadMaxSize;
	private String isUploadLog;
	private String uploadLogPath;
	
	
	public SystemInfo(){
		pp = new Properties();
		try {
			File file = new File("sys.properties");
			if(!file.exists()){
				file.createNewFile();
			}
			pp.load(new FileReader("sys.properties"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	public String getUploadDir() {
		return pp.getProperty("uploadDir");
	}



	public void setUploadDir(String uploadDir) {
		pp.setProperty("uploadDir", uploadDir);
	}



	public String getUploadTmpDir() {
		return pp.getProperty("uploadTmpDir");
	}



	public void setUploadTmpDir(String uploadTmpDir) {
		pp.setProperty("uploadTmpDir", uploadTmpDir);
	}



	public String getUploadMaxSize() {
		return pp.getProperty("uploadMaxSize");
	}



	public void setUploadMaxSize(String uploadMaxSize) {
		pp.setProperty("uploadMaxSize", uploadMaxSize);
	}



	public String getIsUploadLog() {
		return pp.getProperty("isUploadLog");
	}



	public void setIsUploadLog(String isUploadLog) {
		pp.setProperty("isUploadLog", isUploadLog);
	}



	public String getUploadLogPath() {
		return pp.getProperty("uploadLogPath");
	}



	public void setUploadLogPath(String uploadLogPath) {
		pp.setProperty("uploadLogPath", uploadLogPath);
	}



	public String getSiteUrl() {
		
		return pp.getProperty("siteUrl");
	}

	public void setSiteUrl(String siteUrl) {
		pp.setProperty("siteUrl", siteUrl);
	}

	public String getSiteName() {
		return pp.getProperty("siteName");
	}

	public void setSiteName(String siteName) {
		pp.setProperty("siteName", siteName);
	}

	public String getIndexKey() {
		
		return pp.getProperty("indexKey");
	}

	public void setIndexKey(String indexKey) {
		pp.setProperty("indexKey", indexKey);
	}

	public String getIndexDes() {
		return pp.getProperty("indexDes");
	}

	public void setIndexDes(String indexDes) {
		pp.setProperty("indexDes", indexDes);
	}

	public String getDefaltTemple() {
		return pp.getProperty("defaltTemple");
	}

	public void setDefaltTemple(String defaltTemple) {
		pp.setProperty("defaltTemple", defaltTemple);
	}

	public String getGzip() {
		return pp.getProperty("gzip");
	}

	public void setGzip(String gzip) {
		pp.setProperty("gzip", gzip);
	}

	public String getDebug() {
		return pp.getProperty("debug");
	}

	public void setDebug(String debug) {
		pp.setProperty("debug", debug);
	}

	public String getExceptLog() {
		return pp.getProperty("exceptLog");
	}

	public void setExceptLog(String exceptLog) {
		pp.setProperty("exceptLog", exceptLog);
	}

	public String getCahceHost() {
		return pp.getProperty("cahceHost");
	}

	public void setCahceHost(String cahceHost) {
		pp.setProperty("cahceHost", cahceHost);
	}

	public String getCacheUser() {
		return pp.getProperty("cacheUser");
	}

	public void setCacheUser(String cacheUser) {
		pp.setProperty("cacheUser", cacheUser);
	}

	public String getCachePass() {
		return pp.getProperty("cachePass");
	}

	public void setCachePass(String cachePass) {
		pp.setProperty("cachePass", cachePass);
	}

	public String getCacheTTL() {
		return pp.getProperty("cacheTTL");
	}

	public void setCacheTTL(String cacheTTL) {
		pp.setProperty("cacheTTL", cacheTTL);
	}

	public String getCached() {
		return pp.getProperty("cached");
	}

	public void setCached(String cached) {
		pp.setProperty("cached", cached);
	}

	public String getSmtpHost() {
		return pp.getProperty("smtpHost");
	}

	public void setSmtpHost(String smtpHost) {
		pp.setProperty("smtpHost", smtpHost);
	}

	public String getEmail() {
		return pp.getProperty("email");
	}

	public void setEmail(String email) {
		pp.setProperty("email", email);
	}

	public String getEmailPass() {
		return pp.getProperty("emailPass");
	}

	public void setEmailPass(String emailPass) {
		pp.setProperty("emailPass", emailPass);
	}

	public String getEmailName() {
		return pp.getProperty("emailName");
	}

	public void setEmailName(String emailName) {
		pp.setProperty("emailName", emailName);
	}
	
	public void store(){
		try {
			pp.store(new FileWriter("sys.properties"), null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
