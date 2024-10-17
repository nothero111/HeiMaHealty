import RecordService from '../../Service/RecordService'
import groupInfo from '../../viewmodel/groupInfo'
import RecordType from '../../viewmodel/RecordType'
import RecordVO from '../../viewmodel/RecordVO'
import StatsInfo from '../../viewmodel/StatsInfo'
import { router } from '@kit.ArkUI'

@Extend(Text) function textStyle(){
  .fontColor(Color.Gray).fontSize(14)
}

@Component
export default struct recordList {

  @Consume @Watch('handleRecordsChange') records:RecordVO[]
  @State groups: groupInfo<RecordType,RecordVO>[] = []

  handleRecordsChange(){
    this.groups = RecordService.calculateGroupInfo(this.records)
  }
  build() {
    List({space:10}){
      ForEach(this.groups,(group:groupInfo<RecordType,RecordVO>)=>{
  ListItem(){
    Column(){
      Row({space:4}){
        Image(group.type.icon).width(24)
        Text(group.type.name).fontSize(18).fontWeight(700)
        Text(`建议${group.type.min}~${group.type.max}千卡`).textStyle()
        Blank()
        Text(group.calories.toFixed(0)).fontColor(Color.Green).fontSize(14)
        Text('千卡').textStyle()
        Image($r('app.media.add')).width(20)

      }.width('100%').margin(8).height(40)
      .onClick(()=>{
          router.pushUrl({
            url:'pages/itemIndex',
            params:{type:group}
          })
      })
      List(){
        ForEach(group.items,(item:RecordVO)=>{
          ListItem(){
            Row({space:6}){
              Image(item.recordItem.image).width(50)
              Column({space:4}){
                Text(item.recordItem.name).fontWeight(500)
                Text(`${item.amount}${item.recordItem.unit}`).textStyle()
              }
              Blank()
              Text(`${item.calories}千卡`).textStyle()
            }.width('100%')
            .padding(6)
          }.swipeAction({end:()=>{
            DeletionButton()
          }})

        })
      }

    }.width('100%').backgroundColor(Color.White)
    .borderRadius(18).justifyContent(FlexAlign.Center)
  }
      })
    }.width('94%').margin({top:10})
  .height('100%')
  }
}
@Builder function DeletionButton(){
  Image($r('app.media.deletion')).height(20)
    .width(20)
}