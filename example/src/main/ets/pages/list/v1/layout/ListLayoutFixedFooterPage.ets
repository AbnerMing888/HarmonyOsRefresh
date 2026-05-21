import { TitleBar } from "@abner/bar"
import { ListLayout, RefreshController, RefreshDataSource } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/23
 * INTRODUCE:上拉加载，底部的暂无更多，固定
 * */
@RouterPath("example_ListLayoutFixedFooterPage")
@Component
export struct ListLayoutFixedFooterPage {
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

  build() {
    Column() {
      TitleBar({ title: "底部暂无数据固定(ListLayout)" })
      ListLayout({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        nestedScroll: {
          scrollForward: NestedScrollMode.SELF_FIRST,
          scrollBackward: NestedScrollMode.PARENT_FIRST
        },
        slideDisplayLoadData: true, //设置此参数，可以让上拉完成后，不回弹，直接显示数据
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.isNothingFixedBottom = false
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
            this.controller.finishLoadMoreFixedBottom(true) //设置为true，显示暂无更多数据
          }, 3000)
        }
      })
    }.width("100%")
    .height("100%")
  }
}