import { router } from '@kit.ArkUI'
import { window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import itemList from '../view/item/itemList'
import RecordType from '../viewmodel/RecordType';
import { RecordTypeEnum, RecordTypes } from '../model/RecordTypeModel';
import groupInfo from '../viewmodel/groupInfo';
import RecordVO from '../viewmodel/RecordVO';


@Entry
@Component
struct ItemIndex {



  context = getContext(this) as common.UIAbilityContext


  onPageShow(): void {

    //1.获取跳转时的参数
let params = router.getParams() as groupInfo<RecordType,RecordVO>
    //2.获取点击的饮食记录类型
    this.type = params.type
    this.isFood = this.type.id !== RecordTypeEnum.WORKOUT
  }



@State
type:RecordType = RecordTypes[0]

@State isFood:boolean  = true


  build() {
    Column(){
    //1.头部导航
this.Header()
      //2.列表
      itemList({isFood:this.isFood,type:this.type})
        .layoutWeight(1)

    }
    .height('100%')
    .width('100%')
//passion
  }
  @Builder Header(){
    Row(){
      Image($r('app.media.returnArrow'))
        .width(24).onClick(()=>{
        router.back()
      })
      Blank()
      Text(this.type.name).fontSize(18)
        .fontWeight(600)
    }.width('94%').height(32)

  }

}