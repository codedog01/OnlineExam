package com.exam.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.model.Classes;
import com.exam.model.Comment;
import com.exam.model.Examination;
import com.exam.model.Grade;
import com.exam.model.Love;
import com.exam.model.Question;
import com.exam.model.Subject;
import com.exam.model.User;
import com.exam.service.ClassesService;
import com.exam.service.CommentService;
import com.exam.service.ExaminationService;
import com.exam.service.GradeService;
import com.exam.service.LoveService;
import com.exam.service.QuestionService;
import com.exam.service.SubjectService;
import com.exam.service.UserService;
import com.exam.shiro.ShiroRealm;
import com.exam.util.CopyUtil;
import com.exam.util.CoreConst;
import com.exam.util.IpUtil;
import com.exam.util.PasswordHelper;
import com.exam.util.ResultUtil;
import com.exam.util.XssKillerUtil;
import com.exam.vo.ChangePasswordVo;
import com.exam.vo.CommentConditionVo;
import com.exam.vo.GradeConditionVo;
import com.exam.vo.LoveConditionVo;
import com.exam.vo.UserConditionVo;
import com.exam.vo.base.ResponseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ExamWebController {
	
	@Autowired
	private ExaminationService examService;
	@Autowired
	private GradeService gradeService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private LoveService loveService;
	@Autowired
	private UserService userService;
	@Autowired
    private ClassesService classesService;
	@Autowired
    private ShiroRealm shiroRealm;
	

	/**
	 * ????????????
	 * @return
	 */

	@GetMapping("/exam/examination")
	public String toExam() {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "index/examination";
		}else {
			return "redirect:/login";
		}
	}
	
	/**
	 * ??????????????????
	 * @param model
	 * @return
	 */
	
	@GetMapping("/exam/questions")
	public String toQuestion(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			Subject subject = new Subject();
			List<Subject> subjects = subjectService.select(subject);
			for(Subject s : subjects) {
				int num = questionService.countBySubjectId(s.getId());
				s.setNums(num);
			}
			model.addAttribute("subjects", subjects);
			return "index/question";
		}else {
			return "redirect:/login";
		}
	}
	
	/**
	 * ????????????
	 * @return
	 */
	@GetMapping("/exam/queryScore")
	public String queryScore(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			List<Examination> examList = examService.selectAllByStatus(CoreConst.EXAM_END);
			model.addAttribute("exams", examList);
			return "index/queryScore";
		}else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/exam/queryScore")
	@ResponseBody
	public ResponseVo queryScore(GradeConditionVo vo) {
		if(vo.getExamId() == null) {
			return ResultUtil.error("?????????????????????????????????");
		}
		if(vo.getStuId() == "") {
			return ResultUtil.error("???????????????");
		}
		if(vo.getName() == "") {
			return ResultUtil.error("???????????????");
		}
		UserConditionVo userConditionVo = new UserConditionVo();
		userConditionVo.setUsername(vo.getStuId());
		userConditionVo.setNickname(vo.getName());
		List<User> users = userService.findByCondition(userConditionVo);
		if(users.isEmpty()) {
			return ResultUtil.error("??????????????????????????????????????????");
		}
		vo.setStatus(CoreConst.STATUS_VALID);
		List<Grade> grades = gradeService.findByCondition(vo);
		if(grades != null && !grades.isEmpty()) {
			return ResultUtil.success("????????????", grades);
		}else {
			return ResultUtil.error("???????????????????????????????????????????????????????????????");
		}
		
	}
	
	/**
	 * ?????????
	 * @return
	 */
	@GetMapping("/exam/comment")
	public String toComment() {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "index/comment";
		}else {
			return "redirect:/login";
		}
		
	}
	@PostMapping("/exam/comment")
	@ResponseBody
	public PageInfo<Comment> getComments(CommentConditionVo vo){
		PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
		List<Comment> comments = commentService.selectComments(vo);
		PageInfo<Comment> pages = new PageInfo<>(comments);
		return pages;
	}
	
	@PostMapping("/exam/comment/save")
	@ResponseBody
	public ResponseVo saveComment(HttpServletRequest request, Comment comment) throws UnsupportedEncodingException{
		String content = comment.getContent();
		if(!XssKillerUtil.isValid(content)) {
			return ResultUtil.error("???????????????");
		}
		content = XssKillerUtil.clean(content.trim()).replaceAll("(<p><br></P>)|(<p></p>)", "");
		Date date = new Date();
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		comment.setUserId(user.getUserId());
		comment.setUsername(user.getUsername());
		comment.setNickname(user.getNickname());
		comment.setAvatar(user.getImg());
		comment.setEmail(user.getEmail());
		comment.setContent(content);
		comment.setIp(IpUtil.getIpAddr(request));
		comment.setCreateTime(date);
		comment.setUpdateTime(date);
		int i = commentService.insertSelective(comment);
		if(i > 0) {
			return ResultUtil.success("??????????????????????????????????????????");
		}else {
			return ResultUtil.error("??????????????????");
		}
	}
	
	/**
	 * ??????
	 * @param request
	 * @param vo
	 * @param supId
	 * @param loveType
	 * @return
	 */
	@PostMapping("/exam/love")
	@ResponseBody
    public ResponseVo love(HttpServletRequest request, LoveConditionVo vo, Integer supId,Integer loveType) {
    	Date date = new Date();
    	String ip = IpUtil.getIpAddr(request);
    	User user = (User)SecurityUtils.getSubject().getPrincipal();
    	vo.setSupId(supId);
    	vo.setLoveType(loveType);
    	vo.setUserId(user.getUserId());
    	vo.setUserIp(ip);
    	Love loves = loveService.findByCondition(vo);
    	if(loves == null) {
    		Love love = new Love();
    		love.setSupId(supId);
    		love.setLoveType(loveType);
    		love.setUserId(user.getUserId());
			love.setUserIp(ip);
			love.setCreateTime(date);
    		love.setUpdateTime(date);
    		loveService.insert(love);
    		return ResultUtil.success("????????????");
    	}else {
    		return ResultUtil.error("?????????????????????");
		}
    }
	
	/**
	 * ????????????
	 * @param model
	 * @param userId
	 * @return
	 */
	@GetMapping("/exam/personInfo")
	public String personal(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			User user = (User)SecurityUtils.getSubject().getPrincipal();
			List<Classes> classes = classesService.selectAll();
			User userInfo = userService.selectByUserId(user.getUserId());
			model.addAttribute("classes", classes);
			model.addAttribute("user", userInfo);
			return "index/personInfo";
		}else {
			return "redirect:/login";
		}
	}
	
	/**??????????????????*/
    @PostMapping("/exam/updatePersonal")
    @ResponseBody
    public ResponseVo updatePersonal(User user){
        int a = userService.updateByUserId(user);
        if(a > 0) {
        	return ResultUtil.success("????????????????????????");
        }else {
        	return ResultUtil.error("????????????????????????");
        }
    }
    
    /**
     * ????????????
     * @param changePasswordVo
     * @return
     */
    @PostMapping("/exam/changePassword")
    @ResponseBody
    public ResponseVo changePassword(ChangePasswordVo changePasswordVo) {
    	if(!changePasswordVo.getNewPassword().equals(changePasswordVo.getConfirmNewPassword())) {
    		return ResultUtil.error("???????????????????????????");
    	}
    	User loginUser = userService.selectByUserId(((User) SecurityUtils.getSubject().getPrincipal()).getUserId());
    	User newUser = CopyUtil.getCopy(loginUser, User.class);
    	String sysOldPassword = loginUser.getPassword();
    	newUser.setPassword(changePasswordVo.getOldPassword());
    	String entryOldPassword = PasswordHelper.getPassword(newUser);
    	if(sysOldPassword.equals(entryOldPassword)) {
    		newUser.setPassword(changePasswordVo.getNewPassword());
    		PasswordHelper.encryptPassword(newUser);
    		userService.updateUserByPrimaryKey(newUser);
    		//*??????????????????*//
    		List<String> userIds = new ArrayList<>();
    		userIds.add(loginUser.getUserId());
    		shiroRealm.removeCachedAuthenticationInfo(userIds);
    	}else {
    		return ResultUtil.error("???????????????????????????");
    	}
    	return ResultUtil.success("??????????????????,?????????????????????");
    }
	/**
	 * ????????????
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/exam/startexam")
	public String startToExam(Model model, Integer id) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Examination examination = examService.queryByExamId(id);
		Map<String, Object> data = new HashMap<>();
		data.put("exam", examination);
		model.addAttribute("data", data);
		model.addAttribute("user", user);
		return "index/detail";
	}
	
	/**
	 * ??????????????????????????????????????????
	 * @param id
	 * @return
	 */
	@PostMapping("/exam/validate")
	@ResponseBody
	public ResponseVo validate(Integer id) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Grade grade  = gradeService.validateExam(id,user.getUserId());
		if(grade != null) {
			return ResultUtil.error("?????????????????????????????????,?????????????????????????????????????????????????????????????????????");
		}else {
			return ResultUtil.success("??????????????????????????????????????????????????????????????????????????????????????????????????????");
		}
	}
	
	/**
	 * ????????????
	 * @param grade
	 * @return
	 */
	@PostMapping("/exam/submitExam")
	@ResponseBody
	public ResponseVo submitExam(@RequestBody Grade grade) {
		try {
			User user = (User)SecurityUtils.getSubject().getPrincipal();
			List<String> answerStr = Arrays.asList(grade.getAnswerJson().split("~_~"));
			int autoResult = 0;
			StringBuffer autoStr = new StringBuffer();
			StringBuffer manulStr = new StringBuffer();
			Examination examination = examService.queryByExamId(grade.getExamId());
			List<Question> questions = examination.getQuestions();
			for(int i = 0; i < questions.size(); i++) {
				Question question = questions.get(i);
				if(question.getQuestionType() <= 1) {
					autoStr.append(answerStr.get(i)+"~_~");
				}else {
					manulStr.append(answerStr.get(i)+"~_~");
				}
				if(question.getQuestionType() <= 1 && question.getAnswer().equals(answerStr.get(i))) {
					autoResult += question.getScore();
				}
			}
			String autoJson = new String(autoStr);
			String manulJson = new String(manulStr);
			grade.setUserId(user.getUserId());
			grade.setAutoResult(autoResult);
			grade.setResult(autoResult);
			grade.setAutoJson(autoJson);
			grade.setManulJson(manulJson);
			grade.setManulResult(0);
			grade.setStatus(CoreConst.STATUS_INVALID);
			Date date = new Date();
			grade.setCreateTime(date);
			grade.setUpdateTime(date);
			gradeService.insertSelective(grade);
			return ResultUtil.success("?????????????????????");
		} catch (Exception e) {
			return ResultUtil.error("?????????????????????????????????????????????");
		}
	}
}
