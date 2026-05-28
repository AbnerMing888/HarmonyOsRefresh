import { TitleBar } from "@abner/bar"
import { ListLayout } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:普通的列表ListView-自适应高度案例2
 * */
@RouterPath("example_ListLayoutAdaptivePage2")
@Component
export struct ListLayoutAdaptivePage2 {
  @State array: number[] = []

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
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
    ListItemView({ index: index })
  }

  build() {
    Column() {
      TitleBar({ title: "自适应高度(底部)" })

      ListLayout({
        items: this.array,
        itemLayout: this.itemLayout,
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring //开启弹性滚动效果
        }
      })

      Text("我是其他布局")
        .width("100%")
        .height(200)
        .textAlign(TextAlign.Center)
        .fontColor(Color.White)
        .backgroundColor($r("app.color.tab_select_color"))

    }.width("100%")
    .height("100%")
  }
}