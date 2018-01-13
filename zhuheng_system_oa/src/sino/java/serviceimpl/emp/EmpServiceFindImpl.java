package sino.java.serviceimpl.emp;

import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.emp.Employee;
import sino.java.service.emp.EmpServiceFind;

@Service("empServiceFind")
public class EmpServiceFindImpl extends AbstractFinder<Employee> implements EmpServiceFind{}
