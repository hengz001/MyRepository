package sino.java.serviceimpl.dep;

import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.dep.Department;
import sino.java.service.dep.DepServiceFind;

@Service("depServiceFind")
public class DepServiceImplFind extends AbstractFinder<Department> implements DepServiceFind{}
