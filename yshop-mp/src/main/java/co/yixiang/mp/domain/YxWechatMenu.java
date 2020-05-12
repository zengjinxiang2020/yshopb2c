package co.yixiang.mp.domain;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;

/**
* @author xuwenbo
* @date 2020-05-12
*/
@Entity
@Data
@Table(name="yx_wechat_menu")
public class YxWechatMenu implements Serializable {

    @Id
    @Column(name = "key")
    private String key;


    /** 缓存数据 */
    @Column(name = "result")
    private String result;


    /** 缓存时间 */
    @Column(name = "add_time")
    private Integer addTime;


    public void copy(YxWechatMenu source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}