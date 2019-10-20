package com.society.computer.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import javax.servlet.http.HttpSession;

public class PrivilegeInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        ActionContext actionContext = actionInvocation.getInvocationContext();
        if ("admin".equals(actionContext.getSession().get("username"))){
            return actionInvocation.invoke();
        }
        actionContext.getSession().put("msg", "你没有权限!");
        return "login";
    }
}
