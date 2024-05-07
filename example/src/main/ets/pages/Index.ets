import router from '@ohos.router'
import { ActionBar } from './ActionBar'
import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:Demo首页
 * */

@Entry
@Component
struct Index {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  private array: Array<string> = [
    "普通的列表ListView", "下拉刷新列表ListView", "下拉上下列表ListView", "带有头的ListView",
    "普通的列表GridView", "下拉刷新列表GridView", "下拉上下列表GridView", "带有头的GridView",
    "普通的瀑布流列表", "带有头的瀑布流列表",
    "任意组件", "侧滑展示按钮"
  ]
  private routerPaths: Array<string> = [
    "pages/list/ListViewPage",
    "pages/list/ListViewRefreshPage",
    "pages/list/ListViewUpAndDownPage",
    "pages/list/ListViewHeaderPage",
    "pages/grid/GridViewPage",
    "pages/grid/GridViewRefreshPage",
    "pages/grid/GridViewUpAndDownPage",
    "pages/grid/GridViewHeaderPage",
    "pages/staggered/StaggeredPage",
    "pages/staggered/StaggeredHeadPage",
    "pages/layout/LayoutViewPage",
    "pages/list/SlideMenuListViewPage"
  ]

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(item: Object, index: number): void {
    Text(item.toString())
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .onClick(() => {
        router.pushUrl({ url: this.routerPaths[index] })
      })
  }

  build() {
    Column() {
      ActionBar({ title: "首页", hiddenBack: true })

      ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
      })

    }.width('100%')
    .height('100%')
  }
}