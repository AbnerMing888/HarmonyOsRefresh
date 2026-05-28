import { TitleBar } from '@abner/bar'
import { ListView, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:带有头的ListView
 * */

@RouterPath("example_ListViewHeaderPage")
@Component
export struct ListViewHeaderPage {
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

  @Builder
  itemHeaderLayout(): void {
    Column() {
      Text("我是头View")
        .fontColor(Color.White)
    }
    .height(100)
    .width("100%")
    .backgroundColor($r("app.color.tab_select_color"))
    .justifyContent(FlexAlign.Center)
    .margin({ bottom: 10 })
  }

  build() {
    Column() {
      TitleBar({ title: "带有头的ListView" })

      ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        itemHeaderLayout: () => {
          this.itemHeaderLayout()
        },
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh();
          }, 3000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            //模拟耗时
            for (let i = 0; i < 20; i++) {
              this.array.push(i)
            }
            this.controller.finishLoadMore();
          }, 3000)
        }
      })
    }
  }
}