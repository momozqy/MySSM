package com.xiaoyu.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoyu.model.Person;
import com.xiaoyu.service.HelloService;

@Controller
@RequestMapping(value = "/hello")
public class HelloAction {
	@Autowired
	HelloService hello;

	@RequestMapping(value = "/hello", produces = "text/plain;charset=UTF-8")
	public String hello() {
		return "test";
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody Person listAllPerson(@PathVariable("id") int id, ModelMap map) {
		return hello.getPerson(id);
	}
}
