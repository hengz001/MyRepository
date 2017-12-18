package sino.java.daoimpl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;
import sino.java.common.PageView;
import sino.java.dao.IFindDAO;

@Service
public class IFindDAOImpl<T> extends HibernateDaoSupport implements IFindDAO<T>{

	private Session session;
	
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
		session = sessionFactory.openSession();
	}
	
	
//	@Autowired
//	private SessionFactory sessionFactory;
//	private Session session = sessionFactory.openSession();
	

	public T findById(Class<T> entityClass, Serializable id) {
		return session.get(entityClass, id);
	}

	public List<T> findAll(Class<T> entityClass, String sql) {
		return (List<T>) getHibernateTemplate().find(sql, entityClass);
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, int pageNo, int pageSize) {
		return findByPage( entityClass,  sql,null, pageNo,  pageSize);
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, Object key, int pageNo, int pageSize) {
		return findByPage(entityClass,sql, new Object[]{key}, pageNo, pageSize);
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, Object[] keys, int pageNo, int pageSize) {
		PageView<T> pv = new PageView<T>();
		int totalNo = getTotal(sql, keys);
		pv.setTotalNo(totalNo);
		NativeQuery<T> query = session.createNativeQuery(sql);
		for (int i = 0; i < keys.length; i++) {
			query.setParameter(i, keys[i]);
		}
		query.setFirstResult((pageNo-1)*pageSize).setMaxResults(pageSize);
		List<T> pageList = query.getResultList();
		pv.setPageList(pageList);
		
		return pv;
	}
	
	private int getTotal(String sql,Object[] keys){
		int totalNo = 0;
		
		String xsql = null;
		int index = sql.indexOf("from");
		if(index != -1){
			xsql = "SELECT COUNT(*) "+sql.substring(index);
		}
		NativeQuery<T> query = session.createNativeQuery(sql);
		if(null != keys){
			for (int i = 0; i < keys.length; i++) {
				query.setParameter(i, keys[i]);
			}
		}
		List<T> list = query.getResultList();
		totalNo = list.size();
		return totalNo;
	}
}
