package com.society.computer.member;

import com.society.computer.entity.Member;
import com.society.computer.service.MemberService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

//@ContextConfiguration("classpath:applicationContext.xml")
//@RunWith(SpringJUnit4ClassRunner.class)
public class MemberTest {

    @Autowired
    private MemberService memberService;

    @Test
    public void test(){
//        List<Member> memberList = memberService.findAll(dc);
//        System.out.println(memberList.size());
    }

}
