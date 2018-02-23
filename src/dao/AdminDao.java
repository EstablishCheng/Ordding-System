package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.Admin;
import entity.Shop;
import entity.User;
import utils.JdbcUtils;

public class AdminDao {
	//插入
	public void insertUser(User user) throws Exception{
		try {
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
			String sql="insert into user(name,password,tel,address,email,code) values(?,?,?,?,?,?)";
			Object[] args={user.getName(),user.getPassword(),user.getTel(),user.getAddress(),user.getEmail(),user.getCode()};
			qr.update(sql,args);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	//删除
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
	//修改
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
	
	//管理员登录
		public Admin loginAdmin(String username,String password) throws Exception{
			Admin admin = new Admin();
			try {
				QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
				String sql="select * from admin where username = ? and password = ?";
				Object[] args={username,password};
				admin=qr.query(sql,new BeanHandler<Admin>(Admin.class),args);
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception(e);
			}
			return admin;
		}
		public List<Shop> listShop() throws Exception {
			List<Shop> shops=null;
			try {
				QueryRunner qr=new QueryRunner(JdbcUtils.getDataSourse());
				String sql="select * from shop";
				shops=qr.query(sql,new BeanListHandler<Shop>(Shop.class));
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception(e);
			}
			return shops;
		}

}
