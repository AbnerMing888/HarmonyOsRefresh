import { TitleBar } from '@abner/bar';
import { GridLayout, RefreshController, RefreshDataSource } from '@abner/refresh';
import { RouterPath } from '@abner/router';
import { ListItemView } from '../../../../view/ListItemView';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:添加头组件
 * */

@RouterPath("example_GridLayoutHeaderPage")
@Component
export struct GridLayoutHeaderPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 50; i++) {
      array.push(i)
    }
    this.lazyDataSource.pushDataArray(array)
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
    }.height(100)
    .width("100%")
    .backgroundColor($r("app.color.tab_select_color"))
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      TitleBar({ title: "添加头组件(GridLayout)" })
      GridLayout({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        lazyCachedCount: 25, //缓存数量
        itemHeaderLayout:this.itemHeaderLayout,
        onRefresh: () => {
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //模拟耗时
          setTimeout(() => {
            this.lazyDataSource.pushDataArray([0, 1, 2, 3, 4, 5, 6])
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}
