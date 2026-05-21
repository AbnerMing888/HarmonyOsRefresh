import {
  RefreshHeaderType, RefreshLayoutStatus, SecondFloorLayout, SfRefreshController,
} from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { SecondFloorView } from '../example/SecondFloorView'
import { TopFixedView } from '../example/TopFixedView'
import { FirstFloorView2 } from './FirstFloorView2'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/27
 * INTRODUCE:二楼举例(List列表)
 * */
@RouterPath("example_SecondFloorExample2")
@Component
export struct SecondFloorExample2 {
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
  @State topViewOpacity: number = 1

  /*
  * Author:AbnerMing
  * Describe:一楼视图
  */
  @Builder
  firstFloorView(_this: SecondFloorExample2) {
    FirstFloorView2({
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

  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:二楼视图
   */
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

  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:固定视图
   */
  @Builder
  topFixedView(_this: SecondFloorExample2) {
    Column() {
      Column() {

      }.width("100%")
      .height(50)
      .backgroundColor($r("app.color.tab_select_color"))

      TopFixedView({
        currentIndex: _this.currentIndex,
        topViewOpacity: this.topViewOpacity,
        onTabClick: (position: number) => {
          _this.currentIndex = position
        }
      })
        .width("100%")
        .height(_this.topViewHeight)
        .padding({ top: _this.statusBarHeight })
        .backgroundColor($r("app.color.tab_select_color"))
    }
  }

  build() {

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
      onTopViewOpacity: (opacity) => {
        this.topViewOpacity = opacity
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
        attr.marginBottom = 0
        if (attr.headerPointsAttr != undefined) {
          attr.headerPointsAttr.secondFloorStatusText = "二楼可以访问品牌专区"
          attr.headerPointsAttr.fontColor = Color.White
          attr.headerPointsAttr.fontSize = 14 //文字大小
          attr.headerPointsAttr.secondFloorStatusFontWeight = FontWeight.Bold
        }
      },
      refreshAnimationDistance: 50,
      onScrollDistance: (distance) => {
        this.firstScrollDistance = distance
      },
      onRefresh: () => {
        //下拉刷新
        setTimeout(() => {
          this.sfController.finishRefresh()
        }, 5000)
      },
      onChangeScrollStatus: (status) => {

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
    }).enabled(this.isSecondFloorLayoutEnabled)

  }
}