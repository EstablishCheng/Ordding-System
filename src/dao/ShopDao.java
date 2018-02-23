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

public class ShopDao {
	//插入
	public int insertShop(Shop shop) throws Exception{
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="insert into shop(name,password,tel) values(?,?,?)";
			Object[] args={shop.getName(),shop.getPassword(),shop.getTel()};
			return qr.update(sql,args);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	//查看所有用户
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
	
	//商家登录
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
	public Shop shopLogin(String username) throws Exception {
		Shop shop = new Shop();
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="select * from shop where name = ?";
			Object[] args={username};
			shop=qr.query(sql,new BeanHandler<Shop>(Shop.class),args);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return shop;
	}
	public List<Food> listFood(String shopId) throws Exception {
		List<Food> listFood = null;
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="select * from food where shopid = ?";
			listFood=qr.query(sql,new BeanListHandler<Food>(Food.class),shopId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return listFood;
	}
	public String findShopName(int shopId) throws Exception {
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="select * from shop where shopid = ?";
			Shop shop=qr.query(sql,new BeanHandler<Shop>(Shop.class),shopId);
			return shop.getName();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	public int delShop(String shopid) throws Exception {
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="delete from shop where userid=?";
			return qr.update(sql,shopid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

}
