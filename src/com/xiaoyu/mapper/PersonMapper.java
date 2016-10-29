package com.xiaoyu.mapper;

import com.xiaoyu.model.Person;

public abstract interface PersonMapper {
	public abstract Person selectUserById(int id);
}
