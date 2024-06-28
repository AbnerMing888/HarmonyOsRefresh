import { ViewPager } from '@abner/tab'
import { CommunityView } from './CommunityView'
import { RefreshLayoutStatus, RefreshArcView } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/27
 * INTRODUCE:一楼视图
 * */
@Component
export struct FirstFloorView {
  onChange?: (position: number) => void //页面滑动监听
  @Prop currentIndex?: number = 0 //默认第0个
  onScrollStart?: (isRefreshStart: boolean) => void
  @Prop firstScrollDistance?: number = 0 //一楼滑动距离
  @Prop refreshLayoutStatus?: RefreshLayoutStatus = RefreshLayoutStatus.Pulling //当前的刷新状态
  private arcMaxHeight: number = 20

  @Builder
  itemLayout(position: number, _this: FirstFloorView) {
    //可根据索引 进行设置不同的页面
    if (position == 1) {
      Column() {
        //顶部的弧度
        RefreshArcView({
          arcHeight: _this.firstScrollDistance! > this.arcMaxHeight ? this.arcMaxHeight : _this.firstScrollDistance
        })
        CommunityView({
          onScrollStart: _this.onScrollStart,
          firstScrollDistance: _this.firstScrollDistance,
          refreshLayoutStatus: _this.refreshLayoutStatus
        }).margin({ top: -2 })

      }.height("100%")
      .width("100%")
    } else {

      Column() {
        Text("我是条目" + position)
      }.height("100%")
      .width("100%")
      .backgroundColor(Color.White)

    }

  }

  build() {
    ViewPager({
      pageSize: 5,
      onChange: this.onChange,
      itemLayout: (position: number) => {
        this.itemLayout(position, this)
      },
      currentIndex: this.currentIndex
    })
  }
}