package com.DBUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil 
{
    public static String db_url="jdbc:mysql://localhost:3306/servlet?uerUnicode=true&characterEncoding=UTF-8";
    //这是连接数据库，servlet是数据库的名称，uerUnicode=true&characterEncoding=UTF-8是将字符集设置为utf-8，避免乱码。
    public static String db_user="root";//数据的用户名
    public static String db_password="20153246";//数据库的密码
    public static Connection getConn()//获取连接，返回Connection类型，必须设置为static这样才能在其他类中使用
    {
        Connection conn=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");//加载驱动
            conn=DriverManager.getConnection(db_url,db_user,db_password);//连接数据库
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return conn;
    }
    public static void close(Statement state,Connection conn)//关闭函数
    {
        if(state!=null)//只有状态和连接时，先关闭状态 
        {
            try
            {
                state.close();
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
        if(conn!=null)
        {
            try
            {
                conn.close();
            }
            catch(SQLException e)
            {
                 e.printStackTrace();
            }
        }
    }
    public static void close(ResultSet rs,Statement state,Connection conn)
    {
        if(rs!=null)//有结果集，状态和连接时，先关闭结果集，在关闭状态，在关闭连接
        {
            try
            {
                rs.close();
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
        if(state!=null)
            
        {
            try
            {
                state.close();
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
        if(conn!=null)
        {
            try
            {
                conn.close();
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
    }

}