import { TitleBar } from '@abner/bar'
import { ListLayout, RefreshController, RefreshDataSource } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 *AUTHOR:AbnerMing
 *DATE:2026/4/23
 *INTRODUCE:自动加载更多
 */
@RouterPath("example_ListLayoutAutoLoadMorePage")
@Component
export struct ListLayoutAutoLoadMorePage {
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
      TitleBar({ title: "自动加载更多数据" })

      ListLayout({
        lazyDataSource: this.lazyDataSource,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        isAutoLoadMoreData: true, //滑动到底部自动加载更多
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.lazyDataSource.deleteAll(() => {
              this.lazyDataSource.pushDataArray(this.getArray())
            })
            this.controller.finishRefresh()
          }, 1000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            this.lazyDataSource.pushDataArray(this.getArray())
            this.controller.finishLoadMore()
          }, 1000)
        }
      })
    }
  }
}