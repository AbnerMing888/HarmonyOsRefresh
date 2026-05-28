import { TitleBar } from '@abner/bar';
import { GridView, RefreshController, RefreshDataSource } from '@abner/refresh';
import { RouterPath } from '@abner/router';
import { ListItemView } from '../../../../view/ListItemView';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:头和尾都有组件
 * */

@RouterPath("example_GridViewHeaderAndFooterPage")
@Component
export struct GridViewHeaderAndFooterPage {
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

  @Builder
  itemFooterLayout(): void {
    Column() {
      Text("我是尾部View")
        .fontColor(Color.White)
    }.height(100)
    .width("100%")
    .backgroundColor($r("app.color.tab_select_color"))
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      TitleBar({ title: "头和尾都有组件(GridView)" })
      GridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        lazyCachedCount: 25, //缓存数量
        itemHeaderLayout:this.itemHeaderLayout,
        itemFooterLayout:this.itemFooterLayout,
        onRefresh: () => {
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //模拟耗时
          setTimeout(() => {
            let array:number[]=[]
            for (let i = 0; i < 20; i++) {
              array.push(i)
            }
            this.lazyDataSource.pushDataArray(array)
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}
