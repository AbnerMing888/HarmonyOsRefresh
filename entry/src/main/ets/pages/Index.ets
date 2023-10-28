import router from '@ohos.router'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/28
 * INTRODUCE:首页
 * */
@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        Button("ListView").onClick(() => {
          router.pushUrl({ url: "pages/ListViewPage" })
        })
        Button("GridView").margin({ top: 10 }).onClick(() => {
          router.pushUrl({ url: "pages/GridViewPage" })
        })
        Button("RefreshLayout").margin({ top: 10 }).onClick(() => {
          router.pushUrl({ url: "pages/RefreshLayoutPage" })
        })
        Button("固定头部组件").margin({ top: 10 }).onClick(() => {
          router.pushUrl({ url: "pages/FixedHeadPage" })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}