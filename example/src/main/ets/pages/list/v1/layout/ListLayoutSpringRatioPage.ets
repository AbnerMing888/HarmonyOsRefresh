import { TitleBar } from "@abner/bar"
import { ListLayout, RefreshController, RefreshDataSource } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:下拉刷新和上拉加载ListView:设置阻尼系数
 * */
@RouterPath("example_ListLayoutSpringRatioPage")
@Component
export struct ListLayoutSpringRatioPage {
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
      TitleBar({ title: "刷新&加载ListLayout（设置阻尼系数）" })
      ListLayout({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        pullDownRatio:0.2,//设置阻塞系数
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
            for (let i = 0; i < 20; i++) {
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