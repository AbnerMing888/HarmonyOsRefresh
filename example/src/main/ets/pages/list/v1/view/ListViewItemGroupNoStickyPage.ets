import { TitleBar } from '@abner/bar'
import { ItemGroupModel, ListView, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/12
 * INTRODUCE:listView只分组不吸顶
 * */
@RouterPath("example_ListViewItemGroupNoStickyPage")
@Component
export struct ListViewItemGroupNoStickyPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  private itemGroupModelArray?: Array<ItemGroupModel> = [
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

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(_: Object, index: number) {
    ListItemView({ index: index })
  }

  @Builder
  itemGroupHeader(item: Object) {
    Text((item as ItemGroupModel).title)
      .width("100%")
      .height(50)
      .textAlign(TextAlign.Center)
      .fontColor(Color.White)
      .backgroundColor($r("app.color.tab_select_color"))
  }

  build() {
    Column() {
      TitleBar({ title: "列表分组不吸顶" })
      ListView({
        controller: this.controller, //刷新控制器
        itemGroupHeader: this.itemGroupHeader, //分组头
        itemGroupData: this.itemGroupModelArray, //分组数据
        itemLayout: this.itemLayout, //内容视图
        groupNoSticky: true, //分组不吸顶
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
