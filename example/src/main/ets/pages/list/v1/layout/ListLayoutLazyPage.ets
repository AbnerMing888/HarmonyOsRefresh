import { TitleBar } from "@abner/bar"
import { ListLayout, RefreshDataSource } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:懒加载数据ListView
 * */

@RouterPath("example_ListLayoutLazyPage")
@Component
export struct ListLayoutLazyPage {
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
    ListItemView({ index: index })
  }

  build() {
    Column() {
      TitleBar({ title: "懒加载数据(ListLayout)" })
      ListLayout({
        lazyDataSource: this.lazyDataSource,
        lazyCachedCount: 10, //缓存数量
        itemLayout: this.itemLayout,
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring //开启弹性滚动效果
        }
      })
    }.width("100%")
    .height("100%")
  }
}