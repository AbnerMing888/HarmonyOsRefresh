import { TitleBar } from '@abner/bar'
import { ListView, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/3
 * INTRODUCE:固定底部上拉加载无数据
 * */
@RouterPath("example_ListViewFixedBottomLoadPage")
@Component
export struct ListViewFixedBottomLoadPage {
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
      TitleBar({ title: "固定底部上拉加载无数据" })
      ListView({
        items: this.array,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        slideDisplayLoadData:true,
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.isNothingFixedBottom = false //关闭
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
            this.controller.finishLoadMoreFixedBottom(true) //开启
          }, 3000)
        }
      })
    }
  }
}