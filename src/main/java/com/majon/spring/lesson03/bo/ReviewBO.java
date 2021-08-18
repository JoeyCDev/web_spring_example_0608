package com.majon.spring.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson03.dao.ReviewDAO;
import com.majon.spring.lesson03.model.Review;

@Service
public class ReviewBO {
	@Autowired
	private ReviewDAO reviewDAO;
	
	
	public Review getReview(int id) {
		
		return reviewDAO.selectReview(id);
		
	}
	
	// add review
	// storeId, menu, userName, point, review
			public int addReview(int storeId, String menu, String userName, double point, String review) {
				
				return reviewDAO.insertReview(storeId, menu, userName, point, review);
				
			}
			
			public int addReviewAsObject(Review review) {
				return reviewDAO.insertReviewAsObject(review);
			}
			
			public int updateReviewById(int id, String review) {
				
				return reviewDAO.updateReviewById(id, review);
				
			}
			
			public int deleteReview(int id) {
				
				return reviewDAO.deleteReview(id);
				
			}
	
}