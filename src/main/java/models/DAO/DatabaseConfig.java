package models.DAO;

public class DatabaseConfig {
	public static String host = "localhost:3306";
	public static String name = "TDBlog";
	public static String username = "root";
	public static String password = "1234";
	
	public static String getConnectionString() {
		return "jdbc:mysql://" + host + "/" + name + "?useSSL=false&useUnicode=true&characterSetResults=utf8&characterEncodi‌​ng=UTF-8"; 
	}
}
