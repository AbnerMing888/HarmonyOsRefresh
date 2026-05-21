import { TitleBar } from "@abner/bar"
import { ListLayout,
  LoadMoreLayoutStatusModel,
  RefreshController, RefreshDataSource, RefreshLayoutStatusModel } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:自定义刷新头和加载尾部
 * */
@RouterPath("example_ListLayoutRefreshHeaderFooterPage")
@Component
export struct ListLayoutRefreshHeaderFooterPage {
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
      TitleBar({ title: "自定义刷新头加载尾(ListLayout)" })
      ListLayout({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        headerRefreshLayout: this.headerRefreshLayout, //刷新头
        footerLoadLayout: this.footerLoadLayout, //加载尾
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