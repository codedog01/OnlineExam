package com.exam.mapper;

import java.util.List;

import com.exam.model.Classes;
import com.exam.util.MapperUtil;
import com.exam.vo.ClassesConditionVo;

public interface ClassesMapper extends MapperUtil<Classes> {
	
	/**
	 * 分页查询班级、关联学院
	 * @param vo
	 * @return
	 */
	List<Classes> findByCondition(ClassesConditionVo vo);

	/**
	 * 根据Id查询班级信息
	 * @param id
	 * @return
	 */
	Classes selectById(Integer id);

	/**
	 * 验证班级中是否有学生
	 * @param ids
	 * @return
	 */
	int validateByClassIds(Integer[] ids);

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteBatch(Integer[] ids);

}
