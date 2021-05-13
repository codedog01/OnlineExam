package com.exam.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.exam.enmus.SysConfigKey;
import com.exam.exception.UploadFileNotFoundException;
import com.exam.service.QuestionService;
import com.exam.service.SysConfigService;
import com.exam.service.UserService;
import com.exam.util.CoreConst;
import com.exam.util.MD5;
import com.exam.util.QCloudUtil;
//import com.exam.util.QiNiuYunUtil;
import com.exam.util.ResultUtil;
import com.exam.vo.CloudStorageConfigVo;
import com.exam.vo.UploadResponse;
import com.exam.vo.base.ResponseVo;
import com.google.gson.Gson;


@Controller
@RequestMapping("/upload")
public class UploadController{
    private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private UserService userService;

    //腾讯云对象存储
    @ResponseBody
    @PostMapping(value = "/upload")
    public UploadResponse upload(@RequestParam(value = "file", required = false) MultipartFile file) throws Exception {
        if(file == null || file.isEmpty()) {
            throw new UploadFileNotFoundException(UploadResponse.Error.FILENOTFOUND);
        }
        try {
            String originalFileName = file.getOriginalFilename();
            String suffix = originalFileName.substring(originalFileName.lastIndexOf(".")).toLowerCase();
            String value = sysConfigService.selectAll().get(SysConfigKey.CLOUD_STORAGE_CONFIG.getValue());
            Gson gson = new Gson();
            CloudStorageConfigVo cloudStorageConfig = gson.fromJson(value, CloudStorageConfigVo.class);
            String dir = cloudStorageConfig.getQcloudPrefix();
            String md5 = MD5.getMessageDigest(file.getBytes());
            String filePath = String.format("%1$s/%2$s%3$s", dir, md5, suffix);
            ResponseVo responseVo = QCloudUtil.writeFile(cloudStorageConfig, filePath, file);
            String qCloudDomain = cloudStorageConfig.getQcloudDomain();
            String url = String.format("%1$s/%2$s", qCloudDomain, filePath);
            if(responseVo.getStatus().equals(CoreConst.SUCCESS_CODE)){
                return  new UploadResponse(url,originalFileName, suffix, url, CoreConst.SUCCESS_CODE);
            }else{
                return  new UploadResponse(originalFileName,  CoreConst.FAIL_CODE,responseVo.getMsg());
            }
        } catch (Exception e) {
            logger.error(String.format("UploadController.upload%s", e));
            throw e;
        }
    }
    //上传到七牛云图床
    /*@ResponseBody
    @PostMapping(value = "/upload")
    public UploadResponse upload(@RequestParam(value = "file", required = false) MultipartFile file) throws Exception{
        if (file == null || file.isEmpty()) {
            throw new UploadFileNotFoundException(UploadResponse.Error.FILENOTFOUND);
        }
        try {
            String originalFilename = file.getOriginalFilename();
            String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
            String value = sysConfigService.selectAll().get(SysConfigKey.CLOUD_STORAGE_CONFIG.getValue());
            Gson gson = new Gson();
            CloudStorageConfigVo cloudStorageConfig = gson.fromJson(value,CloudStorageConfigVo.class);
            String dir =cloudStorageConfig.getQiniuPrefix();
            String md5 = MD5.getMessageDigest(file.getBytes());
            String filePath = String.format("%1$s/%2$s%3$s", dir, md5, suffix);
            ResponseVo responseVo = QiNiuYunUtil.writeFile(cloudStorageConfig,filePath,file.getBytes());
            String qiniuDomain = cloudStorageConfig.getQiniuDomain();
            String url = String.format("%1$s/%2$s", qiniuDomain, filePath);
            if(responseVo.getStatus().equals(CoreConst.SUCCESS_CODE)){
                return  new UploadResponse(url,originalFilename, suffix, url, CoreConst.SUCCESS_CODE);
            }else{
                return  new UploadResponse(originalFilename,  CoreConst.FAIL_CODE,responseVo.getMsg());
            }
        } catch (Exception e) {
            logger.error(String.format("UploadController.upload%s", e));
            throw e;
        }
    }*/

