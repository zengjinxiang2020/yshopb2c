package co.yixiang.modules.user.service.impl;

import co.yixiang.modules.user.entity.YxSystemAttachment;
import co.yixiang.modules.user.mapper.YxSystemAttachmentMapper;
import co.yixiang.modules.user.service.YxSystemAttachmentService;
import co.yixiang.modules.user.web.param.YxSystemAttachmentQueryParam;
import co.yixiang.modules.user.web.vo.YxSystemAttachmentQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.utils.OrderUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.io.Serializable;


/**
 * <p>
 * 附件管理表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-11-11
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxSystemAttachmentServiceImpl extends BaseServiceImpl<YxSystemAttachmentMapper, YxSystemAttachment> implements YxSystemAttachmentService {

    @Autowired
    private YxSystemAttachmentMapper yxSystemAttachmentMapper;

    @Override
    public YxSystemAttachment getInfo(String name) {
        QueryWrapper<YxSystemAttachment> wrapper = new QueryWrapper<>();
        wrapper.eq("name",name);
        return yxSystemAttachmentMapper.selectOne(wrapper);
    }

    @Override
    public void attachmentAdd(String name, String attSize, String attDir,String sattDir) {
        YxSystemAttachment attachment = new YxSystemAttachment();
        attachment.setName(name);
        attachment.setAttSize(attSize);
        attachment.setAttDir(attDir);
        attachment.setAttType("image/jpeg");
        attachment.setSattDir(sattDir);
        attachment.setTime(OrderUtil.getSecondTimestampTwo());
        attachment.setImageType(1);
        attachment.setModuleType(2);
        attachment.setPid(1);
        yxSystemAttachmentMapper.insert(attachment);
    }

    @Override
    public YxSystemAttachmentQueryVo getYxSystemAttachmentById(Serializable id) throws Exception{
        return yxSystemAttachmentMapper.getYxSystemAttachmentById(id);
    }

    @Override
    public Paging<YxSystemAttachmentQueryVo> getYxSystemAttachmentPageList(YxSystemAttachmentQueryParam yxSystemAttachmentQueryParam) throws Exception{
        Page page = setPageParam(yxSystemAttachmentQueryParam,OrderItem.desc("create_time"));
        IPage<YxSystemAttachmentQueryVo> iPage = yxSystemAttachmentMapper.getYxSystemAttachmentPageList(page,yxSystemAttachmentQueryParam);
        return new Paging(iPage);
    }

}
