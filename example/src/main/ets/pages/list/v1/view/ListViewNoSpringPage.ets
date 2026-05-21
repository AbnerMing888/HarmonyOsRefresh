import { TitleBar } from '@abner/bar'
import { ListView, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:刷新列表ListView 无阻尼
 * */

@RouterPath("example_ListViewNoSpringPage")
@Component
export struct ListViewNoSpringPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []
  private tempTimeoutId: number = -1

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
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
      TitleBar({ title: "无阻尼列表" })
      ListView({
        items: this.array,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        isScrollSpring: false, //设置阻尼为false
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //上拉加载
          clearTimeout(this.tempTimeoutId)
          this.tempTimeoutId = setTimeout(() => {
            //模拟耗时
            for (let i = 0; i < 10; i++) {
              this.array.push(100)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}