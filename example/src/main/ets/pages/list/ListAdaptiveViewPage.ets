import { ActionBar } from '../ActionBar'
import { ListView } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/01/11
 * INTRODUCE:List自适应高度
 * */

@Entry
@Component
struct ListAdaptiveViewPage {
  @State array: number[] = []

  aboutToAppear() {
    for (let i = 0; i < 5; i++) {
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
      ActionBar({ title: "自适应高度" })
      ListView({
        items: this.array, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
        itemLayout: this.itemLayout, //转成你需要的对象
        isAdaptiveHeight: true, //是否需要自适应高度
        // refreshHeight: 200,//设置整体的高度
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring //设置阻尼效果
          attr.contentEndOffset = 20 //设置内容区末尾偏移量，目的为了可见
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