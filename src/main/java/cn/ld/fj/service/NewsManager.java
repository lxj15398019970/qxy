package cn.ld.fj.service;

import cn.ld.fj.dao.NewsDao;
import cn.ld.fj.entity.News;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 安全相关实体的管理类, 包括用户,角色,资源与授权类.
 *
 * @author fly
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class NewsManager {

    @Autowired
    private NewsDao newsDao;


    @Transactional(readOnly = true)
    public News getEntity(Long id) {
        return newsDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<News> searchList(Page<News> page, List<PropertyFilter> filters) {
        return newsDao.findPage(page, filters);

    }

    public void save(News entity) {

        newsDao.save(entity);
    }

    public void delete(Long id) {
        newsDao.delete(id);
    }

    public List<News> findByType(int type) {
        String hql = "select n from News n where n.newsType=? order by n.id desc";
        Query query = newsDao.createQuery(hql, type);
        query.setMaxResults(10);
        query.setFirstResult(0);
        return query.list();
    }

    public List<News> findByAll() {
        String hql = "select n from News n order by n.id desc";
        Query query = newsDao.createQuery(hql);
        query.setMaxResults(5);
        query.setFirstResult(0);
        return query.list();
    }

    public List<News> findAllNews(int i) {
        String hql = "select n from News n where n.newsType=? order by n.id desc";
        return newsDao.find(hql, i);
    }
}
