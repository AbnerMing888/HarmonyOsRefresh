import router from '@ohos.router';
import { ActionBar } from './ActionBar';
import { GridView, ListView, RefreshController } from '@abner/refresh';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:Demo首页
 * */

@Entry
@Component
struct Index {
  private itemArray: ListData[] = [] //数据对象
  @State controller: RefreshController = new RefreshController() //刷新控制器

  aboutToAppear(): void {
    let listName = [
      "普通数据模式", "懒加载数据模式", "下拉刷新", "上拉加载", "刷新&加载",
      "添加头组件", "添加尾组件", "自定义刷新头加载尾", "侧滑按钮", "侧滑直接删除", "列表分组吸顶",
      "列表分组不吸顶", "页面吸顶", "页面顶部吸顶刷新", "任意布局吸顶", "结合Tabs使用", "自动刷新"
    ]
    let listUrl = [
      "pages/list/ListViewPage", //普通数据模式
      "pages/list/ListViewLazyPage", //懒加载数据模式
      "pages/list/ListViewRefreshPage", //下拉刷新
      "pages/list/ListViewLoadMorePage", //上拉加载
      "pages/list/ListViewUpAndDownPage", //普通的列表下拉刷新和上拉加载
      "pages/list/ListViewHeaderPage", //带有头的ListView
      "pages/list/ListViewFooterPage", //带有尾的ListView
      "pages/list/ListRefreshHeaderFooterPage", //自定义刷新头加载尾
      "pages/list/SwipeActionListViewPage", //侧滑按钮
      "pages/list/SlideDeleteListViewPage", //侧滑删除
      "pages/group/ListItemGroupPage", //列表分组吸顶
      "pages/group/ListItemGroupNoStickyPage", //列表分组不吸顶
      "pages/sticky/StickyTopPage", //列表页面吸顶
      "pages/layout/StickLayoutViewPage", //列表顶部吸顶刷新
      "pages/sticky/ArbitrarilyStickyTopPage", //任意布局吸顶刷新
      "pages/tabs/TabsPage", //结合Tabs使用
      "pages/list/ListAutoRefreshPage",//自动刷新
    ]
    let listDataArray: GridData[] = []
    for (let i = 0; i < listName.length; i++) {
      listDataArray.push(new GridData(listName[i], listUrl[i]))
    }
    this.itemArray.push(new ListData("List列表功能相关", listDataArray))

    let gridName = [
      "普通数据模式", "懒加载数据模式", "下拉刷新", "上拉加载", "刷新&加载", "模拟网络数据(懒加载)",
      "带有头", "带有尾", "页面吸顶刷新", "页面顶部吸顶刷新", "自定义刷新头加载尾", "网格拖拽"
    ]

    let gridUrl = [
      "pages/grid/GridViewPage", //普通的网格列表
      "pages/grid/GridViewLazyPage", //普通的网格列表
      "pages/grid/GridViewRefreshPage", //下拉刷新网格列表
      "pages/grid/GridViewLoadMorePage", //上拉加载
      "pages/grid/GridViewUpAndDownPage", //刷新加载网格列表
      "pages/grid/GridViewNetLazyPage", //刷新加载网格列表 -模拟网络
      "pages/grid/GridViewHeaderPage", //带有头的网格列表
      "pages/grid/GridViewFooterPage", //带有尾的网格列表
      "pages/grid/GridStickyTopPage", //页面吸顶
      "pages/grid/GridStickLayoutViewPage", //页面顶部吸顶
      "pages/grid/GridRefreshHeaderFooterPage", // 自定义刷新头加载尾
      "pages/grid/GridDropPage"
    ]

    let gridDataArray: GridData[] = []
    for (let i = 0; i < gridName.length; i++) {
      gridDataArray.push(new GridData(gridName[i], gridUrl[i]))
    }
    this.itemArray.push(new ListData("Grid网格列表功能相关", gridDataArray))

    let waterFlowName = [
      "普通数据模式", "懒加载数据模式", "带有头的瀑布流列表", "瀑布流页面吸顶"
    ]

    let waterFlowUrl = [
      "pages/staggered/StaggeredPage", //普通的瀑布流列表
      "pages/staggered/StaggeredLazyPage", //懒加载瀑布流列表
      "pages/staggered/StaggeredHeadPage", //带有头的瀑布流列表
      "pages/sticky/StickyTopStaggeredPage",//瀑布流页面吸顶
    ]

    let waterFlowDataArray: GridData[] = []
    for (let i = 0; i < waterFlowName.length; i++) {
      waterFlowDataArray.push(new GridData(waterFlowName[i], waterFlowUrl[i]))
    }

    this.itemArray.push(new ListData("WaterFlow瀑布流列表功能相关", waterFlowDataArray))


    let otherName = [
      "任意组件", "下滑进入二楼", "二楼应用场景",
      "普通加载数据操作", "懒加载数据操作", "缺省页"
    ]

    let otherUrl = [
      "pages/layout/LayoutViewPage", //任意组件
      "pages/floor/SecondFloorPage", //下滑进入二楼
      "pages/floor/example/SecondFloorExample", //二楼应用场景
      "pages/data/DataOperationPage", //普通加载数据操作
      "pages/data/LazyDataOperationPage", //懒加载数据操作
      "pages/default/ErrorOrEmptyPage",//缺省页
    ]

    let otherDataArray: GridData[] = []
    for (let i = 0; i < otherName.length; i++) {
      otherDataArray.push(new GridData(otherName[i], otherUrl[i]))
    }

    this.itemArray.push(new ListData("其他常见功能", otherDataArray))
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(item: ListData, _: number): void {
    Column() {
      Text(item.name)
        .width("100%")
        .height(50)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .fontColor(Color.White)
        .margin({ bottom: 10 })
        .backgroundColor("#CD5C5C")

      GridView({
        items: item.items, //数据源 数组
        prohibitRefresh: true,
        itemLayout: (item, index) => {
          this.gridItemLayout(item as GridData, index)
        },
        controller: this.controller, //控制器，负责关闭下拉和上拉
      })
    }
  }

  @Builder
  gridItemLayout(item: GridData, _: number): void {
    Text(item.name)
      .width("95%")
      .height(50)
      .margin({ left: "2.5%", bottom: 10 })
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .onClick(() => {
        router.pushUrl({ url: item.url })
      })
  }

  build() {
    Column() {
      ActionBar({ title: "首页", hiddenBack: true })
      ListView({
        items: this.itemArray, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
        prohibitRefresh: true,
        itemLayout: (item: Object, index: number) => {
          this.itemLayout(item as ListData, index)
        }, //转成你需要的对象
        listAttribute: (attr) => {
          attr.edgeEffect = EdgeEffect.Spring
        }
      })
    }.width('100%')
    .height('100%')
  }
}

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:List数据对象
 * */
class ListData {
  name?: string
  items?: GridData[]

  constructor(name?: string, items?: GridData[]) {
    this.name = name
    this.items = items
  }
}

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:Grid数据对象
 * */
class GridData {
  name?: string
  url?: string

  constructor(name?: string, url?: string) {
    this.name = name
    this.url = url
  }
}