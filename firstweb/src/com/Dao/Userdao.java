package com.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.DBUtil.DBUtil;

public class Userdao {
    public int login(String username,String password)
    {
        Connection conn = DBUtil.getConn();//������Ǵ�DBUtil������õ�����
        Statement state =null;
        ResultSet rs = null;
        int flag=0;
        try
        {
            String sql = "select * from user where name = '"+username+"'";//SQL���,
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