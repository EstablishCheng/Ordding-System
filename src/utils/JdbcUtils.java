package utils;

import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;

public class JdbcUtils {
	private static BasicDataSource bs;
	static{
		Properties p=null;
		try {
			p=new Properties();
			bs=new BasicDataSource();
			p.load(JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties"));
			bs.setDriverClassName(p.getProperty("className"));
			bs.setUrl(p.getProperty("url"));
			bs.setUsername(p.getProperty("username"));
			bs.setPassword(p.getProperty("password"));
			bs.setMaxActive(Integer.parseInt(p.getProperty("MaxActive")));
			bs.setMaxWait(Integer.parseInt(p.getProperty("MaxWait")));
			bs.setInitialSize(Integer.parseInt(p.getProperty("InitialSize")));			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("配置文件找不到...");
		}
	}
	public static BasicDataSource getDataSourse(){
		return bs;
	}

}
