/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:页面Title
 * */
import router from '@ohos.router'

@Component
export struct ActionBar {
  @State title: string = "标题"
  @State hiddenBack: boolean = false

  build() {
    Stack() {
      Row() {
        Text(this.title)
          .fontColor(Color.White)
          .fontSize(16)
      }.width("100%")
      .justifyContent(FlexAlign.Center)

      Text("返回")
        .visibility(this.hiddenBack ? Visibility.Hidden : Visibility.Visible)
        .fontColor(Color.White)
        .align(Alignment.Center)
        .textAlign(TextAlign.Center)
        .alignSelf(ItemAlign.Center)
        .margin({ left: 10 })
        .fontSize(14)
        .onClick(() => {
          //销毁
          router.back()
        })
    }.height(44)
    .width("100%")
    .backgroundColor("#ff0000")
    .alignContent(Alignment.Start)
  }
}
