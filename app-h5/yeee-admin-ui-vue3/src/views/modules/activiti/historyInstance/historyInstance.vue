<template>
  <div class="mod-historyInstance">
    <el-form :inline="true" :model="dataForm" @keyup.enter="listData()">
      <el-form-item>
        <el-button size="default" @click="listData()">查询</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="dataList" border stripe v-loading="dataListLoading" :max-height="tableHeight"
            @selection-change="selectionChangeHandle" @sort-change="sortChangeHandle" style="width: 100%;">
      <el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
      <el-table-column prop="id" label="ID" header-align="center" align="center"></el-table-column>
      <el-table-column prop="processDefinitionKey" label="流程定义KEY" header-align="center" align="center"></el-table-column>
      <el-table-column prop="definitionName" label="流程定义名称" header-align="center" align="center"></el-table-column>
      <el-table-column prop="startTime" label="开始时间" header-align="center" align="center"></el-table-column>
      <el-table-column prop="endTime" label="结束时间" header-align="center" align="center"></el-table-column>
      <el-table-column prop="duration" label="审批用时" header-align="center" align="center"></el-table-column>
      <el-table-column label="操作" fixed="right" header-align="center" align="center" width="80">
        <template #default="scope">
          <el-button type="text" size="small" @click="lookBpmn(scope.row.deploymentId, scope.row.resourceName, scope.row.id)" :icon="Document" title="查看">查看</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination v-if="this.gridOptions.isPage"
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageNo"
      :page-sizes="pageSizes"
      :page-size="pageSize"
      :total="total"
      layout="->, total, sizes, prev, pager, next, jumper">
    </el-pagination>
  </div>
</template>

<script>
  import grid from '@/mixins/grid'
  import * as index from "@/utils";
  import { Document } from '@element-plus/icons-vue'
  import { markRaw } from 'vue'
  export default {
    mixins: [grid],
    data () {
      return {
        gridOptions: {
          isQuery: false,
          listUrl: '/activiti7/instance/history/list'
        },
        dataForm: {},
        // 图标组件（使用 markRaw 避免响应式包装）
        Document: markRaw(Document)
      }
    },
    methods: {
      lookBpmn (depId, rName, instanceId) {
        let api = index.baseUrl2()
        let token = localStorage.getItem('yeee-manageweb-token')
        window.open(api + 'activiti-editor/index.html?type=lookBpmn&deploymentFileUUID=' + depId + '&deploymentName=' + rName+ '&instanceId=' + instanceId + '&tt=' + token, '_blank')
      }
    },
    components: {
    }
  }
</script>
