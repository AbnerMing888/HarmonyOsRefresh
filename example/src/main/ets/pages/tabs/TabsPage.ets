import { TabLayout } from '@abner/tab'
import { ActionBar } from '../ActionBar'
import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/24
 * INTRODUCE:结合Tabs使用
 * */

@Component
struct ListTabsPage {
  @State array: Array<number> = []
  mRefreshController: RefreshController = new RefreshController

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
  itemLayout(_: number, index: number): void {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    ListView({
      items: this.array, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
      itemLayout: (item: Object, index: number) => {
        this.itemLayout(item as number, index) //转成你需要的对象
      },
      controller: this.mRefreshController, //控制器，负责关闭下拉和上拉
      onRefresh: () => {
        //下拉刷新 模拟耗时
        setTimeout(() => {
          this.mRefreshController.finishRefresh()
        }, 3000)
      },
      onLoadMore: () => {
        //上拉加载 模拟耗时
        setTimeout(() => {
          this.mRefreshController.finishLoadMore()
        }, 3000)
      }
    })
  }
}

@Entry
@Component
struct TabsPage {
  @Builder
  itemPage(_this: TabsPage, index: number, item: string) {
    ListTabsPage()
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