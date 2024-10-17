
@Component
export default struct nutritStats {
  @Prop carbon:number
  @Prop protein:number
  @Prop fat:number
  build() {
    Row({space:6}){
      //1.碳水摄入
      Column(){
        Stack(){
          Progress({
            value:this.protein,
            total:237,
            type:ProgressType.Ring
          }).width(110).style({strokeWidth:10})
            .color('#5bbfdc')
          statsBuilder(this.protein,237)

        }
        Text('碳水 (克)').fontSize(12).fontColor(Color.Gray)
          .margin({top:15})
      }
      //2.蛋白质摄入
      Column(){
        Stack(){
          Progress({
            value:this.protein,
            total:68,
            type:ProgressType.Ring
          }).width(110).style({strokeWidth:10})
            .color('#f2ce90')
          statsBuilder(this.protein,68)
        }
        Text('蛋白质  (克)').fontSize(12).fontColor(Color.Gray)
          .margin({top:15})

      }

      //3.脂肪摄入
      Column(){
        Stack(){
          Progress({
            value:this.protein,
            total:53,
            type:ProgressType.Ring
          }).width(110).style({strokeWidth:10})
            .color('#f4929d')
          statsBuilder(this.protein,43)

        }
        Text('脂肪 (克)').fontSize(12).fontColor(Color.Gray)
          .margin({top:15})

      }
    }.width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top:30,bottom:35})
  }
}
@Builder function statsBuilder(value:number,maxIn:number){
  Column({space:6}){
    Text('摄入推荐').fontColor('#94e9c7').fontWeight(600)
    Text(value.toFixed(0)+'/'+maxIn).fontSize(20).fontWeight(700)


  }

}