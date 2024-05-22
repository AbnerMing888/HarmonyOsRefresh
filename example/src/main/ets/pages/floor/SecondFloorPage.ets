import { SecondFloorLayout, SfRefreshController, WindowFullScreenUtil } from '@abner/refresh'
import { window } from '@kit.ArkUI'

@Entry
@Component
struct SecondFloorPage {
  @State sfController: SfRefreshController = new SfRefreshController()
  @State topViewHeight: number = 44
  @State statusBarHeight: number = 0
  @State mScrollInteraction: boolean = true

  onPageShow(): void {

    let sysBarProps: window.SystemBarProperties = {
      statusBarColor: "#00000000",
      navigationBarColor: '#00000000',
      // 以下两个属性从API Version 8开始支持
      statusBarContentColor: '#ffffff',
      navigationBarContentColor: '#ffffff'
    }

    WindowFullScreenUtil.changeWindowFullScreen(true, {
      sysBarProps: sysBarProps,
      success: (win) => {
        // 2. 获取布局避让遮挡的区域
        let area = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
        this.statusBarHeight = px2vp(area.topRect.height)
        this.topViewHeight = this.topViewHeight + this.statusBarHeight
      }
    })
  }

  onBackPress(): boolean | void {
    let sysBarProps: window.SystemBarProperties = {
      statusBarColor: "#ff0000",
      navigationBarColor: '#ff0000',
      // 以下两个属性从API Version 8开始支持
      statusBarContentColor: '#ffffff',
      navigationBarContentColor: '#ffffff'
    };
    WindowFullScreenUtil.changeWindowFullScreen(false, { sysBarProps: sysBarProps })

  }

  /*
  * Author:AbnerMing
  * Describe:一楼视图
  */
  @State listPosition: number = 0; // 0代表滚动到List顶部，1代表中间值，2代表滚动到List底部。

  @Builder
  firstFloorView(_this: SecondFloorPage) {
    Scroll() {
      Image($r("app.media.taobao_index"))
        .width("100%")
    }
    .width("100%")
    .height("100%")
    .onReachStart(() => {
      _this.listPosition = 0
    })
    .enableScrollInteraction(_this.mScrollInteraction)
    .onScrollFrameBegin((offset: number, _: ScrollState) => {
      _this.sfController.markStartLocation(_this.listPosition == 0)
      if (_this.listPosition == 0 && offset <= 0) {
        return { offsetRemain: 0 }
      }
      _this.listPosition = 1
      return { offsetRemain: offset }
    })

  }

  /*
 * Author:AbnerMing
 * Describe:二楼视图
 */
  @Builder
  secondFloorView() {
    Column() {
      Image($r("app.media.taobao_second_floor"))
        .width("100%")
        .height("100%")
    }
    .width("100%")
    .height("100%")
  }

  /*
 * Author:AbnerMing
 * Describe:顶部固定视图
 */
  @Builder
  topFixedView(this_: SecondFloorPage) {
    Column() {
      Text("淘宝二楼")
        .fontColor(Color.White)
    }
    .width("100%")
    .height(this_.topViewHeight)
    .padding({ top: this_.statusBarHeight })
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    RelativeContainer() {
      SecondFloorLayout({
        firstFloorView: () => { //一楼视图
          this.firstFloorView(this)
        },
        isNeedHalfFloor: true, //是否需要半楼功能
        secondFloorView: this.secondFloorView, //二楼视图
        enableScrollInteraction: (isInteraction: boolean) => {
          //用于解决嵌套的滑动组件冲突
          this.mScrollInteraction = isInteraction
        },
        topFixedView: () => {
          //顶部固定视图
          this.topFixedView(this)
        },
        sfController: this.sfController, //刷新控制器
        refreshHeaderAttribute: (attr) => {
          //刷新头及二楼滑动属性配置
          attr.fontColor = Color.White
          attr.timeFontColor = Color.White
        },
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.sfController.finishRefresh()
          }, 2000)
        },
        onScrollStatus: (status) => {
          //当前的滑动状态

        }
      })
        .id('SecondFloorView')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}