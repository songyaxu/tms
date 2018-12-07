package com.application.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.application.constant.Constant;
import com.application.dto.Result;
import com.application.util.TimeUtil;


@RestController
public class UploadController {
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
    public Result upload(HttpSession session, @RequestParam("file") MultipartFile file) {
		Result res = new Result();
		res.setMessage("文件上传失败");
    	res.setCode(0);
    	String time = TimeUtil.getTimeFilePath();
        String path = Constant.FILE_LOCATION+"/"+time+"/";
        String fileName = file.getOriginalFilename();
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        res.setMessage("上传文件成功");
        res.setCode(1);
        res.setData(path+fileName);
        return res;
    }
}
