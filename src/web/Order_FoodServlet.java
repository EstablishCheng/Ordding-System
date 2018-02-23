package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Food;
import entity.Order;
import entity.Shop;
import entity.User;
import net.sf.json.JSONObject;
import service.AdminService;
import service.FoodService;
import service.OrderService;
import service.ShopService;
import service.UserService;

public class Order_FoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminService adminService = new AdminService();
	ShopService shopService = new ShopService();
	FoodService foodService = new FoodService();
	UserService userService = new UserService();
	OrderService orderService = new OrderService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
//		String method = request.getParameter("method");
		String uri = request.getRequestURI();
		String method = uri.substring(uri.lastIndexOf('/'), uri.lastIndexOf('.'));
		if(method.equals("/login")){
			String userName = request.getParameter("name");
			String password = request.getParameter("password");
			String type = request.getParameter("type");
			if(type.equals("admin")&&type!=null&&!type.equals("")){
				try {
					if(adminService.loginAdmin(userName, password)!=null){
						response.sendRedirect("/Order_Food/admin.action");
					}else{
						request.setAttribute("message", "用户名或者密码错误");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					}
				} catch (Exception e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			}else if(type.equals("shop")&&type!=null&&!type.equals("")){
				Shop shop = new Shop();
				try {
					shop = shopService.loginShop(userName, password);
				} catch (Exception e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
				if(shop!=null){
					session.setAttribute("shopName", shop.getName());
					session.setAttribute("shopId", shop.getShopid());
					int shopId = shop.getShopid();
					request.getRequestDispatcher("/listFood.action?shopId="+shopId).forward(request, response);
				}else{
					request.setAttribute("message", "用户名或者密码错误");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}else if(type.equals("user")&&type!=null&&!type.equals("")){
				User user  = new User();
				try {
					user = userService.loginUSer(userName, password);
					session.setAttribute("userName", user.getName());
				} catch (Exception e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
				if(user!=null){
					session.setAttribute("userName", user.getName());
					request.getRequestDispatcher("/shopList.action").forward(request, response);
				}else{
					request.setAttribute("message", "用户名或者密码错误");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
		}else if(method.equals("/addFood")){
			String foodname = request.getParameter("foodname");
			String price = request.getParameter("price");
			String shopname = request.getParameter("shopName");
			String shopId = request.getParameter("shopId");
			try {
				foodService.insertFood(foodname,price,shopname);
//				response.sendRedirect("/Order_Food/listFood.action");
				request.getRequestDispatcher("/listFood.action?shopId"+shopId).forward(request, response);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}else if(method.equals("/userRegist")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String tel = request.getParameter("tel");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			
			try {
				if(userService.userLogin(username)!=null){
					request.setAttribute("message", "该用户已存在");
				}else{
					int success = userService.insertUser(username,password,tel,address,email);
					if(success>0){
						response.sendRedirect("/Order_Food/login.jsp");
					}else{
						request.setAttribute("message", "注册失败，请重新注册");
						request.getRequestDispatcher("userRegist.jsp").forward(request, response);
					}
				}
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}else if(method.equals("/shopRegist")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String tel = request.getParameter("tel");			
			try {
				if(shopService.shopLogin(username)!=null){
					request.setAttribute("message", "该用户已存在");
				}else{
					int success = shopService.insertShop(username,password,tel);
					if(success>0){
						response.sendRedirect("/Order_Food/login.jsp");
					}else{
						request.setAttribute("message", "注册失败，请重新注册");
						request.getRequestDispatcher("userRegist.jsp").forward(request, response);
					}
				}
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}else if(method.equals("/admin")){
			try {
				List<User> userList = adminService.listUser();
				List<Shop> shopList = adminService.listShop();
				session.setAttribute("userList", userList);
				session.setAttribute("shopList", shopList);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(method.equals("/listFood")){
			try {
				String shopId = request.getParameter("shopId");
				List<Food> foodList = shopService.listFood(shopId);
				session.setAttribute("foodList", foodList);
				request.getRequestDispatcher("listFood.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}else if(method.equals("/updateFood")){
			Food food = new Food();
			String foodId = request.getParameter("foodId");
			try {
				food = foodService.findFoodId(foodId);
				request.setAttribute("foodId", food.getFoodId());
				request.setAttribute("shopId", food.getShopId());
				request.setAttribute("foodName", food.getFoodName());
				request.getRequestDispatcher("update.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(method.equals("/updateFoodPrice")){
			String foodId = request.getParameter("foodId");
			String price = request.getParameter("price");
			String shopId = request.getParameter("shopId");
			try {
				int success = foodService.updateFood(price,foodId);
				if(success>0){
					response.sendRedirect("/Order_Food/listFood.action?shopId="+shopId);
				}
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}else if(method.equals("/deleteFood")){
			String foodId = request.getParameter("foodId");
			String shopId = request.getParameter("shopId");
			try {
				int success = foodService.deleteFood(foodId);
				if(success>0){
					response.sendRedirect("/Order_Food/listFood.action?shopId="+shopId);
				}
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}else if(method.equals("/shopList")){
			try {
				List<Shop> shops = userService.shopList();
				session.setAttribute("shopList", shops);
				request.getRequestDispatcher("shopList.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}else if(method.equals("/foodList")){
			try {
				String shopId = request.getParameter("shopId");
				List<Food> foodList = shopService.listFood(shopId);
				session.setAttribute("listFood", foodList);
				request.getRequestDispatcher("foodList.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}else if(method.equals("/orderjisuan")){
		try {
			String shopId = request.getParameter("shopId");
			List<Food> foodList = shopService.listFood(shopId);
			session.setAttribute("listFood", foodList);
			request.getRequestDispatcher("foodList.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}else if(method.equals("/orderForm")){
		String foodname = request.getParameter("foodname");
		String price = request.getParameter("price");
		int num = Integer.valueOf(request.getParameter("num"));
//		JSONObject jsonObject = new JSONObject();
		int shopid = Integer.valueOf(request.getParameter("shopid"));
		String username = request.getParameter("username");
		if(num>0){
			try {
				String shopname = shopService.findShopName(shopid);
				orderService.insertOrder(foodname,price,num,username,shopname);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(num==0){
			try {
				orderService.deleteOrder(foodname);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}else if(method.equals("/orderList")){
		String username = request.getParameter("username");
		try {
			List<Order> userOrderList= orderService.listUserOrder(username);
			session.setAttribute("userOrderList", userOrderList);
			request.getRequestDispatcher("orderForm.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}else if(method.equals("/shopOrderForm")){
		String shopname = request.getParameter("shopname");
		try {
			List<Order> shopOrderList= orderService.listShopOrder(shopname);
			session.setAttribute("shopOrderList", shopOrderList);
			request.getRequestDispatcher("shopOrderForm.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}else if(method.equals("/delUser")){
		String userid = request.getParameter("userid");
		try {
			int success = userService.delUser(userid);
			if(success>0){
				response.sendRedirect("/Order_Food/admin.action");
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}else if(method.equals("/delShop")){
		String shopid = request.getParameter("shopid");
		try {
			int success = shopService.delShop(shopid);
			if(success>0){
				response.sendRedirect("/Order_Food/admin.action");
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}else if(method.equals("/userInform")){
		String username = request.getParameter("username");
		try {
			User user = userService.userLogin(username);
			session.setAttribute("user", user);
			request.getRequestDispatcher("userInform.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
		
	}
}
