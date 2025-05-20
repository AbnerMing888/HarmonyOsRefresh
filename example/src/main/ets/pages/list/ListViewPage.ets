import { ActionBar } from '../ActionBar'
import { ListView } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:普通的列表ListView
 * */

@Entry
@Component
struct ListViewPage {
  @State array: number[] = []

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
      this.array.push(i)
    }
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
      ActionBar({ title: "普通的列表ListView" })
      ListView({
        items: this.array, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
        itemLayout: this.itemLayout, //转成你需要的对象
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring //设置阻尼效果
          attr.contentEndOffset = 20 //设置内容区末尾偏移量，目的为了可见
        }
      })
    }.width("100%")
    .height("100%")
  }
}