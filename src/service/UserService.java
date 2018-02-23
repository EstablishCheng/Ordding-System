package service;

import java.util.List;

import dao.UserDao;
import entity.Shop;
import entity.User;

public class UserService {
	private UserDao userDao = new UserDao();
	User user = new User();
	
	public User userLogin(String username) throws Exception{
		return userDao.userLogin(username);
	}

	public int insertUser(String username, String password, String tel, String address, String email) throws Exception {
		user.setName(username);
		user.setPassword(password);
		user.setTel(tel);
		user.setAddress(address);
		user.setEmail(email);
		return userDao.insertUser(user);
	}

	public User loginUSer(String userName, String password) throws Exception {
		return userDao.loginUSer(userName, password);
	}

	public List<Shop> shopList() throws Exception {
		return userDao.shopList();
	}

	public int delUser(String userid) throws Exception {
		return userDao.delUser(userid);
	}
	
}
