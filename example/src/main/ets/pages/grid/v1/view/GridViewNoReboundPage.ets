import { TitleBar } from '@abner/bar';
import { GridView, RefreshController, RefreshDataSource } from '@abner/refresh';
import { RouterPath } from '@abner/router';
import { ListItemView } from '../../../../view/ListItemView';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:网格列表底部加载数据不回弹
 * */

@RouterPath("example_GridViewNoReboundPage")
@Component
export struct GridViewNoReboundPage {
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
      TitleBar({ title: "上拉加载不回弹(GridView)" })
      GridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        lazyCachedCount: 25, //缓存数量
        slideDisplayLoadData: true, //设置此参数，可以让上拉完成后，不回弹，直接显示数据
        onRefresh: () => {
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //模拟耗时
          setTimeout(() => {
            this.lazyDataSource.pushDataArray([0, 1, 2, 3, 4, 5, 6])
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}
