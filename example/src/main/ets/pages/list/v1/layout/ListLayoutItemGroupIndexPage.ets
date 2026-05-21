import { TitleBar } from "@abner/bar"
import { ItemGroupModel, ListLayout, RefreshController } from "@abner/refresh"
import { RouterPath } from "@abner/router"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:列表分组吸顶带索引
 * */
@RouterPath("example_ListLayoutItemGroupIndexPage")
@Component
export struct ListLayoutItemGroupIndexPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State itemGroupModelArray: Array<ItemGroupModel> = [
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
  itemGroupHeader(item: Object, position: number) {
    Text((item as ItemGroupModel).title)
      .width("100%")
      .height(50)
      .textAlign(TextAlign.Center)
      .fontColor(Color.White)
      .backgroundColor($r("app.color.tab_select_color"))
  }

  @Builder
  itemGroupIndexLayout(item: Object, index: number, groupIndex: number) {
    Text("子索引:" + index.toString() + "==分组索引:" + groupIndex)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .fontColor($r("app.color.tab_select_color"))
      .border({ width: 1, color: $r("app.color.tab_select_color") })

  }

  build() {
    Column() {
      TitleBar({ title: "分组吸顶(带分组索引)" })
      ListLayout({
        controller: this.controller,
        itemGroupHeader: this.itemGroupHeader, //分组头
        itemGroupData: this.itemGroupModelArray, //分组数据
        itemGroupIndexLayout: this.itemGroupIndexLayout, //内容视图
        isNeedGroupIndex: true, //是否需要分组索引
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.itemGroupModelArray?.push({
              title: "星期日",
              items: ["语文", "数学", "英语", "物理"]
            })
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }.width("100%")
    .height("100%")
  }
}