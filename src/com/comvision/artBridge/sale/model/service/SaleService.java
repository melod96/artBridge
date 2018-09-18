package com.comvision.artBridge.sale.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.comvision.artBridge.sale.model.dao.SaleDao;
import com.comvision.artBridge.sale.model.vo.Options;

public class SaleService {

	//해당 판매글의 옵션
	public ArrayList<HashMap<String, Object>> selectOptionList(int board_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/*public ArrayList<Options> selectOptionList(int board_no) {
		Connection con = getConnection();
		Options o = null;
		
		ArrayList<Options> oplist = new SaleDao().selectOptionList(con,board_no);
		
		close(con);
		return oplist;
	}*/

}
