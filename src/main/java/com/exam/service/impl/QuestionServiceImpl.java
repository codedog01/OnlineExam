package com.exam.service.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.exam.enmus.ResponseStatus;
import com.exam.exception.ExcelException;
import com.exam.mapper.QuestionMapper;
import com.exam.model.Question;
import com.exam.service.QuestionService;
import com.exam.util.ResultUtil;
import com.exam.vo.QuestionConditionVo;
import com.exam.vo.base.ResponseVo;
import com.github.pagehelper.util.StringUtil;

@Service
public class QuestionServiceImpl extends BaseServiceImpl<Question> implements QuestionService {
	
	private final static String XLS = "xls";
	private final static String XLSX = "xlsx";
	
	@Autowired
	private QuestionMapper questionMapper;
	
	@Override
	public List<Question> findByCondition(QuestionConditionVo vo) {
		List<Question> list = questionMapper.findByCondition(vo);
		return list;
	}
	
	@Override
	public Question selectById(Integer id) {
		return questionMapper.selectById(id);
	}

	@Override
	public Question insertQuestion(Question question) {
		Date date = new Date();
		question.setCreateTime(date);
		question.setUpdateTime(date);
		questionMapper.insertSelective(question);
		return question;
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return questionMapper.deleteBatch(ids);
	}

	@Override
	public int totalNum() {
		int totalNum = questionMapper.countNum();
		return totalNum;
	}

	@Override
	public ResponseVo importExcel(MultipartFile file) {
		List<Question> questions = new ArrayList<>();
		Workbook workbook = null;
		//???????????????
		String fileName = file.getOriginalFilename();
		if(fileName.endsWith(XLS)) {
			try {
				workbook = new HSSFWorkbook(file.getInputStream()); //2003??????
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(fileName.endsWith(XLSX)) {
			try {
				workbook = new XSSFWorkbook(file.getInputStream()); //2007??????
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			new ExcelException(ResponseStatus.FILE_IS_NOT_EXCEL); //????????????Excel??????
		}
		
		Sheet sheet = workbook.getSheet("sheet1");
		int rows = sheet.getLastRowNum();
		if(rows == 0) {
			new ExcelException(ResponseStatus.DATA_IS_NULL); //??????????????????????????????
		}
		
		for(int i = 1; i <= rows+1; i++) {
			Row row = sheet.getRow(i);
			if(row != null) {
				Question question = new Question();
				//????????????
				String title = getCellValue(row.getCell(0));
				question.setTitle(title);
				//????????????
				String content = getCellValue(row.getCell(1));
				question.setContent(content);
				//????????????
				String questionType = getCellValue(row.getCell(2));
				if(!StringUtil.isEmpty(questionType)) {
					Integer new_type = Integer.parseInt(questionType);
					question.setQuestionType(new_type);
				}
				//??????A
				String option_a = getCellValue(row.getCell(3));
				question.setOptionA(option_a);
				//??????B
				String option_b = getCellValue(row.getCell(4));
				question.setOptionB(option_b);
				//??????C
				String option_c = getCellValue(row.getCell(5));
				question.setOptionC(option_c);
				//??????D
				String option_d = getCellValue(row.getCell(6));
				question.setOptionD(option_d);
				//??????
				String answer = getCellValue(row.getCell(7));
				question.setAnswer(answer);
				//??????
				String parse = getCellValue(row.getCell(8));
				question.setParse(parse);
				//??????
				String score = getCellValue(row.getCell(9));
				if(!StringUtil.isEmpty(score)) {
					Integer new_score = Integer.parseInt(score);
					question.setScore(new_score);
				}
				//????????????
				String difficulty = getCellValue(row.getCell(10));
				if(!StringUtil.isEmpty(difficulty)) {
					Integer new_difficulty = Integer.parseInt(difficulty);
					question.setDifficulty(new_difficulty);
				}
				//??????ID
				String subject_id = getCellValue(row.getCell(11));
				if(!StringUtil.isEmpty(subject_id)) {
					Integer new_subject_id = Integer.parseInt(subject_id);
					question.setSubjectId(new_subject_id);
				}
				//??????
				String status = getCellValue(row.getCell(12));
				if(!StringUtil.isEmpty(status)) {
					Integer new_status = Integer.parseInt(status);
					question.setStatus(new_status);
				}
				questions.add(question);
			}
		}
		int i = questionMapper.batchInsert(questions); //????????????
		if(i > 0) {
			return ResultUtil.success("????????????"+ rows + "?????????");
		}else {
			return ResultUtil.error("????????????");
		}
	}
	
	public String getCellValue(Cell cell) {
        String value = "";
        if (cell != null) {
            switch(cell.getCellType()){
                case HSSFCell.CELL_TYPE_NUMERIC:// ??????
                     value = cell.getNumericCellValue()+ " ";
                    if(HSSFDateUtil.isCellDateFormatted(cell)){
                        Date date = cell.getDateCellValue();
                        if(date != null){
                            value = new SimpleDateFormat("yyyy-MM-dd").format(date); //  ???????????????
                        }else{
                           value = "";
                        }
                    }else {
                        //  ??????cell?????? ?????????????????????double????????? ?????????????????????????????? ???????????????
                        value = new DecimalFormat("0").format(cell.getNumericCellValue());
                    }
                    break;
                case HSSFCell.CELL_TYPE_STRING: //  ?????????
                    value = cell.getStringCellValue();
                    break;
                case HSSFCell.CELL_TYPE_BOOLEAN:   //  Boolean??????
                    value = cell.getBooleanCellValue()+"";
                    break;
                case HSSFCell.CELL_TYPE_BLANK:   // ??????
                    value = "";
                    break;
                case HSSFCell.CELL_TYPE_ERROR: // ????????????
                    value ="????????????";
                    break;
                default:
                    value = "????????????";
                    break;
            }
 
        }
        return value.trim();
    }

	@Override
	public int countBySubjectId(Integer subjectId) {
		return questionMapper.countBySubjectId(subjectId);
	}
}
