package com.application.controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DownloadController {
	
	@RequestMapping("download")
    public ResponseEntity<byte[]> download(@RequestParam(value="location",required = true)String location) throws IOException {  
        File file=new File(location); 
        String fileNames[] = location.split("/");
        if(file.exists()) {
	        HttpHeaders headers = new HttpHeaders();    
	        String fileName=new String(fileNames[fileNames.length-1].getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
	        headers.setContentDispositionFormData("attachment", fileName);   
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
	        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
	                                          headers, HttpStatus.CREATED);    
        }
        return null;
    }  
}
