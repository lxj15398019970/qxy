package cn.ld.fj.service;

import cn.ld.fj.dao.CompanyDao;
import cn.ld.fj.entity.Company;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
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
public class CompanyManager {

    @Autowired
    private CompanyDao companyDao;


    @Transactional(readOnly = true)
    public Company getEntity(Long id) {
        return companyDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Company> searchList(Page<Company> page, List<PropertyFilter> filters) {
        return companyDao.findPage(page, filters);

    }

    public void save(Company entity) {

        companyDao.save(entity);
    }

    public void delete(Long id) {
        companyDao.delete(id);
    }

    public List<Company> getAll() {
        return companyDao.getAll();
    }
}
