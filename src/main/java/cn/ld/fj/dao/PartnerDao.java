package cn.ld.fj.dao;

import cn.ld.fj.entity.News;
import cn.ld.fj.entity.Partner;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;


/**
 * 用户对象的泛型DAO类.
 *
 * @author xjli
 */
@Component
public class PartnerDao extends HibernateDao<Partner, Long> {
}
