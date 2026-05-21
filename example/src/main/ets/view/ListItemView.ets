/**
 *AUTHOR:AbnerMing
 *DATE:2026/4/27
 *INTRODUCE:
 */
@Component
export struct ListItemView {
  @Prop index: number

  build() {
    Column() {
      Text("列表数据:" + this.index)
        .width("100%")
        .height("100%")
        .textAlign(TextAlign.Center)
        .fontColor($r("app.color.tab_select_color"))
        .border({ width: 1, color: $r("app.color.tab_select_color") })
    }
    .width("100%")
    .height(50)
    .justifyContent(FlexAlign.Center)
    .padding({ left: 10, right: 10 })
    .margin({ bottom: 10 })
  }
}