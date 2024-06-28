import { ActionBar } from '../ActionBar'
import { RefreshController, RefreshDataSource, StaggeredGridView } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/24
 * INTRODUCE:瀑布流懒加载
 * */

@Entry
@Component
struct StaggeredLazyPage {
  array: Array<number> = [100, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  array2: Array<number> = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  array3: Array<number> = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
  @State lazyDataSource: RefreshDataSource = new RefreshDataSource()
  refreshController: RefreshController = new RefreshController()

  aboutToAppear() {
    this.lazyDataSource.initData(this.array)
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(item: number, index: number): void {
    Text("测试数据" + item)
      .width("95%")
      .height(50)
      .margin(10)
      .height(150)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Column() {
      ActionBar({ title: "瀑布流懒加载" })
      StaggeredGridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: (item: Object, index: number) => {
          this.itemLayout(item as number, index) //转成你需要的对象
        },
        lazyCachedCount: 8,
        controller: this.refreshController, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新 模拟耗时
          setTimeout(() => {
            this.lazyDataSource.deleteAll()
            this.lazyDataSource.pushDataArray(this.array2)
            this.refreshController.finishRefresh()
          }, 1000)
        },
        onLoadMore: () => {
          //上拉加载 模拟耗时
          setTimeout(() => {
            this.lazyDataSource.pushDataArray(this.array3)
            this.refreshController.finishLoadMore()
          }, 1000)
        }
      })
    }.width("100%")
    .height("100%")
  }
}