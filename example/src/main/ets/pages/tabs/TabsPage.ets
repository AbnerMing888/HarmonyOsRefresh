import { TabLayout } from '@abner/tab'
import { ActionBar } from '../ActionBar'
import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/24
 * INTRODUCE:结合Tabs使用
 * */

@Entry
@Component
struct TabsPage {
  @State array: Array<number> = []
  @State listRefreshController: Array<RefreshController> = []

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
      this.array.push(i)
    }

    for (let i = 0; i < 4; i++) {
      this.listRefreshController.push(new RefreshController())
    }
  }

  @Builder
  itemPage(_this: TabsPage, index: number, item: string) {
    ListView({
      items: this.array, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
      itemLayout: (item: Object, index: number) => {
        this.itemLayout(item as number, index) //转成你需要的对象
      },
      controller: this.listRefreshController[index], //控制器，负责关闭下拉和上拉
      onRefresh: () => {
        //下拉刷新
        this.listRefreshController[index].finishRefresh()
      }
    })
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

  build() {
    Column() {
      ActionBar({ title: "结合Tabs使用" })
      TabLayout({
        tabBar: ["条目一", "条目二", "条目三", "条目四"],
        barMode: BarMode.Fixed, //均分
        itemPage: (index: number, item: string) => {
          this.itemPage(this, index, item)
        },
        tabAttribute: (tab) => {
          //设置属性
        },
        onChangePage: (position) => {
          //页面改变

        },
        onTabBarClick: (position) => {
          //点击改变
          console.log("点击改变:" + position)
        }
      })
    }.width("100%")
    .height("100%")
  }
}