package com.majon.spring.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.majon.spring.lesson04.bo.NewUserBO;

@Controller
@RequestMapping("/lesson06")
public class Lesson06NewUserController {

	@Autowired
	private NewUserBO newUserBO;

	@GetMapping("/add_user_view")
	public String addUserView() {

		return "lesson06/addNewUser";

	}

	@PostMapping("/add_user")
	@ResponseBody
	public Map<String, String> addUser(
			@RequestParam("name") String name
			,@RequestParam("yyyymmdd") String yyyymmdd
			,@RequestParam("email") String email
			,@RequestParam("introduce") String introduce
			) {

		int count = newUserBO.addUser(name, yyyymmdd, introduce, email);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result","fail");
		}
		
		return result;
		
		
	}
	
	//파라미터로 전달된 name값이 DB에 이미 등록 되어 있는지 여부 확인
	@GetMapping("/is_duplication")
	@ResponseBody
	public Map<String,Boolean>isDuplication(
			@RequestParam("name") String name){
		
		Map<String,Boolean> result = new HashMap<>();
		
		if(newUserBO.isDuplicate(name)) {
			result.put("isDuplicate", true);
		}else {
			result.put("isDuplicate", false);
		}
		return result;
		
	}

}
