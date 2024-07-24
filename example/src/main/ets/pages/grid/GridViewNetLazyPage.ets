import { ActionBar } from '../ActionBar';
import { GridView, RefreshController, RefreshDataSource } from '@abner/refresh';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/16
 * INTRODUCE:模拟网络数据  懒加载数据
 * */

@Entry
@Component
struct GridViewNetLazyPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  array: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  array2: Array<number> = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
  lazyDataSource: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    //初始化数据
    this.lazyDataSource.initData(this.array)
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
        lazyCachedCount: 10, //缓存数量
        onRefresh: () => {
          setTimeout(() => {
            //这里模拟，下拉刷新先情况后追加
            this.lazyDataSource.deleteAll(() => {
              this.lazyDataSource.pushDataArray(this.array)
            })
            //关闭暂无更多数据
            this.controller.isFooterNothing = false
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          setTimeout(() => {

            //这里模拟暂无数据
            if (this.lazyDataSource.totalCount() > 20) {
              this.controller.finishLoadMore(true)
            } else {
              //追加数据
              this.lazyDataSource.pushDataArray(this.array2)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}
