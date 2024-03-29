package com.majon.spring.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson04.dao.NewUserDAO;
import com.majon.spring.lesson04.model.NewUser;

@Service
public class NewUserBO {
	
	@Autowired
	private NewUserDAO newUserDAO;
	
	public int addUser(String name, String yyyymmdd, String introduce, String email) {
		
		return newUserDAO.insertUser(name, yyyymmdd, introduce, email);
		
	}
	
	public NewUser getLastUser() {
		return newUserDAO.selectLastUser();
	}
	
	// 중복인지 아닌지?
	public boolean isDuplicate(String name) {
	
		int count = newUserDAO.selectCountByName(name);
		
		if(count>=1) {
			return true;
		}else {
			return false;
		}
		
		// return (count>=1);
	}

}
