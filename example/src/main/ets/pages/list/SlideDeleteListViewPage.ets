import { ActionBar } from '../ActionBar'
import { ListView, RefreshController, RefreshDataSource } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/6
 * INTRODUCE:侧滑直接删除
 * */

@Entry
@Component
struct SlideDeleteListViewPage {
  private mRefreshDataSource: RefreshDataSource = new RefreshDataSource()
  controller: RefreshController = new RefreshController() //刷新控制器

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 40; i++) {
      array.push(i)
    }

    this.mRefreshDataSource.initData(array)
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(item: Object, index: number): void {
    Text("测试数据" + item)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .onClick(() => {
        console.log("===========" + index)
      })
  }

  build() {
    Column() {
      ActionBar({ title: "侧滑删除" })
      ListView({
        lazyDataSource: this.mRefreshDataSource,
        isSwipeDelete: true,
        isDeleteReloadIndex: true, //删除之后是否重置索引
        controller: this.controller,
        itemLayout: (item, index) => this.itemLayout(item, index), //条目视图
        onRefresh: () => {
          this.controller.finishRefresh()
        }
      })
    }
  }
}