    @ResponseBody
    @PostMapping(value = "/importExcel")
    public UploadResponse importExcel(@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new UploadFileNotFoundException(UploadResponse.Error.FILENOTFOUND);
        }
        try {
            ResponseVo responseVo = questionService.importExcel(file);
            String originalFilename = file.getOriginalFilename();
            String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
            String md5 = MD5.getMessageDigest(file.getBytes());
            String url = String.format("%1$s/%2$s", md5, suffix);
            if(responseVo.getStatus().equals(CoreConst.SUCCESS_CODE)){
                return  new UploadResponse(originalFilename, suffix, url, CoreConst.SUCCESS_CODE, responseVo.getMsg());
            }else {
                return  new UploadResponse(originalFilename, CoreConst.FAIL_CODE,responseVo.getMsg());
            }
        } catch (Exception e) {
            logger.error(String.format("UploadController.upload%s", e));
            throw e;
        }
    }

    @ResponseBody
    @PostMapping(value = "/importUserExcel")
    public UploadResponse importUserExcel(@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new UploadFileNotFoundException(UploadResponse.Error.FILENOTFOUND);
        }
        try {
            ResponseVo responseVo = userService.importUserExcel(file);
            String originalFilename = file.getOriginalFilename();
            String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
            String md5 = MD5.getMessageDigest(file.getBytes());
            String url = String.format("%1$s/%2$s", md5, suffix);
            if(responseVo.getStatus().equals(CoreConst.SUCCESS_CODE)){
                return  new UploadResponse(originalFilename, suffix, url, CoreConst.SUCCESS_CODE, responseVo.getMsg());
            }else {
                return  new UploadResponse(originalFilename, CoreConst.FAIL_CODE,responseVo.getMsg());
            }
        } catch (Exception e) {
            logger.error(String.format("UploadController.upload%s", e));
            throw e;
        }
    }

  /*  @ResponseBody
    @PostMapping("/upload2QiniuForMd")
    public Object upload2QiniuForMd(@RequestParam("file") MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new UploadFileNotFoundException(UploadResponse.Error.FILENOTFOUND);
        }
        try {
            String originalFilename = file.getOriginalFilename();
            String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
            String value = sysConfigService.selectAll().get(SysConfigKey.CLOUD_STORAGE_CONFIG.getValue());
            Gson gson = new Gson();
            CloudStorageConfigVo cloudStorageConfig = gson.fromJson(value,CloudStorageConfigVo.class);
            String dir =cloudStorageConfig.getQiniuPrefix();
            String md5 = MD5.getMessageDigest(file.getBytes());
            String filePath = String.format("%1$s/%2$s%3$s", dir, md5, suffix);
            ResponseVo responseVo = QiNiuYunUtil.writeFile(cloudStorageConfig,filePath,file.getBytes());
            String qiniuDomain = cloudStorageConfig.getQiniuDomain();
            String url = String.format("%1$s/%2$s", qiniuDomain, filePath);
            if(responseVo.getStatus().equals(CoreConst.SUCCESS_CODE)){
                Map<String, Object> resultMap = new HashMap<>(3);
                resultMap.put("success", 1);
                resultMap.put("message", "上传成功");
                resultMap.put("filename", url);
                return resultMap;
            }else{
                return  new UploadResponse(originalFilename,  CoreConst.FAIL_CODE, responseVo.getMsg());
            }
        } catch (Exception e) {
            logger.error(String.format("UploadController.upload%s", e));
            throw e;
        }
    }
*/
    @GetMapping(value = "/config")
    public String config(Model model){
        String value = sysConfigService.selectAll().get(SysConfigKey.CLOUD_STORAGE_CONFIG.getValue());
        Gson gson = new Gson();
        CloudStorageConfigVo cloudStorageConfig = gson.fromJson(value,CloudStorageConfigVo.class);
        model.addAttribute("cloudStorageConfig",cloudStorageConfig);
        return "upload/config";
    }

    @ResponseBody
    @PostMapping(value = "/saveConfig")
    public ResponseVo saveConfig(CloudStorageConfigVo cloudStorageConfig){
        Gson gson = new Gson();
        String value = gson.toJson(cloudStorageConfig);
        int a = sysConfigService.updateByKey(SysConfigKey.CLOUD_STORAGE_CONFIG.getValue(),value);
        if (a > 0) {
            return ResultUtil.success("云存储配置保存成功！");
        } else {
            return ResultUtil.error("云存储配置保存失败！");
        }

    }

}
