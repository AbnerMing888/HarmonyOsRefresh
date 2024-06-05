import { TabBarView } from '@abner/tab'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/27
 * INTRODUCE:二楼顶部固定视图
 * */
@Component
export struct TopFixedView {
  /**
   * AUTHOR:AbnerMing
   * INTRODUCE:搜索布局位置
   * */
  searchAlignRus: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
    'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
    'left': {
      'anchor': '__container__', 'align': HorizontalAlign.Start
    },
    'right': {
      'anchor': 'icon_message', 'align': HorizontalAlign.Start
    },
    'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom }
  }
  /**
   * AUTHOR:AbnerMing
   * INTRODUCE:发布按钮的位置
   * */
  publishAlignRue: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
    'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
    'right': { 'anchor': '__container__', 'align': HorizontalAlign.End },
    'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom }
  }
  /**
   * AUTHOR:AbnerMing
   * INTRODUCE:消息按钮的位置
   * */
  messageAlignRue: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
    'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
    'right': { 'anchor': 'icon_publish', 'align': HorizontalAlign.Start },
    'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom }
  }
  @Prop currentIndex?: number = 0
  onTabClick?: (position: number) => void //点击事件

  build() {
    Column() {

      RelativeContainer() {
        Row() {
          Image($r("app.media.app_icon"))
            .width(16)
            .height(16)
            .margin({ left: 12 })

          Text("请输入搜索内容")
            .fontColor("#ffBABEC4")
            .fontSize(14)
            .fontWeight(400)
            .margin({ left: 4 })
        }
        .height(36)
        .margin({ left: 20, right: 28 })
        .borderRadius(4)
        .backgroundColor("#FFFFFF")
        .alignRules(this.searchAlignRus)
        .id("layout_search")
        .onClick(() => {
          // 跳转搜索
        })

        Image($r("app.media.app_icon"))
          .width(24)
          .height(24)
          .alignRules(this.messageAlignRue)
          .id("icon_message")
          .margin({ right: 20 })
          .onClick(() => {

          })

        Image($r("app.media.app_icon"))
          .width(24)
          .height(24)
          .alignRules(this.publishAlignRue)
          .id("icon_publish")
          .margin({ right: 20 })
          .onClick(() => {

          })

      }.height(44)

      TabBarView({
        tabList: ["一", "条目", "条目一", "我条目二", "我是条目三"],
        tabHeight: 40,
        isAverage: false,
        currentIndex: this.currentIndex,
        onTabClick: this.onTabClick
      })

    }
  }
}