package sino.java.serviceimpl.emp;

import org.springframework.stereotype.Service;
import sino.java.daoimpl.base.AbstractDAO;
import sino.java.service.emp.EmpService;

@Service("empService")
public class EmpServiceImpl extends AbstractDAO implements EmpService{}
