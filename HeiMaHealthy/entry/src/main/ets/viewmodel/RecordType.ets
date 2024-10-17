export default class RecordType{

  id:number

  name:ResourceStr

  icon:ResourceStr

  min:number

  max:number
  //类型id，类型名称，类型图标，最小卡路里推荐，最大卡路里推荐
  constructor(id:number,name:ResourceStr,icon:ResourceStr,min:number=0,max:number=0) {
  this.id  = id
    this.name = name
    this.icon = icon
    this.min = min
  this.max = max
  }
}