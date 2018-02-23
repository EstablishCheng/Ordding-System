package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.Admin;
import entity.Food;
import entity.Shop;
import entity.User;
import utils.JdbcUtils;

public class FoodDao {
	//����
	public void insertFood(Food food) throws Exception{
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="insert into food(foodname,price,shopid) values(?,?,?)";
			Object[] args={food.getFoodName(),food.getPrice(),food.getShopId()};
			qr.update(sql,args);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	
	//������������ѯ����id
	public int findshopid(String foodname) throws Exception{
		QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
		String sql="select shopid from shop where name=?";
		Shop shop = qr.query(sql,new BeanHandler<Shop>(Shop.class),foodname);
		return shop.getShopid();
	}
	
	//ɾ��
	public void delUser(String userid) throws Exception{
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="delete from user where userid=?";
			qr.update(sql,userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	//�޸�
	public void updUser(String userid,String password) throws Exception{
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="update user set password=? where userid=?";
			Object[] args={password,userid};
			qr.update(sql,userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	//�鿴�����û�
	public List<User> listUser() throws Exception{
		List<User> users=null;
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="select * from user";
			users=qr.query(sql,new BeanListHandler<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return users;
	}
	
	//�̼ҵ�¼
	public Shop loginShop(String username,String password) throws Exception{
		Shop shop = new Shop();
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="select * from shop where name = ? and password = ?";
			Object[] args={username,password};
			shop=qr.query(sql,new BeanHandler<Shop>(Shop.class),args);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return shop;
	}

	public Food findFoodId(String foodId) throws Exception {
		Food food = new Food();
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="select * from food where foodid = ?";
			food=qr.query(sql,new BeanHandler<Food>(Food.class),foodId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return food;
	}

	public int updateFood(String price,String foodId) throws Exception {
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="update food set price=? where foodid=?";
			return qr.update(sql,price,foodId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

	public int deleteFood(String foodId) throws Exception {
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="delete from food where foodid=?";
			return qr.update(sql,foodId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

}
