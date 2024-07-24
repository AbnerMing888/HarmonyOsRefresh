import { GridDropView } from '@abner/refresh'
import { ActionBar } from '../ActionBar'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/2/27
 * INTRODUCE:网格拖拽
 * */
@Entry
@Component
struct GridDropPage {
  /**
   * Author:AbnerMing
   * Describe:条目视图
   */
  @Builder
  itemLayout(item: Object, index: number): void {
    Column() {
      Text("测试数据" + item)
    }.width("100%")
    .height(100)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Pink)
  }

  /**
   * Author:AbnerMing
   * Describe:拖拽时显示的视图
   */
  @Builder
  dropLayout(item: Object): void {
    Column() {
      Text("测试数据" + item)
    }.width("50%")
    .height(100)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Pink)
  }

  build() {
    Column() {
      ActionBar({ title: "网格拖拽" })
      GridDropView({
        items: ["0", "1", "2", "3", "4", "5", "6", "7"],
        itemLayout: this.itemLayout,
        dropLayout: this.dropLayout,
        rowsGap: 10,
        columnsGap: 10,
        isEditMode: true,
        prohibitDrop: [0, 1], //禁止拖拽的索引
        prohibitMaxSwap: 4//禁止交换
      })
    }.width("100%")
    .height("100%")
  }
}