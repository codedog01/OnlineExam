package com.exam.vo.base;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;
public abstract class BaseVo implements Serializable {
	
    private static final long serialVersionUID = 1L;

    @Id
    //此种主键生成策略就是通常所说的主键自增长,数据库在插入数据时,
    //会自动给主键赋值,比如MYSQL可以在创建表时声明"auto_increment" 来指定主键自增长。
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Date createTime;
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}