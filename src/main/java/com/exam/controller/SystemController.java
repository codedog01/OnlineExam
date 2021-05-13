package com.exam.controller;

import java.io.Serializable;
import java.util.Deque;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.exam.service.impl.UserServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.subject.Subject;
import org.crazycake.shiro.RedisCacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.model.Permission;
import com.exam.model.User;
import com.exam.service.PermissionService;
import com.exam.service.UserService;
import com.exam.util.ResultUtil;
import com.exam.vo.base.ResponseVo;
import com.google.code.kaptcha.Constants;


@Controller
public class SystemController{
    @Autowired
    private UserService userService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private RedisCacheManager redisCacheManager;

    /*登录*/
    @GetMapping("/login")
    public String login(Model model){
        if(SecurityUtils.getSubject().isAuthenticated()){
            return "redirect:/";
        }
        return "system/login";
    }

    /*提交登录*/
    @PostMapping("/login")
    @ResponseBody
    public ResponseVo login(HttpServletRequest request, String username, String password, String verification,
                            @RequestParam(value = "rememberMe", defaultValue = "0") Integer rememberMe){
        //判断验证码
        String rightCode = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (StringUtils.isNotBlank(verification) && StringUtils.isNotBlank(rightCode) && verification.equals(rightCode)) {
            //验证码通过
        } else {
            return ResultUtil.error("验证码错误！");
        }
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        try{
            token.setRememberMe(1 == rememberMe);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
        } catch (LockedAccountException e) {
            token.clear();
            return ResultUtil.error("用户已经被锁定不能登录，请联系管理员！");
        } catch (AuthenticationException e) {
            token.clear();
            return ResultUtil.error("用户名或者密码错误！");
        }
        //更新最后登录时间
        userService.updateLastLoginTime((User) SecurityUtils.getSubject().getPrincipal());
        //存储当前登录的用户名
        HttpSession session = request.getSession();
        session.setAttribute("userinf",username);
        return ResultUtil.success("登录成功！");
    }

    /*登出*/
    @RequestMapping(value = "/logout")
    @ResponseBody
    public ResponseVo logout() {
        Subject subject = SecurityUtils.getSubject();
        if(null!=subject){
            String username = ((User) SecurityUtils.getSubject().getPrincipal()).getUsername();
            Serializable sessionId = SecurityUtils.getSubject().getSession().getId();
            Cache<String, Deque<Serializable>> cache = redisCacheManager.getCache(redisCacheManager.getKeyPrefix()+username);
            Deque<Serializable> deques = cache.get(username);
            for(Serializable deque : deques){
                if(sessionId.equals(deque)){
                    deques.remove(deque);
                    break;
                }
            }
            cache.put(username,deques);
        }
        subject.logout();
        return ResultUtil.success("退出成功");
    }

    /*获取当前登录用户的菜单*/
    @PostMapping("/menu")
    @ResponseBody
    public List<Permission> getMenus(){
        List<Permission> permissionListList = permissionService.selectMenuByUserId(((User) SecurityUtils.getSubject().getPrincipal()).getUserId());
        return permissionListList;
    }

}
