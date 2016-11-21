package com.xiaoyu.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.mappers.PersonMapper;
import com.xiaoyu.model.Person;
import com.xiaoyu.service.HelloService;

@Service
public class HelloServiceImp implements HelloService {
	@Autowired
	PersonMapper personMapper;

	@Override
	public boolean checkUser(Person p) {

		return false;
	}

	@Override
	public Person getPerson(int id) {
		return personMapper.selectByPrimaryKey(id);
	}
}
