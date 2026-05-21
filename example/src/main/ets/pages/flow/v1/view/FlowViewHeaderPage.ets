import { TitleBar } from '@abner/bar';
import { RefreshController, RefreshDataSource, StaggeredGridView } from '@abner/refresh';
import { RouterPath } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:添加头组件
 * */

@RouterPath("example_FlowViewHeaderPage")
@Component
export struct FlowViewHeaderPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource()
  private itemHeightArray: number[] = []
  @State colors: ResourceColor[] = ["#ee6d82", "#e5682f", "#eeb272", "#cbb41b", "#d86fea", "#5f97ea"]
  @State minSize: number = 80
  @State maxSize: number = 180

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 50; i++) {
      array.push(i)
      this.itemHeightArray.push(this.getSize())
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
    Column() {
      Text("列表数据:" + index)
        .fontColor(Color.White)
    }
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .height(this.itemHeightArray[index % 100])
    .backgroundColor(this.colors[index % 5])
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
      TitleBar({ title: "添加头组件(StaggeredGridView)" })
      StaggeredGridView({
        lazyDataSource: this.lazyDataSource,
        itemLayout: (item: Object, index: number) => this.itemLayout(item, index),
        controller: this.controller,
        lazyCachedCount: 10, //缓存数量
        itemHeaderLayout: this.itemHeaderLayout,
        onRefresh: () => {
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //模拟耗时
          setTimeout(() => {
            for (let i = 0; i < 10; i++) {
              this.itemHeightArray.push(this.getSize())
              this.lazyDataSource.pushData(i)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}
