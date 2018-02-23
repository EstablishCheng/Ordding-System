package service;

import java.util.List;

import dao.AdminDao;
import entity.Admin;
import entity.Shop;
import entity.User;

public class AdminService {
	private AdminDao adminDao = new AdminDao();
	
	public Admin loginAdmin(String username,String password) throws Exception{
		return adminDao.loginAdmin(username, password);
	}

	public List<User> listUser() throws Exception {
		return adminDao.listUser();
	}

	public List<Shop> listShop() throws Exception {
		// TODO 自动生成的方法存根
		return adminDao.listShop();
	}
}
