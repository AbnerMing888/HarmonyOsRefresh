import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2026/1/6
 * INTRODUCE:聊天页面
 * */
@Entry
@Component
struct ListChatPage {
  @State chatArray: ChatBean[] = []
  controller: RefreshController = new RefreshController()

  aboutToAppear(): void {
    //初始化消息
    this.chatArray.push(new ChatBean("你好", true))
    this.chatArray.push(new ChatBean("你好，请问有什么事吗", false))
  }

  @Builder
  itemLayout(item: ChatBean, index: number) {
    if (item.isUser) {
      //我
      Row() {
        Text(item.content)
      }.width("100%")
      .justifyContent(FlexAlign.End)
    } else {
      //对方
      Row() {
        Text(item.content)
      }.width("100%")

    }
  }

  build() {
    RelativeContainer() {
      ListView({
        items: this.chatArray,
        space: 10,
        controller: this.controller,
        itemLayout: (item: Object, index: number) => {
          this.itemLayout(item as ChatBean, index)
        },
        listAttribute: (attr) => {
          attr.height = "100%"
        },
        onRefresh: () => {
          //刷新，加载历史数据
          for (let i = 0; i < 30; i++) {
            let isUser = true
            if (i % 3 == 0) {
              isUser = false
            }
            this.chatArray.unshift(new ChatBean("我是新的数据" + new Date().toLocaleString(), isUser))
          }
          this.controller.finishRefresh()
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}


class ChatBean {
  content?: string
  isUser?: boolean

  constructor(content?: string, isUser?: boolean) {
    this.content = content
    this.isUser = isUser
  }
}