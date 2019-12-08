package HotelReservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDatabase
{
	public ConnectionDatabase()
	{
		
	}
	public Connection getConnection()
	{
		String url = "jdbc:mysql://hotel-management-instance.cwhyn9urof4q.us-east-2.rds.amazonaws.com:3306/hotel_management_database";
		Connection con = null;
		String user = "admin";
		String pass = "akshar123";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		}
		catch(InstantiationException e)
		{
			e.printStackTrace();
		}
		catch(IllegalAccessException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		
		try
		{
			con = DriverManager.getConnection(url,user,pass);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return con;
		
	}
	
	public void closeConnection(Connection con)
	{
		try
		{
			con.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args)
	{
		ConnectionDatabase db = new ConnectionDatabase();
		Connection con = db.getConnection();
		
		System.out.println(con);
		db.closeConnection(con);
		
	}
	
	
	
	
	
	
	
	
}