package service;

import java.util.List;

import dao.ShopDao;
import entity.Admin;
import entity.Food;
import entity.Shop;

public class ShopService {
	private ShopDao shopDao = new ShopDao();
	Shop shop = new Shop();
	
	public Shop loginShop(String username,String password) throws Exception{
		return shopDao.loginShop(username, password);
	}

	public Shop shopLogin(String username) throws Exception {
		return shopDao.shopLogin(username);
	}

	public int insertShop(String username, String password, String tel) throws Exception {
		shop.setName(username);
		shop.setPassword(password);
		shop.setTel(tel);
		return shopDao.insertShop(shop);
	}

	public List<Food> listFood(String shopId) throws Exception {
		return shopDao.listFood(shopId);
	}

	public String findShopName(int shopid) throws Exception {
		return shopDao.findShopName(shopid);
	}

	public int delShop(String shopid) throws Exception {
		return shopDao.delShop(shopid);
	}
}
