<template>
  <div class="mod-task">
    <el-form :inline="true" :model="dataForm" @keyup.enter="listData()">
      <el-form-item>
        <el-button size="default" @click="listData()">查询</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="dataList" border stripe v-loading="dataListLoading" :max-height="tableHeight"
            @selection-change="selectionChangeHandle" @sort-change="sortChangeHandle" style="width: 100%;">
      <el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
      <el-table-column prop="id" label="ID" header-align="center" align="center"></el-table-column>
      <el-table-column prop="instanceName" label="流程名称" header-align="center" align="center"></el-table-column>
      <el-table-column prop="name" label="任务节点名称" header-align="center" align="center"></el-table-column>
      <el-table-column prop="assignee" label="办理人" header-align="center" align="center"></el-table-column>
      <el-table-column prop="endDate" label="完成时间" header-align="center" align="center"></el-table-column>
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
  export default {
    mixins: [grid],
    data () {
      return {
        gridOptions: {
          isQuery: false,
          listUrl: '/activiti7/task/history/list'
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
