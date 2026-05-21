import { TitleBar } from '@abner/bar'
import { ListView, RefreshController, RefreshDataSource } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/6
 * INTRODUCE:侧滑直接删除
 * */

@RouterPath("example_ListViewSlideDeletePage")
@Component
export struct ListViewSlideDeletePage {
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
  itemLayout(_: Object, index: number): void {
    ListItemView({ index: index })
  }

  build() {
    Column() {
      TitleBar({ title: "侧滑删除" })
      ListView({
        lazyDataSource: this.mRefreshDataSource,
        isSwipeDelete: true, //滑动是否删除
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