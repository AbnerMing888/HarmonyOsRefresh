import { ActionBar } from '../ActionBar'
import { ListView, RefreshDataSource } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:懒加载数据ListView
 * */

@Entry
@Component
struct ListViewLazyPage {
  lazyDataSource?: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    let array: number[] = []
    for (let i = 0; i < 30; i++) {
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
  itemLayout(item: Object, index: number): void {
    Text("测试数据" + item.toString())
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Column() {
      ActionBar({ title: "懒加载数据ListView" })
      ListView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout, //转成你需要的对象
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring
          attr.contentEndOffset = 20 //设置内容区末尾偏移量，目的为了可见
        }
      })
    }
  }
}