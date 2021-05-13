package com.exam.facerecognition.controller;

import com.exam.facerecognition.faceUtil.GsonUtils;
import com.exam.facerecognition.sevice.FaceService;
import com.exam.model.User;
import com.exam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/login")
@SessionAttributes(value = "useinf")
public class FaceController {
    @Autowired
    FaceService faceService =null;
    @Autowired
    UserService userService;
    @RequestMapping("/searchface")
    @ResponseBody
    public String searchface(@RequestBody @RequestParam(name = "imagebast64") StringBuffer imagebast64,String userName,Model model, HttpServletRequest request) throws IOException {
        Map<String, Object> searchface = faceService.searchface(imagebast64);
        String currentUserName = null;

        if (userName != null) {
            currentUserName = userName;
        }
        if (searchface == null || searchface.get("user_id") == null) {
            System.out.println("我进来了");
            String flag = "fail";
            String s = GsonUtils.toJson(flag);
            return s;
        }
        User user = userService.selectByUsername(currentUserName);

        String user_id = searchface.get("user_id").toString();
        String score = searchface.get("score").toString().substring(0, 2);
        int i = Integer.parseInt(score);
        if (i > 80 && user != null && user_id.equals(user.getFaceId())) {
            /**
             * 人脸识别分数大于80认证通过
             */
//            model.addAttribute("userinf", user_id);
//            HttpSession session = request.getSession();
//            session.setAttribute("userinf", user_id);
//            System.out.println("存入session");
            String s = GsonUtils.toJson(searchface);
            return s;
        } else {
            searchface.put("score","00000");
            String s = GsonUtils.toJson(searchface);
            return s;
        }

    }

}
