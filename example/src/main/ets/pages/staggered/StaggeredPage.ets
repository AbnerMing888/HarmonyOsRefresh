/**
 * AUTHOR:AbnerMing
 * DATE:2024/2/23
 * INTRODUCE:普通的交错布局页面
 * */
import { RefreshController, RefreshDataSource, StaggeredGridView } from '@abner/refresh'
import { ActionBar } from '../ActionBar'

@Entry
@Component
struct StaggeredPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  private itemHeightArray: number[] = []
  @State array: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  @State minSize: number = 80
  @State maxSize: number = 180
  scroller: Scroller = new Scroller()
  @State dataSource: RefreshDataSource = new RefreshDataSource()

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 设置FlowItem的宽/高数组
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
  }

  @Builder
  itemLayout(item: Object, index: number): void {
    Column() {
      Text("测试数据" + index)
    }.width("100%")
    .height(this.itemHeightArray[index % 100])
    .backgroundColor(this.colors[index % 5])
  }

  build() {
    Column() {
      ActionBar({ title: "普通的交错布局页面" })
      StaggeredGridView({
        items: this.array,
        itemLayout: (item: Object, index: number) => this.itemLayout(item, index),
        controller: this.controller,
        isLazyData: false,
        onLazyDataSource: (dataSource: RefreshDataSource) => {
          this.dataSource = dataSource
        },
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            this.array.push(21)
            this.dataSource.reloadData()
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}