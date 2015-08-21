package cn.ld.fj.dao;

import cn.ld.fj.entity.Agent;
import cn.ld.fj.entity.Banner;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;


/**
 * 用户对象的泛型DAO类.
 *
 * @author xjli
 */
@Component
public class BannerDao extends HibernateDao<Banner, Long> {
}
