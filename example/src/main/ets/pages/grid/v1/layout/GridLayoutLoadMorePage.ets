import { TitleBar } from '@abner/bar';
import { GridLayout, RefreshController, RefreshDataSource } from '@abner/refresh';
import { RouterPath } from '@abner/router';
import { ListItemView } from '../../../../view/ListItemView';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:上拉加载
 * */

@RouterPath("example_GridLayoutLoadMorePage")
@Component
export struct GridLayoutLoadMorePage {
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
      TitleBar({ title: "上拉加载(GridLayout)" })
      GridLayout({
        lazyDataSource: this.lazyDataSource,
        controller: this.controller,
        itemLayout: this.itemLayout,
        lazyCachedCount: 25, //缓存数量
        onLoadMore: () => {
          //模拟耗时
          setTimeout(() => {
            for (let i = 0; i < 20; i++) {
              this.lazyDataSource.pushData(i)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}
