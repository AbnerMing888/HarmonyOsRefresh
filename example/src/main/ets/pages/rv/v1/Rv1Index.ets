import { TitleBar } from "@abner/bar"
import { GridView } from "@abner/refresh"
import { RouterPath, startPage } from "@abner/router"

@RouterPath("example_Rv1Index")
@Component
export struct Rv1Index {
  private mGridData: string[] = ["任意组件刷新", "List组件刷新", "Grid组件刷新",
    "WaterFlow组件刷新", "自定义刷新头尾", "自动下拉刷新",
    "无阻尼效果", "最大阻尼", "加载数据不回弹", "显示暂无数据", "固定暂无数据", "刷新不禁止拖动",
    "懒加载封装使用", "沉浸式", "自适应高度(顶部)", "自适应高度(底部)", "自动加载数据"]
  private mRouterData: string[] = [
    "example_Rv1RefreshUpAndDownPage", "example_Rv1ListUpAndDownPage", "example_Rv1GridUpAndDownPage",
    "example_Rv1WaterFlowUpAndDownPage", "example_Rv1RefreshHeaderAndFooterPage",
    "example_Rv1AutoRefreshPage", "example_Rv1NoScrollSpringPage", "example_Rv1MaxScrollSpringPage",
    "example_Rv1LoadDataSpringBackPage",
    "example_Rv1FooterNothingPage", "example_Rv1FixedFooterPage", "example_Rv1RefreshScrollPage",
    "example_Rv1LazyDataOperationPage", "example_Rv1RefreshImmersivePage"
    , "example_Rv1AdaptiveHeightPage", "example_Rv1MultiViewPage", "example_Rv1AutoListUpAndDownPage"
  ]

  build() {
    Column() {
      TitleBar({ title: "RefreshView(v1装饰器)" })
      GridView({
        items: this.mGridData,
        itemLayout: (item: Object, index: number) => {
          this.itemLayout(item as string, index)
        },
        gridAttribute: (attr) => {
          attr.columnsGap = 10
          attr.rowsGap = 10
          attr.padding = { left: 20, right: 20, bottom: 20 }
        }
      })
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  itemLayout(item: string, index: number) {
    Text(item)
      .width("100%")
      .height(50)
      .textAlign(TextAlign.Center)
      .fontColor($r("app.color.tab_select_color"))
      .fontSize(14)
      .border({ width: 1, color: $r("app.color.tab_select_color"), radius: 5 })
      .onClick(() => {
        startPage(this.mRouterData[index])
      })
  }
}