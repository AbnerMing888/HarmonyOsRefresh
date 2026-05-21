import { TitleBar } from '@abner/bar'
import { GridDropView } from '@abner/refresh'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/2/27
 * INTRODUCE:网格拖拽
 * */
@RouterPath("example_GridDropPage")
@Component
export struct GridDropPage {
  @State items: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
  /**
   * Author:AbnerMing
   * Describe:条目视图
   */
  @Builder
  itemLayout(obj: Object, _: number): void {
    Column() {
      Text("列表数据:" + obj)
        .width("100%")
        .height("100%")
        .textAlign(TextAlign.Center)
        .fontColor($r("app.color.tab_select_color"))
        .border({ width: 1, color: $r("app.color.tab_select_color") })
    }
    .width("100%")
    .height(50)
    .justifyContent(FlexAlign.Center)
    .padding({ left: 10, right: 10 })
    .margin({ bottom: 10 })
  }

  /**
   * Author:AbnerMing
   * Describe:拖拽时显示的视图
   */
  @Builder
  dropLayout(obj: Object, _: number): void {
    Column() {
      Text("列表数据:" + obj)
        .width("100%")
        .height("100%")
        .textAlign(TextAlign.Center)
        .fontColor($r("app.color.tab_select_color"))
        .border({ width: 1, color: $r("app.color.tab_select_color") })
    }
    .width("50%")
    .height(50)
    .justifyContent(FlexAlign.Center)
    .padding({ left: 10, right: 10 })
    .margin({ bottom: 10 })
  }

  build() {
    Column() {
      TitleBar({ title: "网格拖拽(GridDropView)" })
      GridDropView({
        items: this.items,
        itemLayout: this.itemLayout,
        dropLayout: this.dropLayout,
        rowsGap: 10,
        columnsGap: 10,
        isEditMode: true,
        prohibitDrop: [0, 1], //禁止拖拽的索引
        prohibitMaxSwap: 0, //禁止交换
        onDropData: (items) => {
          console.log("拖拽结束：" + JSON.stringify(items))
        }
      }) .layoutWeight(1)
    }.width("100%")
    .height("100%")
  }
}