package com.society.computer.serviceImpl;

import com.society.computer.dao.StudentSignDao;
import com.society.computer.entity.StudentSign;
import com.society.computer.service.StudentSignService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentSignServiceImpl implements StudentSignService {

    @Autowired
    private StudentSignDao studentSignDao;

    @Override
    public List<StudentSign> findAll() {
        return studentSignDao.findAll();
    }

    @Override
    public void save(StudentSign studentSignModel) {
        studentSignModel.setDel(false);
        studentSignDao.save(studentSignModel);
    }

    @Override
    public void delete(StudentSign studentSign) {
        StudentSign studentSign1 = studentSignDao.getSingleStudentSign(studentSign.getId());
        studentSign1.setDel(true);
        studentSignDao.update(studentSign1);
    }

    @Override
    public List<StudentSign> findAll(StudentSign studentSignModel) {
        return studentSignDao.findAll(studentSignModel.getStuDepart());
    }

    @Override
    public void clear() {
//        List<StudentSign> studentSigns = findAll();
//        for (StudentSign studentSign:studentSigns){
//            studentSign.setDel(true);
//            studentSignDao.update(studentSign);
//        }
//       studentSignDao.clearAll();
        String hql = "update StudentSign set del = true";
//        String hql = "update signinfo set del = true";
        studentSignDao.clearAll(hql);
    }

    @Override
    public String getSignInfo(String stuDepart) {
        return studentSignDao.getSignInfo(stuDepart);
    }
}
