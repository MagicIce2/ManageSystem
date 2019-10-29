package com.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.DBUtil.DBUtil;

public class Userdao {
    public int login(String username,String password)
    {
        Connection conn = DBUtil.getConn();//这里就是从DBUtil类里面得到连接
        Statement state =null;
        ResultSet rs = null;
        int flag=0;
        try
        {
            String sql = "select * from user where name = '"+username+"'";//SQL语句,
            state = conn.createStatement();
            
            rs=state.executeQuery(sql);
            if(rs.next())
            {
                if(rs.getString("password").equals(password))
                {
                    flag=1;
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        finally
        {
            DBUtil.close(rs, state, conn);
        }
        return flag;
    }
    

}