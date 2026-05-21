import { TitleBar } from '@abner/bar';
import { GridView, RefreshController, RefreshDataSource } from '@abner/refresh';
import { RouterPath } from '@abner/router';
import { ListItemView } from '../../../../view/ListItemView';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:底部暂无数据固定
 * */

@RouterPath("example_GridViewFixedBottomLoadPage")
@Component
export struct GridViewFixedBottomLoadPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 50; i++) {
      array.push(i)
    }
    this.lazyDataSource.pushDataArray(array)
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
      TitleBar({ title: "底部暂无数据固定(GridView)" })
      GridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        lazyCachedCount: 25, //缓存数量
        onRefresh: () => {
          setTimeout(() => {
            this.controller.isNothingFixedBottom = false//改变无数据状态
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //模拟耗时
          setTimeout(() => {
            this.lazyDataSource.pushDataArray([0, 1, 2, 3, 4, 5, 6])
            this.controller.finishLoadMoreFixedBottom(true) //开启
          }, 3000)
        }
      })
    }
  }
}
