package co.yixiang.modules.wechat.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.util.json.WxMaGsonBuilder;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import co.yixiang.modules.wechat.service.WxMaLiveGoodsService;
import co.yixiang.modules.wechat.service.dto.WxMaLiveInfo;
import co.yixiang.modules.wechat.service.dto.WxMaLiveResult;
import co.yixiang.tools.config.WxMaConfiguration;
import co.yixiang.utils.GsonParser;
import com.google.common.base.Joiner;
import com.google.common.collect.ImmutableMap;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.WxType;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.bean.result.WxMediaUploadResult;
import me.chanjar.weixin.common.error.WxError;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class WxMaLiveGoodsServiceImpl implements WxMaLiveGoodsService {

    @Value("${file.path}")
    private String uploadDirStr;
    @Override
    public WxMaLiveResult addGoods(WxMaLiveInfo.Goods goods) throws WxErrorException {
        Map<String, Object> map = new HashMap<>(2);
        map.put("goodsInfo", goods);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveGoodsService.ADD_GOODS, WxMaGsonBuilder.create().toJson(map));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return WxMaLiveResult.fromJson(jsonObject.toString());
    }

    @Override
    public boolean resetAudit(Integer auditId, Integer goodsId) throws WxErrorException {
        Map<String, Integer> map = new HashMap<>(4);
        map.put("auditId", auditId);
        map.put("goodsId", goodsId);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveGoodsService.RESET_AUDIT_GOODS, WxMaGsonBuilder.create().toJson(map));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return true;
    }

    @Override
    public String auditGoods(Integer goodsId) throws WxErrorException {
        Map<String, Integer> map = new HashMap<>(2);
        map.put("goodsId", goodsId);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveGoodsService.AUDIT_GOODS, WxMaGsonBuilder.create().toJson(map));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return jsonObject.get("auditId").getAsString();
    }

    @Override
    public boolean deleteGoods(Integer goodsId) throws WxErrorException {
        Map<String, Integer> map = new HashMap<>(2);
        map.put("goodsId", goodsId);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveGoodsService.DELETE_GOODS, WxMaGsonBuilder.create().toJson(map));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return true;
    }

    @Override
    public boolean updateGoods(WxMaLiveInfo.Goods goods) throws WxErrorException {
        Map<String, Object> map = new HashMap<>(2);
        map.put("goodsInfo", goods);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveGoodsService.UPDATE_GOODS, WxMaGsonBuilder.create().toJson(map));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return true;
    }

    @Override
    public WxMaLiveResult getGoodsWareHouse(List<Integer> goodsIds) throws WxErrorException {
        Map<String, Object> map = new HashMap<>(2);
        map.put("goods_ids", goodsIds);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveGoodsService.GET_GOODS_WARE_HOUSE, WxMaGsonBuilder.create().toJson(map));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return WxMaLiveResult.fromJson(jsonObject.toString());
    }

    @Override
    public WxMaLiveResult getApprovedGoods(Integer offset, Integer limit, Integer status) throws WxErrorException {
        ImmutableMap<String, ? extends Serializable> params = ImmutableMap.of("status", status, "offset", offset, "limit", limit);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.get(WxMaLiveGoodsService.GET_APPROVED_GOODS, Joiner.on("&").withKeyValueSeparator("=").join(params));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        JsonArray goodsArr = jsonObject.getAsJsonArray("goods");
        if (goodsArr.size() > 0) {
            for (int i = 0; i < goodsArr.size(); i++) {
                // 接口返回key是驼峰
                JsonObject goods = (JsonObject) goodsArr.get(i);
                goods.addProperty("goods_id", goods.get("goodsId").getAsInt());
                goods.addProperty("cover_img_url", goods.get("coverImgUrl").getAsString());
                goods.addProperty("price_type", goods.get("priceType").getAsInt());
                goods.addProperty("third_party_tag", goods.get("thirdPartyTag").getAsInt());
                goods.addProperty("audit_status", status);
            }
        }
        return WxMaLiveResult.fromJson(jsonObject.toString());
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
