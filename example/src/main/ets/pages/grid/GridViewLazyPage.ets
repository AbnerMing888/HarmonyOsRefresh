import { ActionBar } from '../ActionBar';
import { GridView, RefreshController, RefreshDataSource } from '@abner/refresh';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:懒加载数据
 * */

@Entry
@Component
struct GridViewLazyPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    let array: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
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
    Text("测试数据" + index)
      .width("95%")
      .height(150)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .margin({ top: 10 })
  }

  build() {
    Column() {
      ActionBar({ title: "懒加载数据GridView" })
      GridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        lazyCachedCount: 10 //缓存
      })
    }
  }
}
