package utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ResponseUtil {
	public static void write(HttpServletResponse response,Object o) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		//��ͻ��˷����ַ��ı�
		PrintWriter writer = response.getWriter();
		writer.println(o.toString());
		writer.flush();
		writer.close();
	}
}
