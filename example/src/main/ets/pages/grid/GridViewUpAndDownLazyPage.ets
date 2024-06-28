import { ActionBar } from '../ActionBar';
import { GridView, RefreshController, RefreshDataSource } from '@abner/refresh';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:下拉上下列表GridView页面  懒加载数据
 * */

@Entry
@Component
struct GridViewUpAndDownLazyPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  array: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
  array2: Array<number> = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
  lazyDataSource: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    this.lazyDataSource.pushDataArray(this.array)
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(_: Object, index: number): void {
    Text("测试数据" + index)
      .width("95%")
      .height(150)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .margin({ top: 10 })
  }

  build() {
    Column() {
      ActionBar({ title: "刷新加载列表GridView" })
      GridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        lazyCachedCount:10,
        onRefresh: () => {
          setTimeout(() => {
            this.lazyDataSource.deleteAll(() => {
              this.lazyDataSource.pushDataArray([500, 501, 502, 503, 504])
            })
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          setTimeout(() => {
            this.lazyDataSource.pushDataArray(this.array2)
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}
