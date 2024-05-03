package vip.yeee.app.activiti7.manage.model;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * description......
 *
 * @author yeeee
 * @since 2024/5/1 17:50
 */
@Data
public class Top5InstanceCountRecent7DayVo {

    private List<String> dateList;

    private List<String> defNameList;

    private Map<String, List<Object>> defDayCountMap;
}
