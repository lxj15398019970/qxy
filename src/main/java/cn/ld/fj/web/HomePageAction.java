package cn.ld.fj.web;

import cn.ld.fj.entity.*;
import cn.ld.fj.service.BannerManager;
import cn.ld.fj.service.CompanyManager;
import cn.ld.fj.service.IcaseManager;
import cn.ld.fj.service.NewsManager;
import cn.ld.fj.util.DwzUtil;
import com.google.common.collect.Lists;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Results({@Result(name = JsonActionSupport.RELOAD, location = "home-page.action", type = "redirect")})
public class HomePageAction extends SimpleJsonActionSupport<Agent> {

    private static final long serialVersionUID = 8683878162525847072L;

    private List<Banner> bannerList = Lists.newArrayList();

    @Autowired
    private BannerManager bannerManager;
    @Autowired
    private NewsManager newsManager;
    @Autowired
    private IcaseManager icaseManager;
    @Autowired
    private CompanyManager companyManager;


    private Company company;
    private List<Icase> cases = Lists.newArrayList();
    private List<News> gsNews = Lists.newArrayList();
    private List<News> ynNews = Lists.newArrayList();
    private List<News> allNews = Lists.newArrayList();

    public List<News> getAllNews() {
        return allNews;
    }

    public void setAllNews(List<News> allNews) {
        this.allNews = allNews;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public List<Icase> getCases() {
        return cases;
    }

    public void setCases(List<Icase> cases) {
        this.cases = cases;
    }

    public List<News> getGsNews() {
        return gsNews;
    }

    public void setGsNews(List<News> gsNews) {
        this.gsNews = gsNews;
    }

    public List<News> getYnNews() {
        return ynNews;
    }

    public void setYnNews(List<News> ynNews) {
        this.ynNews = ynNews;
    }

    public List<Banner> getBannerList() {
        return bannerList;
    }

    public void setBannerList(List<Banner> bannerList) {
        this.bannerList = bannerList;
    }

    @Override
    protected void prepareModel() throws Exception {

    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {
        bannerList = bannerManager.getAllByIdDesc();
        List<Company> companys = companyManager.getAll();
        if (!CollectionUtils.isEmpty(companys)) {
            company = companys.get(0);
            if (company.getDetail().length() > 100) {
                company.setDetail(company.getDetail().substring(0, 100) + "...");
            }
        }
        ynNews = newsManager.findByType(0);
        gsNews = newsManager.findByType(1);
        cases = icaseManager.findByIdDesc();
        allNews = newsManager.findByAll();

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {

        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_agent",
                "操作成功"));


    }


    @Override
    public void delete() throws Exception {

    }


}
