package com.exam.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.model.Examination;
import com.exam.util.MapperUtil;
import com.exam.vo.ExaminationConditionVo;

public interface ExaminationMapper extends MapperUtil<Examination> {
	
	/**
	 * 分页查询考试、关联课程
	 * @param vo
	 * @return
	 */
	List<Examination> findByCondition(ExaminationConditionVo vo);

	/**
	 * 统计指定考试的题目集合
	 * @param ids
	 * @return
	 */
	List<Examination> listQuestionsByExamId(List<Integer> ids);

	/**
	 * 根据id查询试卷
	 * @param id
	 * @return
	 */
	Examination ExaminationById(Integer id);
	
	Examination selectById(Integer id);

	int deleteBatch(Integer[] ids);

	int updateExamToStart(@Param("currentTime") Date currentTime);

	int updateExamToEnd(@Param("currentTime") Date currentTime);
	
	List<Examination> selectAllByStatus(Integer status);
	
	List<HashMap<String, Object>> recAddExamSta();

}
