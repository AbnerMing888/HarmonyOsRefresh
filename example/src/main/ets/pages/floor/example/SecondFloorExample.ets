import {
  RefreshHeaderType,
  RefreshLayoutStatus,
  SecondFloorLayout,
  SfRefreshController,
  WindowFullScreenUtil
} from '@abner/refresh'
import window from '@ohos.window'
import { FirstFloorView } from './FirstFloorView'
import { SecondFloorView } from './SecondFloorView'
import { TopFixedView } from './TopFixedView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/27
 * INTRODUCE:二楼举例
 * */
@Entry
@Component
struct SecondFloorExample {
  @State sfController: SfRefreshController = new SfRefreshController()
  @State topViewHeight: number = 84
  @State statusBarHeight: number = 0
  @State mScrollInteraction: boolean = true
  @State currentIndex?: number = 0
  @State showSecondFloorStatus?: boolean = false //是否显示刷新状态
  @State refreshLayoutStatus?: RefreshLayoutStatus = RefreshLayoutStatus.Pulling
  @State isScrollSecondFloor?: boolean = true //默认滑动
  @State firstScrollDistance?: number = 0 //一楼滑动距离
  @State isActionStart: number = 0
  @State isSecondFloorLayoutEnabled: boolean = true

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

  @Builder
  firstFloorView(_this: SecondFloorExample) {
    FirstFloorView({
      currentIndex: _this.currentIndex,
      firstScrollDistance: _this.firstScrollDistance,
      refreshLayoutStatus: _this.refreshLayoutStatus,
      onChange: (position) => {
        //页面切换
        _this.currentIndex = position
      },
      onScrollStart: (isRefreshStart: boolean) => {
        //是否是起始位置
        _this.isScrollSecondFloor = isRefreshStart
      }
    })
      .width("100%")
      .height("100%")
  }

  @Builder
  secondFloorView() {
    SecondFloorView({
      statusBarHeight: this.statusBarHeight,
      firstScrollDistance: this.firstScrollDistance,
      refreshLayoutStatus: this.refreshLayoutStatus,
      isActionStart: this.isActionStart,
      onBackFirstFloor: () => {
        //点击回到一楼
        this.sfController.backFirstFloor(true)
      }
    })
  }

  @Builder
  topFixedView(_this: SecondFloorExample) {
    TopFixedView({
      currentIndex: _this.currentIndex,
      onTabClick: (position: number) => {
        _this.currentIndex = position
      }
    })
      .width("100%")
      .height(_this.topViewHeight)
      .padding({ top: _this.statusBarHeight })
      .backgroundColor(Color.Pink)
  }

  build() {
    RelativeContainer() {
      SecondFloorLayout({
        firstFloorView: () => {
          this.firstFloorView(this)
        }, //一楼视图
        isScrollSecondFloor: (this.currentIndex == 0 && this.isScrollSecondFloor) ? true : false,
        isNeedHalfFloor: true, //是否需要半楼功能
        showSecondFloorStatus: this.showSecondFloorStatus,
        secondFloorView: () => {
          this.secondFloorView()
        }, //二楼视图
        enableScrollInteraction: (isInteraction: boolean) => {
          //用于解决嵌套的滑动组件冲突
          this.mScrollInteraction = isInteraction
        },
        topFixedView: () => {
          this.topFixedView(this)
        }, //顶部固定视图
        sfController: this.sfController, //刷新控制器
        refreshHeaderAttribute: (attr) => {
          //刷新头及二楼滑动属性配置
          attr.headerType = RefreshHeaderType.POINTS
          attr.releaseText = "松开立即刷新"
          attr.releaseHalfFloorText = "请下拉访问↓"
          attr.halfFloorText = "继续下拉查看更多↓"
          attr.releaseSecondFloorText = "继续下拉查看更多↓"
          attr.secondFloorText = ""
          if (attr.headerPointsAttr != undefined) {
            attr.headerPointsAttr.secondFloorStatusText = "二楼可以访问品牌专区"
            attr.headerPointsAttr.fontColor = Color.White
            attr.headerPointsAttr.fontSize = 12 //文字大小
          }
        },
        onScrollDistance: (distance) => {
          this.firstScrollDistance = distance
        },
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.sfController.finishRefresh()
          }, 5000)
        },
        onScrollStatus: (status) => {
          //当前的滑动状态
          //这里判断，如果是刷新中，可以禁止页面滑动
          if (status == RefreshLayoutStatus.Refreshing) {
            this.isSecondFloorLayoutEnabled = false
          } else {
            this.isSecondFloorLayoutEnabled = true
          }
          if (status == RefreshLayoutStatus.ReleaseHalfFloor) {
            this.showSecondFloorStatus = true
          } else {
            this.showSecondFloorStatus = false
          }
          this.refreshLayoutStatus = status
          //如果滑动到了二楼，是否禁止二楼滑动
          this.isScrollSecondFloor = (status == RefreshLayoutStatus.SecondFloor) ? false : true
        },
        onActionStart: () => {
          //动作开始
          this.isActionStart++
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
    .enabled(this.isSecondFloorLayoutEnabled)
  }
}