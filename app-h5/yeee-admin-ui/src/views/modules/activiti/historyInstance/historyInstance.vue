<template>
  <div class="mod-historyInstance">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="listData()">
      <el-form-item>
        <el-button size="small" @click="listData()">刷新列表</el-button>
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
    </el-table>
    <el-pagination v-if="this.gridOptions.isPage"
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageNo"
      :page-sizes="pageSizes"
      :page-size="pageSize"
      :total="total"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
  </div>
</template>

<script>
  import grid from '@/mixins/grid'
  export default {
    mixins: [grid],
    data () {
      return {
        gridOptions: {
          isQuery: false,
          listUrl: '/activiti7/instance/history/list'
        },
        dataForm: {}
      }
    },
    methods: {
    },
    components: {
    }
  }
</script>
