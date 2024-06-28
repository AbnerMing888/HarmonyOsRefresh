import { ActionBar } from '../ActionBar'
import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:下拉刷新列表ListView
 * */

@Entry
@Component
struct ListViewRefreshPage {
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
  itemLayout(_: number, index: number): void {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  @State bool?: boolean = false

  build() {
    Column() {
      ActionBar({ title: "下拉刷新列表ListView" })
        .onClick(() => {
          this.bool = !this.bool
        })

      ListView({
        controller: this.controller, //控制器，负责关闭下拉和上拉
        items: this.array, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
        refreshHeaderAttribute: (attr) => {
          attr.height = 100
        },
        itemLayout: (item: Object, index: number) => {
          this.itemLayout(item as number, index) //转成你需要的对象
        },
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 3000)
        }
      })
    }
  }
}