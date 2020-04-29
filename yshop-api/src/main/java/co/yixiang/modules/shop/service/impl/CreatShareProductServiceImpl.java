package co.yixiang.modules.shop.service.impl;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ObjectUtil;
import co.yixiang.modules.shop.service.CreatShareProductService;
import co.yixiang.modules.shop.web.dto.ProductDTO;
import co.yixiang.modules.user.entity.YxSystemAttachment;
import co.yixiang.modules.user.service.YxSystemAttachmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.UUID;

@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class CreatShareProductServiceImpl implements CreatShareProductService {

    private final YxSystemAttachmentService systemAttachmentService;

    public  String creatProductPic(ProductDTO productDTO,String shareCode,String spreadPicName,String spreadPicPath,String apiUrl) {
        YxSystemAttachment attachmentT = systemAttachmentService.getInfo(spreadPicName);
        String spreadUrl = "";
        if(ObjectUtil.isNull(attachmentT)){
            //创建图片
            BufferedImage img = new BufferedImage(750, 1334, BufferedImage.TYPE_INT_RGB);
            //开启画图
            Graphics g = img.getGraphics();
            //背景 -- 读取互联网图片
            BufferedImage back = null;
            InputStream stream =  getClass().getClassLoader().getResourceAsStream("background.png");
            try {
                ImageInputStream background = ImageIO.createImageInputStream(stream);
                back = ImageIO.read(background);
            } catch (IOException e) {
                e.printStackTrace();
            }

            g.drawImage(back.getScaledInstance(750, 1334, Image.SCALE_DEFAULT), 0, 0, null); // 绘制缩小后的图
            //商品  banner图
            //读取互联网图片
            BufferedImage priductUrl = null;
            try {
                priductUrl = ImageIO.read(new URL(productDTO.getStoreInfo().getImage_base()));
            } catch (IOException e) {
                e.printStackTrace();
            }
            g.drawImage(priductUrl.getScaledInstance(690,516,Image.SCALE_DEFAULT),29,61,null);
            //文案标题
            g.setFont(new Font("微软雅黑", Font.BOLD, 34));
            g.setColor(new Color(29,29,29));
            //绘制文字
            g.drawString(productDTO.getStoreInfo().getStoreName(), 31, 638);
            //文案
            g.setFont(new Font("微软雅黑", Font.PLAIN, 30));
            g.setColor(new Color(47,47,47));
            int fontlen = getWatermarkLength(productDTO.getStoreInfo().getStoreInfo(), g);
            //文字长度相对于图片宽度应该有多少行
            int line = fontlen / (back.getWidth() - 90);
            //高度
            int y = back.getHeight() - (line + 1) * 30 + 200;
            //文字叠加,自动换行叠加
            int tempX = 32;
            int tempY = y;
            //单字符长度
            int tempCharLen = 0;
            //单行字符总长度临时计算
            int tempLineLen = 0;
            StringBuffer sb =new StringBuffer();
            for(int i=0; i < productDTO.getStoreInfo().getStoreInfo().length(); i++) {
                char tempChar = productDTO.getStoreInfo().getStoreInfo().charAt(i);
                tempCharLen = getCharLen(tempChar, g);
                tempLineLen += tempCharLen;
                if(tempLineLen >= (back.getWidth()-90)) {
                    //长度已经满一行,进行文字叠加
                    g.drawString(sb.toString(), tempX, tempY + 50);
                    //清空内容,重新追加
                    sb.delete(0, sb.length());
                    //每行文字间距50
                    tempY += 50;
                    tempLineLen =0;
                }
                //追加字符
                sb.append(tempChar);
            }
            //最后叠加余下的文字
            g.drawString(sb.toString(), tempX, tempY + 50);

            //价格背景
            //读取互联网图片
            BufferedImage bground  = null;//
            InputStream redStream =  getClass().getClassLoader().getResourceAsStream("red.jpg");
            try {
                ImageInputStream red = ImageIO.createImageInputStream(redStream);
                bground = ImageIO.read(red);
            } catch (IOException e) {
                e.printStackTrace();
            }
            // 绘制缩小后的图
            g.drawImage(bground.getScaledInstance(160, 40, Image.SCALE_DEFAULT), 30, 1053, null);

            //限时促销价
            g.setFont(new Font("微软雅黑", Font.PLAIN, 24));
            g.setColor(new Color(255,255,255));
            g.drawString("限时促销价", 50, 1080);

            //价格
            g.setFont(new Font("微软雅黑", Font.PLAIN, 50));
            g.setColor(new Color(249,64,64));
            g.drawString("¥" +productDTO.getStoreInfo().getPrice(), 29, 1162);

            //原价
            g.setFont(new Font("微软雅黑", Font.PLAIN, 36));
            g.setColor(new Color(171,171,171));
            String price = "¥" + productDTO.getStoreInfo().getOtPrice();
            g.drawString(price, 260, 1160);
            g.drawLine(250,1148,260+150,1148);

            //商品名称
            g.setFont(new Font("微软雅黑", Font.PLAIN, 32));
            g.setColor(new Color(29,29,29));
            g.drawString(productDTO.getStoreInfo().getStoreName(), 30, 1229);

            //生成二维码返回链接
            String url = shareCode;
            //读取互联网图片
            BufferedImage qrCode  = null;
            try {
                qrCode = ImageIO.read(new URL(url));
            } catch (IOException e) {
                e.printStackTrace();
            }
            // 绘制缩小后的图
            g.drawImage(qrCode.getScaledInstance(174, 174, Image.SCALE_DEFAULT), 536, 1057, null);

            //二维码字体
            g.setFont(new Font("微软雅黑", Font.PLAIN, 25));
            g.setColor(new Color(171,171,171));
            //绘制文字
            g.drawString("扫描或长按小程序码", 515, 1260);

            g.dispose();
            //先将画好的海报写到本地
            File file = new File(spreadPicPath);
            try {
                ImageIO.write(img, "jpg",file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            systemAttachmentService.attachmentAdd(spreadPicName,
                    String.valueOf(FileUtil.size(new File(spreadPicPath))),
                    spreadPicPath,"qrcode/"+spreadPicName);
            spreadUrl = apiUrl + "/api/file/qrcode/"+spreadPicName;
            //保存到本地 生成文件名字
        }else {
            spreadUrl = apiUrl + "/api/file/" + attachmentT.getSattDir();
        }

        return spreadUrl;
    }


    /**
     * 获取水印文字总长度
     *@paramwaterMarkContent水印的文字
     *@paramg
     *@return水印文字总长度
     */
    public static int getWatermarkLength(String waterMarkContent, Graphics g) {
        return g.getFontMetrics(g.getFont()).charsWidth(waterMarkContent.toCharArray(),0, waterMarkContent.length());
    }
    public static int getCharLen(char c, Graphics g) {
        return g.getFontMetrics(g.getFont()).charWidth(c);
    }
}
