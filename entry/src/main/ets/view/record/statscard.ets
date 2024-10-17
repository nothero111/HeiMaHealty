import DateUtil from '../../Until/DateUtil'
import datapick from './Datapick'
import calorieStats from '../record/CalorieStats'
import nutritStats from '../record/NutritStats'
import breakpointType from '../../common/bean/BreakpointType'
import BreakpointConstants from '../../common/constants/BreakpointConstants'
import RecordVO from '../../viewmodel/RecordVO'
import StatsInfo from '../../viewmodel/StatsInfo'
import RecordService from '../../Service/RecordService'

@Component
export default struct statsCard {

  @StorageProp('currentBreakpoint') currentBreakpoint:string = BreakpointConstants.BREAKPOINT_SM

@StorageProp('selectedDate') selectedDate: number = DateUtil.beginTimeOfDay(new Date())
      //DateUtil.beginTimeOfDay可以获取一天的开始日期并转为
  //毫秒数存入

  @Consume @Watch('handleRecordsChange') records:RecordVO[]
@State info: StatsInfo = new StatsInfo()

handleRecordsChange(){
    this.info = RecordService.calculatesStatsInfo(this.records)
}

  controller:CustomDialogController = new CustomDialogController({
    builder:datapick({selectData:new Date(this.selectedDate)})
  })
  build() {
    Column(){
//日期
      Row(){
        Text(DateUtil.formatDate(this.selectedDate)).fontColor('#9bb4a6')
        //DateUtil的formatDate可以格式化传入的毫秒数，转为对应的日期
        Image($r('app.media.downarrow')).width(20)
          .fillColor('#9bb4a6')
      }.padding(12).onClick(()=>{
        this.controller.open()
      })
//统计信息，以轮播图形式呈现
      Swiper(){
        calorieStats({intake:this.info.intake,expend:this.info.expend})
        nutritStats({carbon:this.info.carbon,protein:this.info.protein,fat:this.info.fat})
      }.width('100%')
      .indicator(
        new breakpointType({
          sm:true,
          md:true,
          lg:false
        }).getValue(this.currentBreakpoint)
      )
      .backgroundColor(Color.White)
      .borderRadius(18)
      .displayCount(new breakpointType({
        sm:1,
        md:1,
        lg:2
      }).getValue(this.currentBreakpoint))


    }.width('94%')
    .backgroundColor('#d9f0e2')
    .borderRadius(18)
  }
}