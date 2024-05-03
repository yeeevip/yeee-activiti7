package vip.yeee.app.activiti7.manage.model;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * description......
 *
 * @author yeeee
 * @since 2024/5/1 18:34
 */
@Data
public class TaskCountRecent3DayVo {

    private List<String> dateList;

    private Map<String, Map<String, Object>> taskCountMap;
}
