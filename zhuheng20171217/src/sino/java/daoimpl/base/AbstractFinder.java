package sino.java.daoimpl.base;

import java.io.Serializable;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import sino.java.dao.base.BaseFinder;
import sino.java.dao.base.IFindDAO;
import sino.java.po.common.PageView;

@Service
public  class AbstractFinder<T> implements BaseFinder<T>{
	
	@Resource(name="IFindDAOImpl")
	private IFindDAO<T> iFindDao;

	public T findById(Class<T> entityClass, Serializable id) {
		return iFindDao.findById(entityClass, id);
	}

	public List<T> findAll(Class<T> entityClass, String sql) {
		return iFindDao.findAll(entityClass, sql);
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, int pageNo, int pageSize) {
		return iFindDao.findByPage(entityClass, sql, pageNo, pageSize);
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, Object key, int pageNo, int pageSize) {
		return iFindDao.findByPage(entityClass, sql, key, pageNo, pageSize);
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, Object[] keys, int pageNo, int pageSize) {
		return iFindDao.findByPage(entityClass, sql, keys, pageNo, pageSize);
	}
	
	public IFindDAO<T> getiFindDao() {
		return iFindDao;
	}
	
	public void setiFindDao(IFindDAO<T> iFindDao) {
		this.iFindDao = iFindDao;
	}
}
