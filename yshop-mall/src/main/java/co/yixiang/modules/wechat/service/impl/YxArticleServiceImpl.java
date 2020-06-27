/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.wechat.service.impl;

import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.utils.QueryHelpPlus;
import co.yixiang.dozer.service.IGenerator;
import co.yixiang.modules.product.domain.YxStoreProduct;
import co.yixiang.modules.wechat.domain.YxArticle;
import co.yixiang.modules.wechat.service.YxArticleService;
import co.yixiang.modules.wechat.service.mapper.ArticleMapper;


import co.yixiang.modules.wechat.service.dto.YxArticleDto;
import co.yixiang.modules.wechat.service.dto.YxArticleQueryCriteria;


import co.yixiang.modules.wechat.vo.YxArticleQueryVo;
import co.yixiang.utils.FileUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;



/**
* @author hupeng
* @date 2020-05-12
*/
@Slf4j
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class YxArticleServiceImpl extends BaseServiceImpl<ArticleMapper, YxArticle> implements YxArticleService {

    private final IGenerator generator;
    private final ArticleMapper articleMapper;
    @Value("${file.path}")
    private String uploadDirStr;

    public YxArticleServiceImpl(IGenerator generator,ArticleMapper articleMapper) {
        this.generator = generator;
        this.articleMapper = articleMapper;
    }

    /**
     * 获取文章列表
     * @param page 页码
     * @param limit 条数
     * @return List
     */
    @Override
    public List<YxArticleQueryVo> getList(int page, int limit){
        Page<YxArticle> pageModel = new Page<>(page, limit);

        IPage<YxArticle> pageList = articleMapper.selectPage(pageModel, Wrappers.<YxArticle>lambdaQuery()
                .orderByDesc(YxArticle::getId));

        return generator.convert(pageList.getRecords(),YxArticleQueryVo.class);
    }

    /**
     * 获取文章详情
     * @param id id
     * @return YxArticleQueryVo
     */
    @Override
    public YxArticleQueryVo getDetail(int id){
        return generator.convert(this.getById(id),YxArticleQueryVo.class);
    }


    @Override
    public void incVisitNum(int id) {
        articleMapper.incVisitNum(id);
    }

    @Override
    //@Cacheable
    public Map<String, Object> queryAll(YxArticleQueryCriteria criteria, Pageable pageable) {
        getPage(pageable);
        PageInfo<YxArticle> page = new PageInfo<>(queryAll(criteria));
        Map<String, Object> map = new LinkedHashMap<>(2);
        map.put("content", generator.convert(page.getList(), YxArticleDto.class));
        map.put("totalElements", page.getTotal());
        return map;
    }


    @Override
    //@Cacheable
    public List<YxArticle> queryAll(YxArticleQueryCriteria criteria){
        return baseMapper.selectList(QueryHelpPlus.getPredicate(YxArticle.class, criteria));
    }


    @Override
    public void download(List<YxArticleDto> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (YxArticleDto yxArticle : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("分类id", yxArticle.getCid());
            map.put("文章标题", yxArticle.getTitle());
            map.put("文章作者", yxArticle.getAuthor());
            map.put("文章图片", yxArticle.getImageInput());
            map.put("文章简介", yxArticle.getSynopsis());
            map.put(" content",  yxArticle.getContent());
            map.put("文章分享标题", yxArticle.getShareTitle());
            map.put("文章分享简介", yxArticle.getShareSynopsis());
            map.put("浏览次数", yxArticle.getVisit());
            map.put("排序", yxArticle.getSort());
            map.put("原文链接", yxArticle.getUrl());
            map.put("状态", yxArticle.getStatus());
            map.put("是否隐藏", yxArticle.getHide());
            map.put("管理员id", yxArticle.getAdminId());
            map.put("商户id", yxArticle.getMerId());
            map.put("产品关联id", yxArticle.getProductId());
            map.put("是否热门(小程序)", yxArticle.getIsHot());
            map.put("是否轮播图(小程序)", yxArticle.getIsBanner());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }

    @Override
    public void uploadNews(YxArticleDto yxArticleDTO){

    }

//    @Override
//    public void uploadNews(YxArticleDto wxNewsArticleItem) throws WxErrorException {
//
//        WxMpService wxMpService = WxMpConfiguration.getWxMpService();
//
//        WxMpMaterialNews wxMpMaterialNews = new WxMpMaterialNews();
//
//
//        WxMpMaterialNews.WxMpMaterialNewsArticle article = new WxMpMaterialNews.WxMpMaterialNewsArticle();
//
//        WxMpMaterialUploadResult wxMpMaterialUploadResult = uploadPhotoToWx( wxMpService,
//                wxNewsArticleItem.getImageInput() );
//        wxNewsArticleItem.setThumbMediaId( wxMpMaterialUploadResult.getMediaId() );
//
//        article.setAuthor( wxNewsArticleItem.getAuthor() );
//
//
//        //处理content
//        String content = processContent(wxMpService, wxNewsArticleItem.getContent());
//        System.out.println(content);
//        article.setContent( content );
//        article.setContentSourceUrl( wxNewsArticleItem.getUrl() );
//        article.setDigest( wxNewsArticleItem.getSynopsis() );
//        article.setShowCoverPic( true );
//        article.setThumbMediaId( wxNewsArticleItem.getThumbMediaId() );
//        article.setTitle( wxNewsArticleItem.getTitle() );
//        //TODO 暂时注释掉，测试号没有留言权限
//        //article.setNeedOpenComment( wxNewsArticleItem );
//        //article.setOnlyFansCanComment( wxNewsArticleItem );
//        wxMpMaterialNews.addArticle( article );
//
//        log.info( "wxMpMaterialNews : {}", JSONUtil.toJsonStr( wxMpMaterialNews ) );
//
//        WxMpMaterialUploadResult wxMpMaterialUploadResult1 = wxMpService.getMaterialService()
//                .materialNewsUpload( wxMpMaterialNews );
//
//        //推送开始
//        WxMpMassTagMessage massMessage = new WxMpMassTagMessage();
//        massMessage.setMsgType(WxConsts.MassMsgType.MPNEWS);
//        massMessage.setMediaId(wxMpMaterialUploadResult1.getMediaId());
//        massMessage.setSendAll(true);
//
//        WxMpMassSendResult massResult = wxMpService.getMassMessageService()
//                .massGroupMessageSend(massMessage);
//        if(!massResult.getErrorCode().equals("0")) {
//            log.info("error:"+massResult.getErrorMsg());
//            throw new ErrorRequestException("发送失败");
//        }
//
//        log.info( "massResult : {}", JSONUtil.toJsonStr( massResult ) );
//
//        log.info( "wxMpMaterialUploadResult : {}", JSONUtil.toJsonStr( wxMpMaterialUploadResult1 ) );
//    }
//
//
//    private WxMpMaterialUploadResult uploadPhotoToWx(WxMpService wxMpService, String picPath) throws WxErrorException {
//        WxMpMaterial wxMpMaterial = new WxMpMaterial();
//
//        String filename = String.valueOf( (int)System.currentTimeMillis() ) + ".png";
//        String downloadPath = uploadDirStr + filename;
//        long size = HttpUtil.downloadFile(picPath, cn.hutool.core.io.FileUtil.file(downloadPath));
//        picPath = downloadPath;
//        File picFile = new File( picPath );
//        wxMpMaterial.setFile( picFile );
//        wxMpMaterial.setName( picFile.getName() );
//        log.info( "picFile name : {}", picFile.getName() );
//        WxMpMaterialUploadResult wxMpMaterialUploadResult = wxMpService.getMaterialService().materialFileUpload( WxConsts.MediaFileType.IMAGE, wxMpMaterial );
//        log.info( "wxMpMaterialUploadResult : {}", JSONUtil.toJsonStr( wxMpMaterialUploadResult ) );
//        return wxMpMaterialUploadResult;
//    }
//
//    private String processContent(WxMpService wxMpService,String content) throws WxErrorException {
//        if(StringUtils.isBlank( content )){
//            return content;
//        }
//        String imgReg = "<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>";
//        List<String> imgList = ReUtil.findAllGroup1( imgReg,content);
//        for (int j = 0; j < imgList.size(); j++) {
//            String imgSrc = imgList.get( j );
//            String filepath = URLUtils.getParam( imgSrc,"filepath" );
//
//            if(StringUtils.isBlank( filepath )){//网络图片URL，需下载到本地
//                String filename = String.valueOf( System.currentTimeMillis() ) + ".png";
//                String downloadPath = uploadDirStr + filename;
//                long size = HttpUtil.downloadFile(imgSrc, cn.hutool.core.io.FileUtil.file(downloadPath));
//                filepath = downloadPath;
//            }
//            WxMediaImgUploadResult wxMediaImgUploadResult = wxMpService.getMaterialService().mediaImgUpload( new File(filepath) );
//            content = StringUtils.replace( content,imgList.get( j ),wxMediaImgUploadResult.getUrl());
//        }
//        return content;
//    }
}
