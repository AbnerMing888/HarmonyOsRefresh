import { ActionBar } from '../ActionBar';
import {
  GridView,
  LoadMoreLayoutStatusModel,
  RefreshController,
  RefreshDataSource,
  RefreshLayoutStatusModel
} from '@abner/refresh';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/16
 * INTRODUCE:自定义刷新头和加载尾
 * */

@Entry
@Component
struct GridRefreshHeaderFooterPage {
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

  /**
   * Author:AbnerMing
   * Describe:自定义刷新头
   */
  @Builder
  headerRefreshLayout(model: RefreshLayoutStatusModel) {
    Text("当前状态：" + model.status)
      .width("100%")
      .textAlign(TextAlign.Center)
      .height(80)
      .backgroundColor(Color.Pink)
  }

  /**
   * Author:AbnerMing
   * Describe:自定义加载尾部
   */
  @Builder
  footerLoadLayout(model: LoadMoreLayoutStatusModel) {
    Text("当前状态：" + model.status)
      .width("100%")
      .textAlign(TextAlign.Center)
      .height(80)
      .backgroundColor(Color.Pink)
  }

  build() {
    Column() {
      ActionBar({ title: "自定义刷新头和加载尾" })
      GridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        lazyCachedCount: 10,
        headerRefreshLayout: this.headerRefreshLayout,
        footerLoadLayout: this.footerLoadLayout,
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
