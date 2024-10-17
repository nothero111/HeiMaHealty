export default class RecordPO{
  //记录id
  id?:number

  //饮食记录类型
  typeId:number



  //记录中的食物或运动信息
  itemId:number

  //实物数量或运动总时长，若无则为0
  amount:number

  //建立时间
  createTime:number

  constructor(id:number,typeId:number,itemId:number,amount:number=0,createTime:number) {
  this.id = id

    this.typeId = typeId

    this.itemId = itemId

    this.amount = amount

    this.createTime = createTime
  }

}