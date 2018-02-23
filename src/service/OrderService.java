package service;

import java.util.List;

import dao.OrderDao;
import dao.ShopDao;
import entity.Admin;
import entity.Order;
import entity.Shop;

public class OrderService {
	private ShopDao shopDao = new ShopDao();
	private OrderDao orderDao = new OrderDao();
	
	public Shop loginShop(String username,String password) throws Exception{
		return shopDao.loginShop(username, password);
	}

	public int insertOrder(String foodname, String price, int num,String username,String shopname) throws Exception {

		return orderDao.insertOrder(foodname, price, num,username,shopname);
	}

	public void deleteOrder(String foodname) throws Exception {
		orderDao.deleteOrder(foodname);
	}

	public List<Order> listUserOrder(String username) throws Exception {
		return orderDao.listUserOrder(username);
	}

	public List<Order> listShopOrder(String shopname) throws Exception {
		return orderDao.listShopOrder(shopname);
	}
}
