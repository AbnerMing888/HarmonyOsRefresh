import router from '@ohos.router'
import { ActionBar } from './ActionBar'
import { GridView, RefreshController } from '@abner/refresh'

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
    "普通的列表ListView", "下拉刷新列表ListView", "刷新加载列表ListView", "带有头的ListView",
    "侧滑展示按钮", "系统侧滑按钮", "侧滑删除", "列表分组吸顶",
    "普通的网格列表", "下拉刷新网格列表", "刷新加载网格列表", "带有头的网格列表",
    "普通的瀑布流列表", "带有头的瀑布流列表",
    "任意组件", "下滑进入二楼", "二楼应用场景", "普通加载数据操作", "懒加载数据操作",
    "列表页面吸顶", "列表顶部吸顶刷新", "瀑布流页面吸顶", "缺省页", "结合Tabs使用"
  ]
  private routerPaths: Array<string> = [
    "pages/list/ListViewLazyPage",
    "pages/list/ListViewRefreshPage",
    "pages/list/ListViewUpAndDownLazyPage", //普通的列表下拉刷新和上拉加载
    "pages/list/ListViewHeaderPage", //带有头的ListView
    "pages/list/SlideMenuListViewPage", //侧滑展示按钮
    "pages/list/SwipeActionListViewPage", //系统侧滑按钮
    "pages/list/SlideDeleteListViewPage", //侧滑删除
    "pages/group/ListItemGroupPage", //列表分组吸顶
    "pages/grid/GridViewPage", //普通的网格列表
    "pages/grid/GridViewRefreshPage", //下拉刷新网格列表
    "pages/grid/GridViewUpAndDownLazyPage", //刷新加载网格列表
    "pages/grid/GridViewHeaderPage", //带有头的网格列表
    "pages/staggered/StaggeredLazyPage", //普通的瀑布流列表
    "pages/staggered/StaggeredHeadPage", //带有头的瀑布流列表
    "pages/layout/LayoutViewPage", //任意组件
    "pages/floor/SecondFloorPage", //下滑进入二楼
    "pages/floor/example/SecondFloorExample", //二楼应用场景
    "pages/data/DataOperationPage", //普通加载数据操作
    "pages/data/LazyDataOperationPage", //懒加载数据操作
    "pages/sticky/StickyTopPage", //列表页面吸顶
    "pages/layout/StickLayoutViewPage", //列表顶部吸顶刷新
    "pages/sticky/StickyTopStaggeredPage", //瀑布流页面吸顶
    "pages/default/ErrorOrEmptyPage", //缺省页
    "pages/tabs/TabsPage",//结合Tabs使用
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
      .margin({ left: "2.5%", top: 10 })
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .onClick(() => {
        router.pushUrl({ url: this.routerPaths[index] })
      })
  }

  build() {
    Column() {
      ActionBar({ title: "首页", hiddenBack: true })

      GridView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
      })

    }.width('100%')
    .height('100%')
  }
}