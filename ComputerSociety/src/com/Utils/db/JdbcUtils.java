package com.Utils.db;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 数据库连接部分，释放等
 */

public class JdbcUtils {
    /**
     * 释放Connection连接
     * @param connection
     */

    public static void releaseConnection(Connection connection){

        try{
            if(connection != null){
                connection.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    private static DataSource dataSource = null;

    static{
        dataSource = new ComboPooledDataSource("helpTube");
    }

    /**
     * 返回数据源的一个Connection对象
     * @return
     */
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
