package com.majon.spring.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson02.dao.UsedGoodsDAO;
import com.majon.spring.lesson02.model.UsedGoods;

@Service
public class UsedGoodsBO {
	@Autowired
	private UsedGoodsDAO usedGoodsDAO;
	
	
	public List<UsedGoods> getUsedGoodsList(){
		return usedGoodsDAO.selectUsedGoodsList();
		
	}
	
}
