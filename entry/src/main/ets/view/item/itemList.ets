import panelHeader from './itemPanelHeader'
import itemCard from './itemCard'
import numberKeyBoard from './numberKeyBoard'
import RecordItem from '../../viewmodel/Recorditem'
import itemModel from '../../model/itemModel'
import groupInfo from '../../viewmodel/groupInfo'
import itemCategory from '../../viewmodel/itemCategory'
import RecordService from '../../Service/RecordService'
import RecordType from '../../viewmodel/RecordType'
import { RecordTypes } from '../../model/RecordTypeModel'


@Component
export default struct itemList {
@Prop  type:RecordType

  @State pictureData:RecordItem =new RecordItem(0,'','',0,'',0)
  @State amount:number  = 1
  @State value:string = ''
@Prop isFood:boolean
dialogController:CustomDialogController = new CustomDialogController({
  builder:MyDialog({
    amount:this.amount,
    value:this.value,
    pictureData:this.pictureData,
    isFood:this.isFood,
    type:this.type
  }),customStyle:true
})

  build() {


    Tabs(){
      TabContent(){
        this.ListTabContent(itemModel.list(this.isFood))
      }.tabBar('全部')
      ForEach(itemModel.listItemGroupByCategory(this.isFood),(item:groupInfo<itemCategory,RecordItem>)=>{
        TabContent(){
          this.ListTabContent(item.items)
        }.tabBar(item.type.name)
      })
    }.barMode(BarMode.Scrollable)
    .width('94%')
    .height('100%')
  }
  @Builder ListTabContent(items:RecordItem[]){
    List(){
      ForEach(items,(item:RecordItem)=>{
        ListItem(){
          Row({space:6}){
            Image(item.image).width(50)
            Column({space:4}){
              Text(item.name).fontWeight(500)
              Text(`${item.calorie}千卡/${item.unit}`).fontSize(14).fontColor(Color.Gray)
            }
            Blank()
            Image($r('app.media.add'))
              .width(18)
          }.width('100%')
          .padding(6)
        }
        .onClick(()=>{
          this.pictureData = item
          this.dialogController.open()
        })


      })
    }.width('100%')
    .height('100%')
  }


}
@CustomDialog
struct MyDialog{
  controller:CustomDialogController = new CustomDialogController({
    builder:{}
  })
  @Link type:RecordType
 @Link amount:number
  @Link value:string
  @Link pictureData:RecordItem
  @Link isFood:boolean
  build() {
    Column(){
      //1.弹窗顶部日期

      panelHeader()
      //2.记录项卡片

      itemCard({amount:this.amount,pictureData:this.pictureData,isFood:this.isFood})




      //4.按钮

      Row(){
        Button('取消')
          .width(120)
          .backgroundColor(Color.Gray)
          .type(ButtonType.Normal)
          .margin(8)
          .borderRadius(6)
          .onClick(()=>{
            this.controller.close()
          })
        Button('提交')
          .width(120)
          .backgroundColor(Color.Green)
          .type(ButtonType.Normal)
          .borderRadius(6)
          .onClick(()=>{

            //1.持久化保存
            RecordService.insert(this.type.id,this.pictureData.id,this.amount)
              .then(()=>{
                this.controller.close()
              }).catch(()=>{
                console.log('testDeg','保存失败')
            })
          })
      }
      //3.数字键盘
      numberKeyBoard({amount:$amount,value:$value})
    }.height('80%').backgroundColor('#f7f8fc')
      .borderRadius(20)
  }
}



