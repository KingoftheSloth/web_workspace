package jdbc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// select ���ʹ� ���� ���� ��ƿ��Ƽ Ŭ������ Connection ����� �ݴϴ�.
public class OracleUtility {		// Connection �����Ͽ� �������ְ�, ���ҽ� ���� �޼ҵ带 �ۼ�.
	
	public static Connection getConnection() {
		
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String user = "iclass";
		String password = "0419";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		}
		catch (SQLException | ClassNotFoundException e) {
			System.out.println("�����ͺ��̽� ���� �� ��뿡 ������ ������ϴ�. : " + e.getMessage());
		}
		return conn;		// ������ Connection ��ü ����
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null) {
				conn.close();		// conn�� null ��ü��� close���� ���� -> ���ǽ� �߰�
				System.out.println("���� ����!");
			} else {
				System.out.println("Connection �� null �Դϴ�.");
			}
		} catch (SQLException e) {
			System.out.println("�����ͺ��̽� ���� ���� ���� : " + e.getMessage());
		} // catch end
	} // close method end
} // class end
