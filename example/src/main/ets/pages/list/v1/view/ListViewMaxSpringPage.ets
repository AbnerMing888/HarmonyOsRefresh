import { TitleBar } from '@abner/bar'
import { ListView, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/3/20
 * INTRODUCE:刷新列表ListView 设置最大阻尼
 * */

@RouterPath("example_ListViewMaxSpringPage")
@Component
export struct ListViewMaxSpringPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []

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
      TitleBar({ title: "最大阻尼列表" })
      ListView({
        items: this.array,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        maxRefreshSpringDistance: 200, //设置最大刷新阻尼
        maxLoadSpringDistance: 100, //设置最大加载阻尼
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            //模拟耗时
            for (let i = 0; i < 20; i++) {
              this.array.push(i)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}