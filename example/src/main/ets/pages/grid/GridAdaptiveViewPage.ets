import { ActionBar } from '../ActionBar'
import { GridView } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/01/11
 * INTRODUCE:Grid自适应高度
 * */

@Entry
@Component
struct GridAdaptiveViewPage {
  @State array: Array<number> = []

  aboutToAppear() {
    for (let i = 0; i < 8; i++) {
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
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .margin({ top: 10 })

  }

  build() {
    Column() {
      ActionBar({ title: "普通的列表GridView" })
      GridView({
        items: this.array, //数据源 数组
        isAdaptiveHeight: true, //是否需要自适应高度
        itemLayout: (item, index) => this.itemLayout(item, index),
        gridAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring //设置阻尼效果
        }
      })

      Text("我是其他布局")
        .width("100%")
        .height("100%")
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Pink)
    }
  }
}