package sino.java.daoimpl.base;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import sino.java.common.PageView;
import sino.java.dao.base.IFindDAO;

@Repository("iFindDAO")
public class IFindDAOImpl<T> extends HibernateDaoSupport implements IFindDAO<T>{
	
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	public T findByKeys(Class<T> entityClass, String xql, Object[] keys) {
		Query query = getSession().createQuery(xql);
		if (keys != null && keys.length > 0) {
			for (int i = 0; i < keys.length; i++) {
				query.setParameter(i, keys[i]);
			}
		}
		return (T)query.uniqueResult();
	}

	public List<T> findAllKeys(Class<T> entityClass, String xql, Object[] keys) {
		Query query = getSession().createQuery(xql);
		if (keys != null && keys.length > 0) {
			for (int i = 0; i < keys.length; i++) {
				query.setParameter(i, keys[i]);
			}
		}
		List<T> lists = query.list();
		return lists;
	}
	
	public List<T> findAll(Class<T> entityClass, String sql) {
		return getHibernateTemplate().find(sql);
	}

	public T findById(Class<T> entityClass, Serializable id) {
		return (T) getHibernateTemplate().get(entityClass, id);
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
		Query query = getSession().createQuery(sql);
		if (keys != null && keys.length > 0) {
			for (int i = 0; i < keys.length; i++) {
				query.setParameter(i, keys[i]);
			}
		}
		query.setFirstResult(pageNo).setMaxResults(pageSize);
		List<T> pageList = query.list();
		pv.setPageList(pageList);
		return pv;
	}
	
	private int getTotal(String sql,Object[] keys){
		int totalNo = 0;

		String xxql = null;
		int index = sql.indexOf("from");
		if (index != -1) {
			xxql = "select count(*) " + sql.substring(index);
		}
		Session session = getSession();
		Query query = session.createQuery(sql);

		if (keys != null && keys.length > 0) {
			for (int i = 0; i < keys.length; i++) {
				query.setParameter(i, keys[i]);
			}
		}
		totalNo = query.list().size();
		
		return totalNo;
	}
	
	public List<T> findAllByCollection(Class<T> entityClass,String xql,Collection cn) {
		Query query = getSession().createQuery(xql);
		return query.setParameterList("ids", cn).list();
	}

}
