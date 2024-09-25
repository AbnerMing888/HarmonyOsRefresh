import { ItemGroupModel, ListView, RefreshController } from '@abner/refresh'
import { ActionBar } from '../ActionBar'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/3
 * INTRODUCE:listView分组吸顶,带有索引的组件
 * */

@Entry
@Component
struct ListItemGroupIndexPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State private itemGroupModelArray?: Array<ItemGroupModel> = [
    {
      title: "星期一",
      items: ["语文", "数学", "英语", "物理"]
    },
    {
      title: "星期二",
      items: ["语文", "数学", "英语", "物理"]
    },
    {
      title: "星期三",
      items: ["语文", "数学", "英语", "物理"]
    },
    {
      title: "星期四",
      items: ["语文", "数学", "英语", "物理"]
    },
    {
      title: "星期五",
      items: ["语文", "数学", "英语", "物理"]
    },
    {
      title: "星期六",
      items: ["语文", "数学", "英语", "物理"]
    }
  ]

  @Builder
  itemGroupIndexLayout(item: Object, index: number, groupIndex: number) {
    Text("子索引:" + index.toString() + "==分组索引:" + groupIndex)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })

  }

  @Builder
  itemGroupHeader(item: Object, position: number) {
    Text((item as ItemGroupModel).title)
      .width("100%")
      .height(50)
      .textAlign(TextAlign.Center)
      .backgroundColor(Color.Pink)
  }

  build() {
    Column() {
      ActionBar({ title: "列表分组吸顶" })
      ListView({
        controller: this.controller, //刷新控制器
        itemGroupHeader: this.itemGroupHeader, //分组头
        itemGroupData: this.itemGroupModelArray, //分组数据
        itemGroupIndexLayout: this.itemGroupIndexLayout, //内容视图
        isNeedGroupIndex: true, //是否需要分组索引
        onRefresh: () => {
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 2000)
        },
        onLoadMore: () => {
          setTimeout(() => {
            //模拟耗时
            this.controller.finishLoadMore()
          }, 2000)
        }
      })
    }
  }
}
