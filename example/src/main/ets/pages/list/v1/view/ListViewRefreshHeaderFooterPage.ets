import { TitleBar } from '@abner/bar'
import {
  ListView,
  LoadMoreLayoutStatusModel,
  RefreshController,
  RefreshDataSource,
  RefreshLayoutStatusModel
} from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/3
 * INTRODUCE:自定义刷新头和加载尾部
 * */

@RouterPath("example_ListViewRefreshHeaderFooterPage")
@Component
export struct ListViewRefreshHeaderFooterPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource() //懒加载数据

  aboutToAppear() {
    this.lazyDataSource.initData(this.getArray())
  }

  private getArray(): Array<number> {
    let array: Array<number> = []
    for (let i = 0; i < 50; i++) {
      array.push(i)
    }
    return array
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(_: Object, index: number): void {
    ListItemView({ index: index })
  }

  /**
   * Author:AbnerMing
   * Describe:自定义刷新头
   */
  @Builder
  headerRefreshLayout(model: RefreshLayoutStatusModel) {
    Text("当前状态：" + model.status)
      .width("100%")
      .textAlign(TextAlign.Center)
      .height(80)
      .fontColor(Color.White)
      .backgroundColor($r("app.color.tab_select_color"))
  }

  /**
   * Author:AbnerMing
   * Describe:自定义加载尾部
   */
  @Builder
  footerLoadLayout(model: LoadMoreLayoutStatusModel) {
    Text("当前状态：" + model.status)
      .width("100%")
      .textAlign(TextAlign.Center)
      .height(80)
      .fontColor(Color.White)
      .backgroundColor($r("app.color.tab_select_color"))
  }

  build() {
    Column() {
      TitleBar({ title: "自定义刷新头和加载尾部" })
      ListView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: (item, index) => this.itemLayout(item, index),
        headerRefreshLayout: this.headerRefreshLayout, //刷新头
        footerLoadLayout: this.footerLoadLayout, //加载尾
        controller: this.controller, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 2000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            //模拟耗时
            this.controller.finishLoadMore()
          }, 2000)
        }
      })
    }
  }
}