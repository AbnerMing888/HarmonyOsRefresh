import { TitleBar } from "@abner/bar"
import { ItemGroupModel, ListLayout, RefreshController } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:列表分组不吸顶
 * */
@RouterPath("example_ListLayoutItemGroupNoStickyPage")
@Component
export struct ListLayoutItemGroupNoStickyPage {
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
      TitleBar({ title: "分组不吸顶列表" })
      ListLayout({
        controller: this.controller,
        itemGroupHeader: this.itemGroupHeader, //分组头
        itemGroupData: this.itemGroupModelArray, //分组数据
        itemLayout: this.itemLayout, //内容视图
        itemGroupNoSticky: true, //取消吸顶
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