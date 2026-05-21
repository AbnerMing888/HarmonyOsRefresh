import { TitleBar } from '@abner/bar'
import { ListView } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/01/11
 * INTRODUCE:List自适应高度 案例2
 * */
@RouterPath("example_ListViewAdaptivePage2")
@Component
export struct ListViewAdaptivePage2 {
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
    ListItemView({ index: index })
  }

  build() {
    Column() {
      TitleBar({ title: "自适应高度ListView(底部)" })

      Text("我是其他布局")
        .width("100%")
        .height(200)
        .textAlign(TextAlign.Center)
        .fontColor(Color.White)
        .backgroundColor($r("app.color.tab_select_color"))
        .margin({ bottom: 10 })

      ListView({
        items: this.array, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
        itemLayout: this.itemLayout, //转成你需要的对象
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring //设置阻尼效果
        }
      })
    }
  }
}