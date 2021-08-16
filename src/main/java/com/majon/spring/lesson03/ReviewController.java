package com.majon.spring.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.majon.spring.lesson03.bo.ReviewBO;
import com.majon.spring.lesson03.model.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewBO reviewBO;
	
	@RequestMapping("/lesson03/ex01")
	@ResponseBody
	public Review ex01(
			   @RequestParam("id") int id
			// @RequestParam(value ="id", required=true) int id // 필수 파라미터 id
			// @RequestParam(value="id", required=false) Integer id // 비 필수 파라미터 id
			//   @RequestParam(value="id", defaultValue="1") int id 
			) {
		
		return reviewBO.getReview(id);
		
	}

}
