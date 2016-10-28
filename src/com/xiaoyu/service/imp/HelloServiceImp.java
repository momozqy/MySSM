package com.xiaoyu.service.imp;

import com.xiaoyu.mapper.PersonMapper;
import com.xiaoyu.model.Person;
import com.xiaoyu.service.HelloService;

public class HelloServiceImp implements HelloService {
	private PersonMapper personMapper;

	@Override
	public boolean checkUser(Person p) {

		return false;
	}

	public PersonMapper getPersonMapper() {
		return personMapper;
	}

	public void setPersonMapper(PersonMapper personMapper) {
		this.personMapper = personMapper;
	}
}
