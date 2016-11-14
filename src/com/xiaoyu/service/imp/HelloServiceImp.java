package com.xiaoyu.service.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xiaoyu.mapper.UserMapper;
import com.xiaoyu.model.Person;
import com.xiaoyu.service.HelloService;

@RestController
public class HelloServiceImp implements HelloService {
	@Autowired
	UserMapper userMapper;

	@RequestMapping(value = "/hello", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String hello() {
		return "你好！hello";
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<List<Map>> listAllPerson() {
		Map map = new HashMap();
		List<Map> list = userMapper.selectAll();
		return new ResponseEntity<List<Map>>(list, HttpStatus.OK);
	}

	@Override
	public boolean checkUser(Person p) {

		return false;
	}
}
