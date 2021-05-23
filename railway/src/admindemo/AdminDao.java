package admindemo;
import java.sql.*;
import java.util.Scanner;
public class AdminDao {
	static Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	
	
			public static Connection connect()
			{
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","");
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				return con;
			}
					
						
	public int addTrain(String name,int t_no,String from1,String to1,String depart,String arr,long price)
					{
						int a=0;
						try
						{
							con=connect();
					 ps = con.prepareStatement("insert into train_data values(?,?,?,?,?,?,?)");
	                ps.setString(1, name);
					ps.setInt(2, t_no);
					ps.setString(3, from1);
					ps.setString(4, to1);
					ps.setString(5, depart);
					ps.setString(6, arr);
					
					ps.setLong(8, price);
					 a=ps.executeUpdate();
					if(a==1)
					{
						System.out.println("successfully updated");
					}
						}
					catch(Exception e)
					{
						System.out.println(e);
					}
					return a;
					}
	public void display()
	{
		try{
					 rs=ps.executeQuery("select * from train_data");
					while(rs.next())
					{
						String nm=rs.getString(1);
						int id1=rs.getInt(2);
						String fr=rs.getString(3);
						String to=rs.getString(4);
						String dp=rs.getString(5);
						String ar=rs.getString(6);
						String c=rs.getString(7);
						long pc=rs.getLong(8);
						System.out.println(nm+" "+id1+" "+fr+" "+to+" "+dp+" "+ar+"  "+pc);
					}
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		}
				public int updateTrain(int t_no,String name,String from1,String to1,String depart,String arr,String coach,long price)
				{
					int j=0;
					try
					{
					con=connect();
					ps=con.prepareStatement("update train_data set name=?,from1=?,to1=?,depart=?,arr=?,price=? where t_no=?");
					ps.setString(1, name);
					ps.setString(2,from1);
					ps.setString(3, to1);
					ps.setString(4, depart);
					ps.setString(5, arr);
				
					ps.setLong(7, price);
					ps.setInt(8, t_no);
				 j=ps.executeUpdate();
					if(j>0){
						
						System.out.println("Successfully Updated");
						
						
					}
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
					return j;
				}
					public int deleteTrain(int t_no)
					{
						int k=0;
						try
						{
							con=connect();
					ps=con.prepareStatement("delete from train_data where t_no=?");
					ps.setInt(1, t_no);
					 k=ps.executeUpdate();
					if(k>0){
						
						System.out.println("train_data data deleted");
						
					}
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
					return k;
					}
					
               }  
					



