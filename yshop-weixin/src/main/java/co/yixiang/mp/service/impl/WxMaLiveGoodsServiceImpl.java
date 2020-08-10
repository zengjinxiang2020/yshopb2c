package co.yixiang.mp.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.util.json.WxMaGsonBuilder;
import co.yixiang.mp.bean.WxMaLiveInfo;
import co.yixiang.mp.bean.WxMaLiveResult;
import co.yixiang.mp.config.WxMaConfiguration;
import co.yixiang.mp.service.WxMaLiveGoodsService;
import co.yixiang.utils.GsonParser;
import com.google.common.base.Joiner;
import com.google.common.collect.ImmutableMap;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import lombok.AllArgsConstructor;
import me.chanjar.weixin.common.WxType;
import me.chanjar.weixin.common.error.WxError;
import me.chanjar.weixin.common.error.WxErrorException;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@AllArgsConstructor
public class WxMaLiveGoodsServiceImpl implements WxMaLiveGoodsService {

    @Override
    public WxMaLiveResult addGoods(WxMaLiveInfo.Goods goods) throws WxErrorException {
        Map<String, Object> map = new HashMap<>(2);
        map.put("goodsInfo", goods);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(ADD_GOODS, WxMaGsonBuilder.create().toJson(map));
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
        String responseContent = wxMaService.post(RESET_AUDIT_GOODS, WxMaGsonBuilder.create().toJson(map));
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
        String responseContent = wxMaService.post(AUDIT_GOODS, WxMaGsonBuilder.create().toJson(map));
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
        String responseContent = wxMaService.post(DELETE_GOODS, WxMaGsonBuilder.create().toJson(map));
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
        String responseContent = wxMaService.post(UPDATE_GOODS, WxMaGsonBuilder.create().toJson(map));
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
        String responseContent = wxMaService.post(GET_GOODS_WARE_HOUSE, WxMaGsonBuilder.create().toJson(map));
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
        String responseContent = wxMaService.get(GET_APPROVED_GOODS, Joiner.on("&").withKeyValueSeparator("=").join(params));
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

}
