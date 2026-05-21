import { TitleBar } from '@abner/bar'
import { GridView, ListView, RefreshController, RefreshDataSource } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:滑动到底部自动加载更多
 * */

@RouterPath("example_GridViewAutoLoadMorePage")
@Component
export struct GridViewAutoLoadMorePage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource() //懒加载数据

  aboutToAppear() {
    this.lazyDataSource.initData(this.getArray())
  }

  private getArray(): Array<number> {
    let array: Array<number> = []
    for (let i = 0; i < 50; i++) {
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
      TitleBar({ title: "自动加载更多数据(GridView)" })

      GridView({
        lazyDataSource: this.lazyDataSource,
        isAutoLoadMoreData: true, //自动加载更多
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
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
            for (let i = 0; i < 10; i++) {
              this.lazyDataSource.pushData(i)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}