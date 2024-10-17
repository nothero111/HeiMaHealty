import RecordItem from './Recorditem'

export default class RecordType{
  //记录id
  id:number

  //饮食记录类型
  typeId:number

  //卡路里总数
  calories:number

  //记录中的食物或运动信息
  recordItem:RecordItem

  //实物数量或运动总时长，若无则为0
  amount:number = 0

  constructor( id:number,typeId:number,calories:number,recordItem:RecordItem,amount:number = 0) {
  this.id = id
    this.typeId = typeId
    this.calories = calories
    this.recordItem = recordItem
    this.amount = amount
  }
}