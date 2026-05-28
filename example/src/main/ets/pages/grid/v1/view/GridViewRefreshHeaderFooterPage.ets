import { TitleBar } from '@abner/bar';
import { GridView, LoadMoreLayoutStatusModel, RefreshController, RefreshDataSource,
  RefreshLayoutStatusModel } from '@abner/refresh';
import { RouterPath } from '@abner/router';
import { ListItemView } from '../../../../view/ListItemView';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:自定义刷新头和加载尾部
 * */

@RouterPath("example_GridViewRefreshHeaderFooterPage")
@Component
export struct GridViewRefreshHeaderFooterPage {
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


  /**
   * Author:AbnerMing
   * Describe:自定义刷新头
   */
  @Builder
  headerRefreshLayout(model: RefreshLayoutStatusModel) {
    Text("当前状态：" + model.status)
      .width("100%")
      .textAlign(TextAlign.Center)
      .height(80)
      .fontColor(Color.White)
      .backgroundColor($r("app.color.tab_select_color"))
  }

  /**
   * Author:AbnerMing
   * Describe:自定义加载尾部
   */
  @Builder
  footerLoadLayout(model: LoadMoreLayoutStatusModel) {
    Text("当前状态：" + model.status)
      .width("100%")
      .textAlign(TextAlign.Center)
      .height(80)
      .fontColor(Color.White)
      .backgroundColor($r("app.color.tab_select_color"))
  }

  build() {
    Column() {
      TitleBar({ title: "自定义刷新头加载尾(GridView)" })
      GridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        lazyCachedCount: 25, //缓存数量
        headerRefreshLayout: this.headerRefreshLayout, //刷新头
        footerLoadLayout: this.footerLoadLayout, //加载尾
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
