import { TitleBar } from "@abner/bar"
import { RouterPath, startPage } from "@abner/router"

@RouterPath("example_FlowIndex")
@Component
export struct FlowIndex {
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:GridView组件名字数组
   */
  private flowNameArray = [
    "普通数据模式", "懒加载数据模式", "自适应高度(顶部)", "自适应高度(底部)", "下拉刷新", "上拉加载",
    "刷新&加载(普通数据)", "刷新&加载(懒加载数据)", "无阻尼", "最大阻尼", "阻尼系数", "上拉加载不回弹",
    "底部暂无数据", "底部暂无数据固定", "添加头组件", "添加尾组件", "头和尾都有组件", "自定义刷新头加载尾",
    "页面吸顶(普通)", "页面吸顶(刷新&加载)", "页面顶部吸顶刷新", "固定标题栏吸顶", "任意布局吸顶",
    "结合Tabs使用", "自动刷新", "位置定位", "禁止后带阻尼", "自动加载数据"
  ]
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:GridView组件路由数组
   */
  private flowViewPathArray = [
    "example_FlowViewPage",
    "example_FlowViewLazyPage",
    "example_FlowViewAdaptiveTopPage",
    "example_FlowViewAdaptiveBottomPage",
    "example_FlowViewRefreshPage",
    "example_FlowViewLoadMorePage",
    "example_FlowViewRefreshAndLoadMorePage",
    "example_FlowViewLazyRefreshAndLoadMorePage",
    "example_FlowViewNoSpringPage",
    "example_FlowViewMaxSpringPage",
    "example_FlowViewSpringRatioPage",
    "example_FlowViewNoReboundPage",
    "example_FlowViewNoDataPage",
    "example_FlowViewFixedBottomPage", //底部暂无数据固定
    "example_FlowViewHeaderPage",
    "example_FlowViewFooterPage",
    "example_FlowViewHeaderAndFooterPage",
    "example_FlowViewRefreshHeaderAndFooterPage",
    "example_FlowViewStickyTopPage",
    "example_FlowViewStickyRLTopPage",
    "example_FlowViewTopActionBarPage",//顶部吸顶
    "example_FlowViewStickyTopActionBarPage",
    "example_FlowViewArbitrarilyStickyTopPage",
    "example_FlowViewTabsPage",
    "example_FlowViewAutoRefreshPage",
    "example_FlowViewPositioningPage",//定位
    "example_FlowViewEnableSpringPage",
    "example_FlowViewAutoLoadMorePage"
  ]
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:GridLayout组件路由数组
   */
  private flowLayoutPathArray = [
    "example_FlowLayoutPage",
    "example_FlowLayoutLazyPage",
    "example_FlowLayoutAdaptiveTopPage",
    "example_FlowLayoutAdaptiveBottomPage",
    "example_FlowLayoutRefreshPage",
    "example_FlowLayoutLoadMorePage",
    "example_FlowLayoutRefreshAndLoadMorePage",
    "example_FlowLayoutLazyRefreshAndLoadMorePage",
    "example_FlowLayoutNoSpringPage",
    "example_FlowLayoutMaxSpringPage",
    "example_FlowLayoutSpringRatioPage",
    "example_FlowLayoutNoReboundPage",
    "example_FlowLayoutNoDataPage",
    "example_FlowLayoutFixedBottomPage", //底部暂无数据固定
    "example_FlowLayoutHeaderPage",
    "example_FlowLayoutFooterPage",
    "example_FlowLayoutHeaderAndFooterPage", //头和尾
    "example_FlowLayoutRefreshHeaderAndFooterPage",
    "example_FlowLayoutStickyTopPage",
    "example_FlowLayoutStickyRLTopPage",
    "example_FlowLayoutTopActionBarPage",//顶部吸顶
    "example_FlowViewStickyTopActionBarPage",
    "example_FlowViewArbitrarilyStickyTopPage",
    "example_FlowViewTabsPage",
    "example_FlowViewAutoRefreshPage",
    "example_FlowLayoutPositioningPage",//定位
    "example_FlowLayoutEnableSpringPage",
    "example_FlowLayoutAutoLoadMorePage"
  ]
  private gridInfo =
    "瀑布流组件是针对系统WaterFlow组件进行封装，支持刷新加载等多种功能，目的是简化代码，目前存在两个组件，一个是StaggeredGridView，一个是WaterFlowLayout，其功能一样，大家可以选择使用。"
  @State gridMessage: string = "StaggeredGridView"
  @State private isWaterFlowLayout: boolean = false

  build() {
    Column() {
      TitleBar({
        title: "WaterFlow瀑布流组件"
      })

      Text(this.gridInfo)
        .fontColor($r("app.color.tab_normal_color"))
        .fontSize(13)
        .padding({ left: 20, right: 20 })
        .margin({ top: 10, bottom: 20 })

      this.SwichMenu()

      Grid() {
        ForEach(this.flowNameArray, (item: string, index: number) => {
          GridItem() {
            Text(item)
              .height(50)
              .width("100%")
              .fontSize(14)
              .fontColor($r("app.color.tab_select_color"))
              .textAlign(TextAlign.Center)
              .border({ color: $r("app.color.tab_select_color"), width: 1, radius: 5 })
              .onClick(() => {
                if (this.isWaterFlowLayout) {
                  startPage(this.flowLayoutPathArray[index])
                } else {
                  startPage(this.flowViewPathArray[index])
                }
              })
          }
        })
      }
      .width("100%")
      .height("100%")
      .layoutWeight(1)
      .columnsTemplate("1fr 1fr 1fr")
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
        .offset({ x: this.isWaterFlowLayout ? "50%" : 0 })
        .animation({ duration: 300 })

      Row() {
        Text("StaggeredGridView")
          .fontSize(14)
          .layoutWeight(1)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(this.isWaterFlowLayout ? $r("app.color.tab_select_color") : Color.White)
          .onClick(() => {
            this.isWaterFlowLayout = false
          })

        Text("WaterFlowLayout")
          .layoutWeight(1)
          .fontSize(14)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(this.isWaterFlowLayout ? Color.White : $r("app.color.tab_select_color"))
          .onClick(() => {
            this.isWaterFlowLayout = true
          })
      }.height("100%")
    }
    .width(300)
    .height(40)
    .border({ width: 1, color: $r("app.color.tab_select_color") })
    .borderRadius(40)
    .margin({ top: 10, bottom: 20 })
    .alignContent(Alignment.TopStart)
  }
}