package com.DBUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil 
{
    public static String db_url="jdbc:mysql://localhost:3306/servlet?uerUnicode=true&characterEncoding=UTF-8";
    //�����������ݿ⣬servlet�����ݿ�����ƣ�uerUnicode=true&characterEncoding=UTF-8�ǽ��ַ�������Ϊutf-8���������롣
    public static String db_user="root";//���ݵ��û���
    public static String db_password="20153246";//���ݿ������
    public static Connection getConn()//��ȡ���ӣ�����Connection���ͣ���������Ϊstatic������������������ʹ��
    {
        Connection conn=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");//��������
            conn=DriverManager.getConnection(db_url,db_user,db_password);//�������ݿ�
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return conn;
    }
    public static void close(Statement state,Connection conn)//�رպ���
    {
        if(state!=null)//ֻ��״̬������ʱ���ȹر�״̬ 
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
        if(rs!=null)//�н������״̬������ʱ���ȹرս�������ڹر�״̬���ڹر�����
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