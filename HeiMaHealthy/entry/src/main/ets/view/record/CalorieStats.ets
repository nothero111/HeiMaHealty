
@Component
export default struct calorieStats {
  @Prop intake:number
  @Prop expend:number
  @State recommend:number = 1962
  build() {
    Row({space:6}){
      //1.饮食摄入
      statsBuilder('饮食摄入',this.intake)
      //还可以吃
      Stack(){
        Progress({
          value:this.intake,
          total:this.recommend + this.recommend,
          type:ProgressType.Ring
        }).width(130).style({strokeWidth:10})
          .color('#5bbfdc')
        statsBuilder('还可以吃',this.recommend+this.expend-this.intake,this.recommend)

      }
      //3.运动消耗
      statsBuilder('运动消耗',this.expend)
    }.width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top:30,bottom:35})
  }
}
@Builder function statsBuilder(lab:string,value:number,tips?:number){
  Column({space:6}){
    Text(lab).fontColor('#909092').fontWeight(600)
    Text(value+'').fontSize(20).fontWeight(700)
    if(tips){
      Text('推荐'+tips).fontSize(12).fontColor(Color.Gray)
    }
  }

}