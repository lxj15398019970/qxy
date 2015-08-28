package cn.ld.fj.web.company;

import cn.ld.fj.entity.Company;
import cn.ld.fj.service.CompanyManager;
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
@Namespace("/company")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "company.action", type = "redirect")})
public class CompanyAction extends SimpleJsonActionSupport<Company> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<Company> page = new Page<Company>(10);
    @Autowired
    private CompanyManager companyManager;

    private File companyImage;
    private String companyImageFileName;

    public File getCompanyImage() {
        return companyImage;
    }

    public void setCompanyImage(File companyImage) {
        this.companyImage = companyImage;
    }

    public String getCompanyImageFileName() {
        return companyImageFileName;
    }

    public void setCompanyImageFileName(String companyImageFileName) {
        this.companyImageFileName = companyImageFileName;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = companyManager.getEntity(id);
        } else {
            entity = new Company();
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
        page = companyManager.searchList(page, filters);
        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }


    @Override
    public void save() throws Exception {
        if (companyImage != null) {
            String tineStr = DateUtil.getTimeStamp() + RandomCodeUtil.generateNumCode(6);
            // 保存地址url
            String url = Config.save_url;
            // 上传动作

            String suffix = companyImageFileName.substring(companyImageFileName.lastIndexOf("."));


            String accessUrl = Config.access_url + tineStr + suffix;

            url = url + tineStr + suffix;

            FileUtils.copyFile(companyImage, new File(url));
            entity.setHeadImage(accessUrl);
        }
        companyManager.save(entity);
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_company",
                "操作成功"));

    }


    @Override
    public void delete() throws Exception {
        companyManager.delete(id);


        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_company",
                "操作成功"));

    }

    public Page<Company> getPage() {
        return page;
    }

    public void setPage(Page<Company> page) {
        this.page = page;
    }
}
