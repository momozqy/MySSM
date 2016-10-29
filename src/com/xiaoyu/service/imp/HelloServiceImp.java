package com.xiaoyu.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xiaoyu.mapper.PersonMapper;
import com.xiaoyu.model.Person;
import com.xiaoyu.service.HelloService;

@RestController
public class HelloServiceImp implements HelloService {
	PersonMapper personMapper;

	public PersonMapper getPersonMapper() {
		return personMapper;
	}

	public void setPersonMapper(PersonMapper personMapper) {
		this.personMapper = personMapper;
	}

	@RequestMapping(value = "/hello", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String hello() {
		return "你好！hello";
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<Person> listAllPerson() {
		Person p = personMapper.selectUserById(1);
		System.out.println(p.getUsername());
		return new ResponseEntity<Person>(p, HttpStatus.OK);
	}

	@Override
	public boolean checkUser(Person p) {

		return false;
	}
}
