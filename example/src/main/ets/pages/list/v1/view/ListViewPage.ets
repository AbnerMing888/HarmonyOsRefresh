import { TitleBar } from '@abner/bar'
import { ListView } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:普通的列表ListView
 * */
@RouterPath("example_ListViewPage")
@Component
export struct ListViewPage {
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
      TitleBar({ title: "普通数据ListView" })
      ListView({
        items: this.array, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
        itemLayout: this.itemLayout, //转成你需要的对象
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring //设置阻尼效果
        }
      })
    }.width("100%")
    .height("100%")
  }
}