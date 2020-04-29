package co.yixiang.modules.shop.service;

import co.yixiang.modules.shop.web.dto.ProductDTO;

public interface CreatShareProductService {

    String creatProductPic(ProductDTO productDTO,String qrcode,String spreadPicName,String spreadPicPath,String apiUrl);
}
