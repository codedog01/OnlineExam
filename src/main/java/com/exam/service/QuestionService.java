package com.exam.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;

import com.exam.model.Question;
import com.exam.vo.QuestionConditionVo;
import com.exam.vo.base.ResponseVo;

public interface QuestionService extends BaseService<Question> {
	
	/**
	 * 分页查询
	 * @param vo
	 * @return
	 */
	List<Question> findByCondition(QuestionConditionVo vo);
	
	/**
	 * 根据id获取题目
	 * @param id
	 * @return
	 */
	Question selectById(Integer id);
	
	/**
	 * 插入
	 * @param question
	 * @return
	 */
	Question insertQuestion(Question question);
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteBatch(Integer[] ids);

	int totalNum();
	
	/**
	 * 导入Excel表数据
	 * @param questionList
	 */
	ResponseVo importExcel(MultipartFile file);

	
	int countBySubjectId(Integer subjectId);

}
