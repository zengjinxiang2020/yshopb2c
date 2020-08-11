/**
* Copyright (C) 2018-2020
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.wechat.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import co.yixiang.modules.wechat.domain.YxWechatLive;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.dozer.service.IGenerator;
import co.yixiang.modules.wechat.service.WxMaLiveService;
import co.yixiang.modules.wechat.service.dto.WxMaLiveInfo;
import co.yixiang.tools.config.WxMaConfiguration;
import co.yixiang.utils.DateUtils;
import co.yixiang.utils.OrderUtil;
import com.github.pagehelper.PageInfo;
import co.yixiang.common.utils.QueryHelpPlus;
import co.yixiang.utils.FileUtil;
import co.yixiang.modules.wechat.service.YxWechatLiveService;
import co.yixiang.modules.wechat.service.dto.YxWechatLiveDto;
import co.yixiang.modules.wechat.service.dto.YxWechatLiveQueryCriteria;
import co.yixiang.modules.wechat.service.mapper.YxWechatLiveMapper;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.bean.result.WxMediaUploadResult;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
// 默认不使用缓存
//import org.springframework.cache.annotation.CacheConfig;
//import org.springframework.cache.annotation.CacheEvict;
//import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
* @author hupeng
* @date 2020-08-10
*/
@Service
//@CacheConfig(cacheNames = "yxWechatLive")
@Slf4j
@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
public class YxWechatLiveServiceImpl extends BaseServiceImpl<YxWechatLiveMapper, YxWechatLive> implements YxWechatLiveService {

    private final IGenerator generator;
    @Value("${file.path}")
    private String uploadDirStr;
    private final WxMaLiveService wxMaLiveService;

    public YxWechatLiveServiceImpl(IGenerator generator, WxMaLiveService wxMaLiveService) {
        this.generator = generator;
        this.wxMaLiveService = wxMaLiveService;
    }

    @Override
    //@Cacheable
    public Map<String, Object> queryAll(YxWechatLiveQueryCriteria criteria, Pageable pageable) {
        getPage(pageable);
        PageInfo<YxWechatLive> page = new PageInfo<>(queryAll(criteria));
        Map<String, Object> map = new LinkedHashMap<>(2);
        map.put("content", generator.convert(page.getList(), YxWechatLiveDto.class));
        map.put("totalElements", page.getTotal());
        return map;
    }
    @Override
    public boolean saveLive(YxWechatLive resources){
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        try {
            resources.setStartTime(Long.valueOf(OrderUtil.dateToTimestamp(resources.getStartDate())));
            resources.setEndTime(Long.valueOf(OrderUtil.dateToTimestamp(resources.getEndDate())));
            resources.setAnchorImg(uploadPhotoToWx(wxMaService,resources.getAnchorImge()).getMediaId());
            resources.setCoverImg(uploadPhotoToWx(wxMaService,resources.getCoverImge()).getMediaId());
            resources.setShareImg(uploadPhotoToWx(wxMaService,resources.getShareImge()).getMediaId());
            WxMaLiveInfo.RoomInfo roomInfo = generator.convert(resources, WxMaLiveInfo.RoomInfo.class);
            Integer status = wxMaLiveService.createRoom(roomInfo);
            resources.setRoomid(Long.valueOf(status));
            this.save(resources);
        } catch (WxErrorException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    //@Cacheable
    public List<YxWechatLive> queryAll(YxWechatLiveQueryCriteria criteria){
        return baseMapper.selectList(QueryHelpPlus.getPredicate(YxWechatLive.class, criteria));
    }


    @Override
    public void download(List<YxWechatLiveDto> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (YxWechatLiveDto yxWechatLive : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("直播间标题", yxWechatLive.getName());
            map.put("背景图", yxWechatLive.getCoverImg());
            map.put("分享图片", yxWechatLive.getShareImg());
            map.put("直播间状态", yxWechatLive.getLiveStatus());
            map.put("开始时间", yxWechatLive.getStartTime());
            map.put("预计结束时间", yxWechatLive.getEndTime());
            map.put("主播昵称", yxWechatLive.getAnchorName());
            map.put("主播微信号", yxWechatLive.getAnchorWechat());
            map.put("主播头像", yxWechatLive.getAnchorImg());
            map.put("直播间类型 1：推流 0：手机直播", yxWechatLive.getType());
            map.put("横屏、竖屏 【1：横屏，0：竖屏】", yxWechatLive.getScreenType());
            map.put("是否关闭货架 【0：开启，1：关闭】", yxWechatLive.getCloseLike());
            map.put("是否关闭评论 【0：开启，1：关闭】", yxWechatLive.getCloseComment());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }

    /**
     * 上传临时素材
     * @param wxMaService WxMaService
     * @param picPath 图片路径
     * @return WxMpMaterialUploadResult
     * @throws WxErrorException
     */
    private WxMediaUploadResult uploadPhotoToWx(WxMaService wxMaService, String picPath) throws WxErrorException {
        String filename = String.valueOf( (int)System.currentTimeMillis() ) + ".png";
        String downloadPath = uploadDirStr + filename;
        long size = HttpUtil.downloadFile(picPath, cn.hutool.core.io.FileUtil.file(downloadPath));
        picPath = downloadPath;
        File picFile = new File( picPath );
        log.info( "picFile name : {}", picFile.getName() );
        WxMediaUploadResult wxMediaUploadResult = wxMaService.getMediaService().uploadMedia( WxConsts.MediaFileType.IMAGE, picFile );
        log.info( "wxMpMaterialUploadResult : {}", JSONUtil.toJsonStr( wxMediaUploadResult ) );
        return wxMediaUploadResult;
    }
}
