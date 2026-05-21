import { TitleBar } from "@abner/bar"
import { ListLayout, RefreshController, RefreshDataSource } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:带有头和尾部的ListView
 * */
@RouterPath("example_ListLayoutHeaderAndFooterPage")
@Component
export struct ListLayoutHeaderAndFooterPage {
  lazyDataSource?: RefreshDataSource = new RefreshDataSource()
  controller: RefreshController = new RefreshController() //刷新控制器

  aboutToAppear() {
    let array: number[] = []
    for (let i = 0; i < 20; i++) {
      array.push(i)
    }
    this.lazyDataSource?.initData(array)
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

  @Builder
  itemHeaderLayout(): void {
    Column() {
      Text("我是头View")
        .fontColor(Color.White)
    }.height(100)
    .width("100%")
    .backgroundColor($r("app.color.tab_select_color"))
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  itemFooterLayout(): void {
    Column() {
      Text("我是尾部View")
        .fontColor(Color.White)
    }.height(100)
    .width("100%")
    .backgroundColor($r("app.color.tab_select_color"))
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      TitleBar({ title: "带有头的ListLayout" })
      ListLayout({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        itemHeaderLayout: this.itemHeaderLayout,
        itemFooterLayout: this.itemFooterLayout,
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            let array: number[] = []
            for (let i = 0; i < 5; i++) {
              array.push(i)
            }
            this.lazyDataSource?.pushDataArray(array)
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }.width("100%")
    .height("100%")
  }
}