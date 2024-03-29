package com.majon.spring.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.spring.lesson04.model.NewUser;

@Repository
public interface NewUserDAO {
	
	public int insertUser(
			@Param("name") String name
			,@Param("yyyymmdd") String yyyymmdd
			,@Param("introduce") String introduce
			,@Param("email") String email);
	
	public NewUser selectLastUser();
	
	
	// 쿼리 입장에서의 메소드 -> name을 검색하고 그 결과 갯수를 알아온다.
	public int selectCountByName(@Param("name") String name);
	
}
