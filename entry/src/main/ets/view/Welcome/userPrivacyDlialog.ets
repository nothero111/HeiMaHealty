@Preview
@CustomDialog
@Component
export default struct noticeDialog{
  controller:CustomDialogController
  confirm:() => void = ()=>{}
  cancel:() => void = ()=>{}
  build() {
    Column({space:10}){
      Text('欢迎来到黑马健康').fontWeight(FontWeight.Bold)
        .fontSize(20)
      Text('感谢您信任并使用黑马健康！我们将通过《用户协议》和《黑马健康隐私政策》帮助您了解我们收集、使用、存储和共享个人信息的情况，特别是我们所采集的个人信息类型与用途的对应关系。\n' +
        '此外，您还能了解到您所享有的相关权利及实现途径。如您同意，请点击下方按钮开始接受我们的服务。')
      Button('同意').width(150).backgroundColor($r('app.color.welcome_back_ground'))
        .onClick(()=>{
          this.confirm()
          this.controller.close()
        })

      Button('不同意').width(150).backgroundColor('#edfef6').fontColor(Color.Gray)
        .onClick(()=>{
          this.cancel()
          this.controller.close()
        })
    }.width('100%')
    .padding(10)
  }
}