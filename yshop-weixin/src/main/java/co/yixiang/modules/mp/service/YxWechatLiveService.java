/**
* Copyright (C) 2018-2020
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.mp.service;

import cn.binarywang.wx.miniapp.bean.WxMaLiveResult;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.mp.service.dto.YxWechatLiveDto;
import co.yixiang.modules.mp.service.dto.YxWechatLiveQueryCriteria;
import co.yixiang.modules.mp.vo.WechatLiveVo;
import co.yixiang.modules.mp.domain.YxWechatLive;
import co.yixiang.modules.product.vo.YxStoreProductQueryVo;
import org.springframework.data.domain.Pageable;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
* @author hupeng
* @date 2020-08-10
*/
public interface YxWechatLiveService  extends BaseService<YxWechatLive>{




    /**
     * 同步直播间
     * @return
     */
    boolean synchroWxOlLive();

    /**
    * 查询数据分页
    * @param criteria 条件
    * @param pageable 分页参数
    * @return Map<String,Object>
    */
    WechatLiveVo queryAll(YxWechatLiveQueryCriteria criteria, Pageable pageable);

    /**
    * 查询所有数据不分页
    * @param criteria 条件参数
    * @return List<YxWechatLiveDto>
    */
    List<YxWechatLive> queryAll(YxWechatLiveQueryCriteria criteria);


    boolean saveLive(YxWechatLive resources);

    /**
    * 导出数据
    * @param all 待导出的数据
    * @param response /
    * @throws IOException /
    */
    void download(List<YxWechatLiveDto> all, HttpServletResponse response) throws IOException;

    /**
     * 获取直播回放
     * @param roomId
     * @return
     */
     List<WxMaLiveResult.LiveReplay> getLiveReplay(Integer roomId);


    /**
     * 商品列表
     * @param page 页码
     * @param limit 条数
     * @param order ProductEnum
     * @return List
     */
    List<YxWechatLiveDto> getList(int page, int limit, int order);
}
