import { TitleBar } from "@abner/bar";
import { RouterPath, startPage } from "@abner/router"


@RouterPath("example_ListIndex")
@Component
export struct ListIndex {
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:List组件名字数组
   */
  private listNameArray = [
    "普通数据模式", "懒加载数据模式", "自适应高度(顶部)", "自适应高度(底部)", "下拉刷新", "上拉加载",
    "刷新&加载(普通数据)", "刷新&加载(懒加载数据)", "无阻尼", "最大阻尼", "阻尼系数", "上拉加载不回弹",
    "底部暂无数据", "底部暂无数据固定", "添加头组件", "添加尾组件", "头和尾都有组件", "自定义刷新头加载尾", "侧滑按钮",
    "侧滑直接删除", "列表分组&吸顶",
    "分组吸顶(带分组索引)", "列表分组不吸顶", "页面吸顶(普通)", "页面吸顶(刷新&加载)", "页面顶部吸顶刷新",
    "任意布局吸顶", "结合Tabs使用", "自动刷新",
    "位置定位", "禁止后带阻尼", "自动加载数据", "普通加载数据操作", "懒加载数据操作", "缺省页"
  ]
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:ListView组件路由数组
   */
  private listViewPathArray = [
    "example_ListViewPage", //普通数据模式
    "example_ListViewLazyPage", //懒加载数据模式
    "example_ListViewAdaptivePage", //自适应高度顶部
    "example_ListViewAdaptivePage2", //自适应高度底部
    "example_ListViewRefreshPage", //下拉刷新
    "example_ListViewLoadMorePage", //上拉加载
    "example_ListViewUpAndDownPage", //普通的列表下拉刷新和上拉加载
    "example_ListViewUpAndDownLazyPage", //懒加载的列表下拉刷新和上拉加载
    "example_ListViewNoSpringPage", //无阻尼
    "example_ListViewMaxSpringPage", //最大阻尼
    "example_ListViewSpringRatioPage", //设置阻尼系数
    "example_ListViewNoReboundPage", //上拉加载不回弹
    "example_ListViewNoDataPage", //底部暂无数据
    "example_ListViewFixedBottomLoadPage", //底部加载无数据固定
    "example_ListViewHeaderPage", //带有头的ListView
    "example_ListViewFooterPage", //带有尾的ListView
    "example_ListViewHeaderAndFooterPage", //带有尾的ListView
    "example_ListViewRefreshHeaderFooterPage", //自定义刷新头加载尾
    "example_ListViewSwipeActionPage", //侧滑按钮
    "example_ListViewSlideDeletePage", //侧滑删除
    "example_ListViewItemGroupPage", //列表分组&吸顶
    "example_ListViewItemGroupIndexPage", //列表分组吸顶,布局带有分组索引
    "example_ListViewItemGroupNoStickyPage", //列表分组不吸顶
    "example_ListViewStickyTopPage", //列表页面吸顶
    "example_ListViewStickyRLTopPage", //列表页面刷新吸顶
    "example_ListViewStickLayoutPage", //列表顶部吸顶刷新
    "example_ListViewArbitrarilyStickyTopPage", //任意布局吸顶刷新
    "example_ListViewTabsPage", //结合Tabs使用
    "example_ListViewAutoRefreshPage", //自动刷新
    "example_ListViewPositioningPage", //位置定位
    "example_ListViewEnableSpringPage", //刷新加载禁止后带阻尼
    "example_ListViewAutoLoadMorePage", //滑动到底部，自动加载更多
    "example_ListViewDataOperationPage",
    "example_ListViewLazyDataOperationPage",
    "example_ListViewErrorOrEmptyPage"//缺省页
  ]
  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:ListView组件路由数组
   */
  private listLayoutPathArray = [
    "example_ListLayoutPage",
    "example_ListLayoutLazyPage",
    "example_ListLayoutAdaptivePage",
    "example_ListLayoutAdaptivePage2",
    "example_ListLayoutRefreshPage",
    "example_ListLayoutLoadMorePage",
    "example_ListLayoutUpAndDownPage",
    "example_ListLayoutLazyUpAndDownPage",
    "example_ListLayoutNoSpringPage", //无阻尼
    "example_ListLayoutMaxSpringPage", //最大阻尼
    "example_ListLayoutSpringRatioPage",
    "example_ListLayoutNoReboundPage", //上拉加载不回弹
    "example_ListLayoutFixedBottomLoadPage", //底部暂无数据
    "example_ListLayoutFixedFooterPage", //底部暂无数据固定
    "example_ListLayoutHeaderPage", //添加头组件
    "example_ListLayoutFooterPage", //添加尾组件
    "example_ListLayoutHeaderAndFooterPage", //头和尾都有
    "example_ListLayoutRefreshHeaderFooterPage", //自定义刷新头加载尾
    "example_ListLayoutSwipeActionPage",
    "example_ListLayoutSlideDeletePage", //侧滑直接删除
    "example_ListLayoutItemGroupPage", //列表分组吸顶
    "example_ListLayoutItemGroupIndexPage",
    "example_ListLayoutItemGroupNoStickyPage", //列表分组不吸顶
    "example_ListLayoutStickyTopPage",
    "example_ListLayoutStickyTopRefreshPage", //刷新
    "example_ListLayoutStickPage", //页面顶部吸顶刷新
    "example_ListLayoutArbitrarilyStickyTopPage", //任意的布局吸顶
    "example_ListLayoutTabsPage",
    "example_ListLayoutAutoRefreshPage", //自动刷新
    "example_ListLayoutPositioningPage", //位置定位
    "example_ListLayoutEnableSpringPage", //禁止后支持阻尼
    "example_ListLayoutAutoLoadMorePage",//自动加载更多数据
    "example_ListLayoutDataOperationPage",
    "example_ListLayoutLazyDataOperationPage",
    "example_ListLayoutErrorOrEmptyPage"
  ]
  private listInfo =
    "列表组件是针对系统List组件进行封装，支持刷新加载等多种功能，目的是简化代码，目前存在两个组件，一个是ListView，一个是ListLayout，其功能一样，大家可以选择使用。"
  @State private isListLayout: boolean = false

  build() {
    Column() {
      TitleBar({
        title: "List列表组件(V1)", rightText: "查看文档", onRightClick: () => {
          //查看文档
        }
      })
      Text(this.listInfo)
        .fontColor($r("app.color.tab_normal_color"))
        .fontSize(13)
        .padding({ left: 20, right: 20 })
        .margin({ top: 10, bottom: 20 })

      this.SwichMenu()

      Grid() {
        ForEach(this.listNameArray, (item: string, index: number) => {
          GridItem() {
            Text(item)
              .height(50)
              .width("100%")
              .fontSize(14)
              .fontColor($r("app.color.tab_select_color"))
              .textAlign(TextAlign.Center)
              .border({ color: $r("app.color.tab_select_color"), width: 1, radius: 5 })
              .onClick(() => {
                if (this.isListLayout) {
                  startPage(this.listLayoutPathArray[index])
                } else {
                  startPage(this.listViewPathArray[index])
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
        .offset({ x: this.isListLayout ? "50%" : 0 })
        .animation({ duration: 300 })

      Row() {
        Text("ListView")
          .fontSize(14)
          .layoutWeight(1)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(this.isListLayout ? $r("app.color.tab_select_color") : Color.White)
          .onClick(() => {
            this.isListLayout = false
          })

        Text("ListLayout")
          .layoutWeight(1)
          .fontSize(14)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(this.isListLayout ? Color.White : $r("app.color.tab_select_color"))
          .onClick(() => {
            this.isListLayout = true
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