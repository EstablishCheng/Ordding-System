package service;

import dao.FoodDao;
import dao.ShopDao;
import entity.Admin;
import entity.Food;
import entity.Shop;

public class FoodService {
	private FoodDao foodDao = new FoodDao();
	
	public void insertFood(String foodname, String price, String shopname) throws Exception {

		Food food = new Food();
		food.setFoodName(foodname);
		food.setPrice(price);
		food.setShopId(foodDao.findshopid(shopname));
		foodDao.insertFood(food);
	}

	public Food findFoodId(String foodId) throws Exception {
		return foodDao.findFoodId(foodId);
	}

	public int updateFood(String price,String foodId) throws Exception {

		return foodDao.updateFood(price,foodId);
	}

	public int deleteFood(String foodId) throws Exception {
		return foodDao.deleteFood(foodId);
	}
}
