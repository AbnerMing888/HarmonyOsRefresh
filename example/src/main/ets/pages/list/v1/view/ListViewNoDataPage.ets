import { TitleBar } from "@abner/bar"
import { ListView, RefreshController, RefreshDataSource } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2025/3/20
 * INTRODUCE:底部显示暂无数据
 * */

@RouterPath("example_ListViewNoDataPage")
@Component
export struct ListViewNoDataPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource() //懒加载数据

  aboutToAppear() {
    this.lazyDataSource.initData(this.getArray())
  }

  private getArray(): Array<number> {
    let array: Array<number> = []
    for (let i = 0; i < 20; i++) {
      array.push(i)
    }
    return array
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
      TitleBar({ title: "底部暂无数据" })

      ListView({
        lazyDataSource: this.lazyDataSource,
        lazyCachedCount: 10,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.lazyDataSource.deleteAll(() => {
              this.lazyDataSource.pushDataArray(this.getArray())
            })
            this.controller.isFooterNothing = false//改变无数据状态
            this.controller.finishRefresh()
          }, 1000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            this.lazyDataSource.pushDataArray(this.getArray())
            this.controller.finishLoadMore(true)
          }, 1000)
        }
      })
    }
  }
}