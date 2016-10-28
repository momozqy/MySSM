package com.xiaoyu.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.xiaoyu.mapper.PersonMapper;
import com.xiaoyu.model.Person;
import com.xiaoyu.service.HelloService;

@RestController
public class HelloServiceImp implements HelloService {
	@Autowired
	PersonMapper personMapper;

	@RequestMapping(value = "/user/", method = RequestMethod.GET)
	public ResponseEntity<List<Person>> listAllPerson() {

		return null;
	}

	@Override
	public boolean checkUser(Person p) {

		return false;
	}
}
