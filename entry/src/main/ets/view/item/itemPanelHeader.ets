@Component
export default  struct panelHeader {

  build() {
    Row(){
      Text('2024年1月25日 早餐')
        .fontSize(18).fontWeight(600)
      Image($r('app.media.spinner'))
        .width(20)
    }.width('94%').justifyContent(FlexAlign.Center)
  }
}