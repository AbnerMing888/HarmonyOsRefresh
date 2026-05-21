import { ListView, RefreshDataSource } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { TitleBar } from '@abner/bar'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:懒加载数据ListView
 * */
@RouterPath("example_ListViewLazyPage")
@Component
export struct ListViewLazyPage {
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
  itemLayout(_: Object, index: number): void {
    ListItemView({ index: index })
  }

  build() {
    Column() {
      TitleBar({ title: "懒加载数据ListView" })
      ListView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout, //转成你需要的对象
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring
        }
      })
    }
  }
}