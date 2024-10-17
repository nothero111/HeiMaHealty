import searchHeader from '../record/SearchHead'
import statsCard from '../record/statscard'
import recordList from '../record/recordList'
import RecordVO from '../../viewmodel/RecordVO'
import RecordService from '../../Service/RecordService'
import DateUtil from '../../Until/DateUtil'

@Component
export default struct recordIndex {

  @StorageProp('selectedDate')
  @Watch('aboutToAppear')//当日期变更，会触发watch函数
  selectedDate: number = DateUtil.beginTimeOfDay(new Date())
  @Provide  records:RecordVO[] = []

 async aboutToAppear() {

   this.records =  await RecordService.queryRecordByDate(this.selectedDate)
  }
  build() {
      Column(){
    //1.头部搜索栏
        searchHeader()
        //2.日期
    statsCard()
        //3.记录列表
        recordList()
          .layoutWeight(1)
      }.width('100%')
    .height('100%').backgroundColor('#f5f5f5')
  }
}