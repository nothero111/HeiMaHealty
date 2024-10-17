import RecordItem from '../../viewmodel/Recorditem'

@Component
export default  struct itemCard {
  @State pictureData:RecordItem = new RecordItem(0,'','',0,'',0)
  @Prop amount:number
@State isFood:boolean = true

  build() {
Column({space:10}){
  Image(this.pictureData.image)
    .width(150)
  Row(){
    Text(this.pictureData.name).fontWeight(700)
  }.backgroundColor('#ecfbf4').padding({top:5,bottom:5,left:10,right:10})
  Divider().width('94%').opacity(0.6)
  Row({space:8}){
    if(this.isFood){
      this.NutrientInfo('热量（千卡）',this.pictureData.calorie)
      this.NutrientInfo('碳水（克）',this.pictureData.carbon)
      this.NutrientInfo('蛋白质（克）',this.pictureData.protein)
      this.NutrientInfo('脂肪（克）',this.pictureData.fat)
    }else{
      this.NutrientInfo('热量（千卡）',this.pictureData.calorie)

    }

  }
  Divider().width('94%').opacity(0.6)
Row({space:4}){
    Column(){
      Text(this.amount.toFixed(1)).fontSize(50)
        .fontColor('#2ec881').fontWeight(600)
      Divider().color('#2ec881')
    }.width(150)
  Text(this.pictureData.unit).fontColor(Color.Gray)
}

}
  }
  @Builder NutrientInfo(label:string,value:number){
      Column({space:8}){
        Text(label).fontColor(Color.Gray).fontSize(14)
        Text((value*this.amount).toFixed(1)).fontSize(18).fontWeight(700)
      }
  }
}