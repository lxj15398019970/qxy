package cn.ld.fj.web;

import cn.ld.fj.entity.*;
import cn.ld.fj.service.BannerManager;
import cn.ld.fj.service.CompanyManager;
import cn.ld.fj.service.IcaseManager;
import cn.ld.fj.service.NewsManager;
import cn.ld.fj.util.Config;
import cn.ld.fj.util.DwzUtil;
import com.google.common.collect.Lists;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.commons.lang.StringUtils;
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
    private News news;
    private Icase icase;

    private String cdetail;
    private String curl;

    public String getCdetail() {
        return cdetail;
    }

    public void setCdetail(String cdetail) {
        this.cdetail = cdetail;
    }

    public String getCurl() {
        return curl;
    }

    public void setCurl(String curl) {
        this.curl = curl;
    }

    public Icase getIcase() {
        return icase;
    }

    public void setIcase(Icase icase) {
        this.icase = icase;
    }

    private String type;
    private long id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

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
                cdetail = company.getDetail().substring(0, 100) + "...";

            }
            curl = Config.baseUrl + company.getId() + "&type=company";
        }
        ynNews = newsManager.findByType(0);
        dealUrl(ynNews);
        gsNews = newsManager.findByType(1);
        dealUrl(gsNews);
        cases = icaseManager.findByIdDesc();
        dealCaseUrl(cases);
        allNews = newsManager.findByAll();
        dealUrl(allNews);

        return SUCCESS;
    }


    private void dealCaseUrl(List<Icase> cases) {
        for (Icase icase : cases) {
            icase.setUrl(Config.baseUrl + icase.getId() + "&type=case");
        }
    }

    private void dealUrl(List<News> allNews) {
        for (News news : allNews) {
            news.setUrl(Config.baseUrl + news.getId() + "&type=news");
        }
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


    public String more() throws Exception {
        if (StringUtils.isBlank(type)) {
            type = "1";
        }
        gsNews = newsManager.findAllNews(Integer.parseInt(type));
        dealUrl(gsNews);
        bannerList = bannerManager.getAllByIdDesc();


        return "more";
    }


    public String one() throws Exception {
        bannerList = bannerManager.getAllByIdDesc();
        if ("news".equals(type)) {
            news = newsManager.getEntity(id);
            return "news";
        } else if ("case".equals(type)) {
            icase = icaseManager.getEntity(id);
            return "icase";
        } else if ("company".equals(type)) {
            List<Company> companys = companyManager.getAll();
            if (!CollectionUtils.isEmpty(companys)) {
                company = companys.get(0);
            }
            return "company";
        }

        return "news";
    }

    public String moreCase() throws Exception {

        bannerList = bannerManager.getAllByIdDesc();
        cases = icaseManager.findAllByIdDesc();
        dealCaseUrl(cases);

        return "more-case";
    }


    public String contact() {
        List<Company> companys = companyManager.getAll();
        if (!CollectionUtils.isEmpty(companys)) {
            company = companys.get(0);
        }
        bannerList = bannerManager.getAllByIdDesc();
        return "contact";
    }


    @Override
    public void delete() throws Exception {

    }


}
