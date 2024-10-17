import RecordPO from '../common/bean/RecordPO'
import itemModel from '../model/itemModel'
import RecordModel from '../model/RecordModel'
import { RecordTypeEnum, RecordTypes } from '../model/RecordTypeModel'
import DateUtil from '../Until/DateUtil'
import groupInfo from '../viewmodel/groupInfo'
import RecordItem from '../viewmodel/Recorditem'
import RecordType from '../viewmodel/RecordType'
import RecordVO from '../viewmodel/RecordVO'
import StatsInfo from '../viewmodel/StatsInfo'

class RecordService{
     async  insert(typeId:number,itemId:number,amount:number){
      //1.获取时间
      let createTime = (AppStorage.get('selectedDate')||DateUtil.beginTimeOfDay(new Date())) as number
      await RecordModel.insert(new RecordPO(0,typeId,itemId,amount,createTime))
    }
   async  deleteById(id:number){
      return await RecordModel.deleteById(id)
    }

   async  queryRecordByDate(date:number):Promise<RecordVO[]>{

     //1.查询数据库的RecordPO
     let rps =await RecordModel.queryByDate(date)
//2.将RecordPO转化为RecordVO
      return rps.map(rp =>{
        //2.1获取PO中的基本属性
        let rv = new RecordVO(0,0,0,new RecordItem(0,'','',0,'',0),0)
        if(rp.id)
        rv.id = rp.id
        rv.typeId = rp.typeId
        rv.amount = rp.amount
        //2.2查询记录项
        rv.recordItem = itemModel.getById(rp.itemId,rp.typeId !== RecordTypeEnum.WORKOUT)

        //2.3计算热量
rv.calories = rp.amount*rv.recordItem.calorie
        return rv

      })
    }
    calculatesStatsInfo(records:RecordVO[]):StatsInfo{
     let info = new StatsInfo()
      if(!records || records.length <= 0){
        return info

      }
      records.forEach(r => {
        if(r.typeId === RecordTypeEnum.WORKOUT){
          //运动，累加消耗热量
          info.expend += r.calories
          info.carbon += r.recordItem.carbon
          info.protein += r.recordItem.protein
          info.fat += r.recordItem.fat
        }
      })
      return info
    }

    calculateGroupInfo(records:RecordVO[]):groupInfo<RecordType,RecordVO>[]{
        //1.创建空的记录类型分组
     let groups =  RecordTypes.map(recordType =>
     new groupInfo(recordType,records)
      )

      if(!records || records.length <= 0){
        return groups

      }
      //2.遍历所有饮食记录，把每个记录存入对应类型的分组中
      records.forEach(record =>{
        groups[record.typeId].items.push(record)

        groups[record.typeId].calories += record.calories
      })
      return groups
    }
}

let recordService = new RecordService()
export default recordService as RecordService