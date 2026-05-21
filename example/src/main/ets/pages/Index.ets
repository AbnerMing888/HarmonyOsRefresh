import { TitleBar } from '@abner/bar';
import { GridView } from '@abner/refresh';
import { MainView, replacePage, startPage } from '@abner/router';
import display from '@ohos.display';
import window from '@ohos.window';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:Demo首页
 * */

@Entry
@Component
struct Index {
  @State refreshMenus: string[] =
    ["List列表", "Grid网格", "WaterFlow瀑布流", "下滑进入二楼", "二楼案例(瀑布流)",
      "二楼案例(列表)", "普通数据操作", "懒加载数据操作"]
  @State refreshRouters: string[] = [
    "example_ListIndex", "example_GridIndex", "example_FlowIndex", "example_SecondFloorPage",
    "example_SecondFloorExample",
    "example_SecondFloorExample2", "example_ListViewDataOperationPage", "example_ListViewLazyDataOperationPage"
  ]
  @State private isWideFold: boolean = false
  private windowWidth: number = 0
  private windowHeight: number = 0

  aboutToAppear(): void {
    try {
      let isFoldable = display.isFoldable()
      // 2. 监听窗口尺寸变化
      window.getLastWindow(this.getUIContext().getHostContext(), (_, win) => {
        this.windowWidth = this.getUIContext().px2vp(win.getWindowProperties().windowRect.width)
        this.windowHeight = this.getUIContext().px2vp(win.getWindowProperties().windowRect.height)
        if (isFoldable) {
          this.isWideFold = this.initWideFold()
        }
      })
    } catch (error) {

    }
  }

  build() {
    RelativeContainer() {
      MainView() {
        Column() {
          TitleBar({ title: "刷新组件库(v1装饰器)", hideLeftMenu: true })
          Row() {
            Column() {
              Text("RefreshView")
                .fontSize(14)
                .fontColor(Color.White)
              Text("基于系统Refresh封装的刷新加载组件")
                .fontSize(13)
                .fontColor(Color.White)
                .margin({ top: 10 })
                .textAlign(TextAlign.Center)
            }
            .height("100%")
            .layoutWeight(1)
            .backgroundColor($r("app.color.tab_select_color"))
            .justifyContent(FlexAlign.Center)
            .borderRadius(10)
            .margin({ right: 10 })
            .padding({ left: 10, right: 10 })
            .onClick(() => {
              startPage("example_Rv1Index")
            })

            Column() {
              Text("LitheView")
                .fontColor(Color.White)
                .fontSize(14)
                .fontColor(Color.White)
              Text("一个完全自定义的刷新加载组件")
                .fontSize(13)
                .fontColor(Color.White)
                .margin({ top: 10 })
                .textAlign(TextAlign.Center)
            }
            .padding({ left: 10, right: 10 })
            .height("100%")
            .layoutWeight(1)
            .backgroundColor($r("app.color.tab_select_color"))
            .justifyContent(FlexAlign.Center)
            .borderRadius(10)
            .margin({ left: 10 })
            .onClick(() => {
              startPage("example_LitheV1Index")
            })

          }.width("100%")
          .height(120)
          .padding({ left: 20, right: 20 })

          this.refreshItem("常见列表封装案例", this.refreshMenus)
        }
        .height('100%')
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
    }
  }

  @Builder
  refreshItem(name: string, menus: string[]) {
    Text(name)
      .margin({ top: 20, left: 20, bottom: 20 })
      .fontSize(15)
      .fontColor($r("app.color.tab_select_color"))

    GridView({
      items: menus,
      itemLayout: (item: Object, index: number) => {
        this.GridViewItem(item as string, index)
      },
      columnSize: this.isWideFold ? 3 : 2, //如果是折叠，三
      gridAttribute: (attr) => {
        attr.columnsGap = 10
        attr.rowsGap = 10
        attr.padding = { left: 20, right: 20 }
      }
    })
  }

  @Builder
  GridViewItem(item: string, index: number) {
    Text(item)
      .width("100%")
      .height(50)
      .fontSize(13)
      .border({ width: 1, color: $r("app.color.tab_select_color"), radius: 5 })
      .textAlign(TextAlign.Center)
      .onClick(() => {
        startPage(this.refreshRouters[index])
      })
  }

  // 推断是否为阔折叠的示例方法
  private initWideFold(): boolean {
    const aspectRatio = this.windowWidth / this.windowHeight;
    const isOuterScreen = aspectRatio > 0.6 && aspectRatio < 0.75 && this.windowHeight <= 700;
    const isInnerScreen = aspectRatio > 1.3 && aspectRatio < 1.5 && this.windowWidth >= 900;
    return isOuterScreen || isInnerScreen;
  }
}