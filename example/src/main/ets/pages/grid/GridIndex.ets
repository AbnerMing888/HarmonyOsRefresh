import { TitleBar } from "@abner/bar"
import { RouterPath, startPage } from "@abner/router"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:Grid网格列表
 * */

@RouterPath("example_GridIndex")
@Component
export struct GridIndex {
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:GridView组件名字数组
   */
  private girdViewNameArray = [
    "普通数据模式", "懒加载数据模式", "自适应高度(顶部)", "自适应高度(底部)", "下拉刷新", "上拉加载",
    "刷新&加载(普通数据)", "刷新&加载(懒加载数据)", "无阻尼", "最大阻尼","阻尼系数", "上拉加载不回弹",
    "底部暂无数据", "底部暂无数据固定", "添加头组件", "添加尾组件", "头和尾都有组件", "自定义刷新头加载尾",
    "页面吸顶(普通)", "页面吸顶(刷新&加载)", "页面顶部吸顶刷新", "任意布局吸顶",
    "结合Tabs使用", "自动刷新", "位置定位", "禁止后带阻尼", "自动加载数据", "网格拖拽"
  ]
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:GridView组件路由数组
   */
  private gridViewPathArray = [
    "example_GridViewPage",
    "example_GridViewLazyPage",
    "example_GridViewAdaptiveTopPage",
    "example_GridViewAdaptiveBottomPage",
    "example_GridViewRefreshPage", //下拉刷新
    "example_GridViewLoadMorePage", //上拉加载
    "example_GridViewRefreshAndLoadPage", //刷新&加载(普通数据)
    "example_GridViewLazyRefreshAndLoadPage", //刷新&加载(懒加载数据)
    "example_GridViewNoSpringPage",
    "example_GridViewMaxSpringPage", //最大阻尼
    "example_GridViewSpringRatioPage",//阻尼系数
    "example_GridViewNoReboundPage",
    "example_GridViewNoDataPage",
    "example_GridViewFixedBottomLoadPage", //底部暂无数据固定
    "example_GridViewHeaderPage", //添加头组件
    "example_GridViewFooterPage", //添加尾组件
    "example_GridViewHeaderAndFooterPage",
    "example_GridViewRefreshHeaderFooterPage",
    "example_GridViewStickyTopPage",
    "example_GridViewStickyRLTopPage", //页面吸顶(刷新&加载)
    "example_GridViewStickLayoutViewPage",
    "example_GridViewArbitrarilyStickyTopPage", //任意布局吸顶
    "example_GridViewTabsPage",
    "example_GridViewAutoRefreshPage", //自动刷新
    "example_GridViewPositioningPage", //位置定位
    "example_GridViewEnableSpringPage",
    "example_GridViewAutoLoadMorePage",
    "example_GridDropPage"//网格拖拽
  ]
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:GridLayout组件路由数组
   */
  private gridLayoutPathArray = [
    "example_GridLayoutPage",
    "example_GridLayoutLazyPage",
    "example_GridLayoutAdaptiveTopPage",
    "example_GridLayoutAdaptiveBottomPage",
    "example_GridLayoutRefreshPage",
    "example_GridLayoutLoadMorePage",
    "example_GridLayoutRefreshAndLoadPage",
    "example_GridLayoutLazyRefreshAndLoadPage",
    "example_GridLayoutNoSpringPage",
    "example_GridLayoutMaxSpringPage",
    "example_GridLayoutSpringRatioPage",
    "example_GridLayoutNoReboundPage",
    "example_GridLayoutNoDataPage",
    "example_GridLayoutFixedBottomLoadPage", //暂无数据，固定底部
    "example_GridLayoutHeaderPage",
    "example_GridLayoutFooterPage", //添加尾组件
    "example_GridLayoutHeaderAndFooterPage",
    "example_GridLayoutRefreshHeaderFooterPage",
    "example_GridLayoutStickyTopPage",
    "example_GridLayoutStickyRLTopPage",
    "example_GridLayoutStickLayoutViewPage", //页面顶部刷新
    "example_GridLayoutArbitrarilyStickyTopPage",
    "example_GridLayoutTabsPage",
    "example_GridLayoutAutoRefreshPage",
    "example_GridLayoutPositioningPage",
    "example_GridLayoutEnableSpringPage",
    "example_GridLayoutAutoLoadMorePage",
    "example_GridDropPage"//网格拖拽

  ]
  private gridInfo =
    "网格组件是针对系统Grid组件进行封装，支持刷新加载等多种功能，目的是简化代码，目前存在两个组件，一个是GridLayout，一个是GridView，其功能一样，大家可以选择使用。"
  @State gridMessage: string = "GridView"
  @State private isGridView: boolean = true
  @State nameArray: string[] = this.girdViewNameArray

  build() {
    Column() {
      TitleBar({
        title: "Grid网格组件"
      })

      Text(this.gridInfo)
        .fontColor($r("app.color.tab_normal_color"))
        .fontSize(13)
        .padding({ left: 20, right: 20 })
        .margin({ top: 10, bottom: 20 })

      this.SwichMenu()

      Grid() {
        ForEach(this.nameArray, (item: string, index: number) => {
          GridItem() {
            Text(item)
              .height(50)
              .width("100%")
              .fontSize(14)
              .fontColor($r("app.color.tab_select_color"))
              .textAlign(TextAlign.Center)
              .border({ color: $r("app.color.tab_select_color"), width: 1, radius: 5 })
              .onClick(() => {
                if (this.isGridView) {
                  startPage(this.gridViewPathArray[index])
                } else {
                  startPage(this.gridLayoutPathArray[index])
                }
              })
          }
        })
      }
      .width("100%")
      .height("100%")
      .layoutWeight(1)
      .columnsTemplate("1fr 1fr")
      .columnsGap(10)
      .rowsGap(10)
      .padding({ left: 20, right: 20, bottom: 20 })
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  SwichMenu() {
    Stack() {
      Column()
        .width("50%")
        .height("100%")
        .backgroundColor($r("app.color.tab_select_color"))
        .borderRadius(50)
        .offset({ x: !this.isGridView ? "50%" : 0 })
        .animation({ duration: 300 })

      Row() {
        Text("GridView")
          .fontSize(14)
          .layoutWeight(1)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(!this.isGridView ? $r("app.color.tab_select_color") : Color.White)
          .onClick(() => {
            this.isGridView = true
          })

        Text("GridLayout")
          .layoutWeight(1)
          .fontSize(14)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(!this.isGridView ? Color.White : $r("app.color.tab_select_color"))
          .onClick(() => {
            this.isGridView = false
          })
      }.height("100%")
    }
    .width(200)
    .height(40)
    .border({ width: 1, color: $r("app.color.tab_select_color") })
    .borderRadius(40)
    .margin({ top: 10, bottom: 20 })
    .alignContent(Alignment.TopStart)
  }
}