package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.Admin;
import entity.Food;
import entity.Order;
import entity.Shop;
import entity.User;
import utils.JdbcUtils;

public class OrderDao {
	//≤Â»Î
	public int insertOrder(String foodname, String price, int num,String username,String shopname) throws Exception {
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="insert into order_form(foodname,price,num,username,shopname) values(?,?,?,?,?)";
			Object[] args={foodname,price,num,username,shopname};
			return qr.update(sql,args);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

	public void deleteOrder(String foodname) throws Exception {
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="delete from order_form where foodname=?";
			qr.update(sql,foodname);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

	public List<Order> listUserOrder(String username) throws Exception {
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="select * from order_form where username = ?";
			List<Order> userOrderList=qr.query(sql,new BeanListHandler<Order>(Order.class),username);
			return userOrderList;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

	public List<Order> listShopOrder(String shopname) throws Exception {
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="select * from order_form where shopname = ?";
			List<Order> userOrderList=qr.query(sql,new BeanListHandler<Order>(Order.class),shopname);
			return userOrderList;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

}
