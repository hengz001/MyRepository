package sino.java.daoimpl.base;

import org.springframework.stereotype.Service;
import sino.java.dao.base.BaseFinder;

@Service
public  class AbstractFinder<T> extends IFindDAOImpl<T> implements BaseFinder<T>{
	
}
