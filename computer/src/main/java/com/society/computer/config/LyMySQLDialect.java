package com.society.computer.config;

import org.hibernate.dialect.MySQLDialect;
import org.hibernate.dialect.function.StandardSQLFunction;

public class LyMySQLDialect extends MySQLDialect {
    public LyMySQLDialect() {
        super();
        registerFunction("group_concat", new StandardSQLFunction("group_concat"));
    }
}
