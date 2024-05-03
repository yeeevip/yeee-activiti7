package vip.yeee.app.activiti7.manage.model;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * description......
 *
 * @author yeeee
 * @since 2024/5/1 17:52
 */
@Data
public class Top5InstanceCountTotalVo {

    private List<String> defNameList;

    private Map<String, Object> defCountMap;
}
