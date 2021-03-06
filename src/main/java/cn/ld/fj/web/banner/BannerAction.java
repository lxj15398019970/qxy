package cn.ld.fj.web.banner;

import cn.ld.fj.entity.Banner;
import cn.ld.fj.service.BannerManager;
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
import java.util.List;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/banner")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "banner.action", type = "redirect")})
public class BannerAction extends SimpleJsonActionSupport<Banner> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<Banner> page = new Page<Banner>(10);
    @Autowired
    private BannerManager bannerManager;

    private File bannerImage;
    private String bannerImageFileName;

    public BannerManager getBannerManager() {
        return bannerManager;
    }

    public void setBannerManager(BannerManager bannerManager) {
        this.bannerManager = bannerManager;
    }

    public File getBannerImage() {
        return bannerImage;
    }

    public void setBannerImage(File bannerImage) {
        this.bannerImage = bannerImage;
    }

    public String getBannerImageFileName() {
        return bannerImageFileName;
    }

    public void setBannerImageFileName(String bannerImageFileName) {
        this.bannerImageFileName = bannerImageFileName;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = bannerManager.getEntity(id);
        } else {
            entity = new Banner();
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
        page = bannerManager.searchList(page, filters);

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {

        String tineStr = DateUtil.getTimeStamp() + RandomCodeUtil.generateNumCode(6);
        // 保存地址url
        String url = Config.save_url;
        // 上传动作

        String suffix = bannerImageFileName.substring(bannerImageFileName.lastIndexOf("."));


        String accessUrl = Config.access_url + tineStr + suffix;

        url = url + tineStr + suffix;

        FileUtils.copyFile(bannerImage, new File(url));
        entity.setImage(accessUrl);
        bannerManager.save(entity);


        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_banner",
                "操作成功"));


    }


    @Override
    public void delete() throws Exception {
        bannerManager.delete(id);


        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_banner",
                "操作成功"));

    }

    public Page<Banner> getPage() {
        return page;
    }

    public void setPage(Page<Banner> page) {
        this.page = page;
    }
}
