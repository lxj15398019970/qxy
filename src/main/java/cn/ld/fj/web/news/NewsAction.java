package cn.ld.fj.web.news;

import cn.ld.fj.entity.News;
import cn.ld.fj.service.NewsManager;
import cn.ld.fj.util.Config;
import cn.ld.fj.util.DateUtil;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.util.RandomCodeUtil;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/news")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "news.action", type = "redirect")})
public class NewsAction extends SimpleJsonActionSupport<News> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<News> page = new Page<News>(10);
    @Autowired
    private NewsManager newsManager;
    private File newsImage;
    private String newsImageFileName;

    public File getNewsImage() {
        return newsImage;
    }

    public void setNewsImage(File newsImage) {
        this.newsImage = newsImage;
    }

    public String getNewsImageFileName() {
        return newsImageFileName;
    }

    public void setNewsImageFileName(String newsImageFileName) {
        this.newsImageFileName = newsImageFileName;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = newsManager.getEntity(id);
        } else {
            entity = new News();
        }
    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {
        List<PropertyFilter> filters = PropertyFilter
                .buildFromHttpRequest(Struts2Utils.getRequest());
        if (CollectionUtils.isNotEmpty(filters)) {
            System.out.println(filters.get(0).getPropertyName());
        }
        // 设置默认排序方式
        if (!page.isOrderBySetted()) {
            page.setOrderBy("id");
            page.setOrder(Page.ASC);
        }
        page = newsManager.searchList(page, filters);

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {
        if (newsImage != null) {
            String tineStr = DateUtil.getTimeStamp() + RandomCodeUtil.generateNumCode(6);
            // 保存地址url
            String url = Config.save_url;
            // 上传动作

            String suffix = newsImageFileName.substring(newsImageFileName.lastIndexOf("."));


            String accessUrl = Config.access_url + tineStr + suffix;

            url = url + tineStr + suffix;

            FileUtils.copyFile(newsImage, new File(url));
            entity.setHeadImage(accessUrl);
        }
        entity.setTime(DateUtil.date2str(new Date(), "yyyy-MM-dd HH:mm:ss"));
        newsManager.save(entity);
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_news",
                "操作成功"));

    }


    @Override
    public void delete() throws Exception {
        newsManager.delete(id);


        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_news",
                "操作成功"));

    }

    public Page<News> getPage() {
        return page;
    }

    public void setPage(Page<News> page) {
        this.page = page;
    }
}
