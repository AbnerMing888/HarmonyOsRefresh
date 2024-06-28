import { ActionBar } from '../ActionBar'
import { ListView, RefreshDataSource } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:普通的列表懒加载ListView
 * */

@Entry
@Component
struct ListViewLazyPage {
  lazyDataSource?: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    let array: number[] = []
    for (let i = 0; i < 20; i++) {
      array.push(i)
    }
    this.lazyDataSource?.initData(array)
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
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Column() {
      ActionBar({ title: "普通的懒加载ListView" })
      ListView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout, //转成你需要的对象
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring
        }
      })
    }
  }
}