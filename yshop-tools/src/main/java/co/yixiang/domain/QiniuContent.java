package co.yixiang.domain;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.sql.Timestamp;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Entity
@Data
@Table(name="qiniu_content")
public class QiniuContent implements Serializable {

    /** ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;


    /** Bucket 识别符 */
    @Column(name = "bucket")
    private String bucket;


    /** 文件名称 */
    @Column(name = "name")
    private String name;


    /** 文件大小 */
    @Column(name = "size")
    private String size;


    /** 文件类型：私有或公开 */
    @Column(name = "type")
    private String type;


    /** 上传或同步的时间 */
    @Column(name = "update_time")
    @TableField(fill= FieldFill.INSERT_UPDATE)
    private Timestamp updateTime;


    /** 文件url */
    @Column(name = "url")
    private String url;


    @Column(name = "suffix")
    private String suffix;


    public void copy(QiniuContent source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}