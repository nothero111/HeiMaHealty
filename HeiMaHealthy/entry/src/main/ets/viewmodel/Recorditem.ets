//数据模型所记录的可以是运动也可以是食物


export default class RecordItem{

  //id
  id:number

  //名字
  name:ResourceStr

  //图片
  image:ResourceStr

//分类id
  categoryId:number

  //卡路里
  calorie:number


  //单位
  unit:ResourceStr

  //碳水
  carbon:number


  //蛋白质
  protein:number


  //脂肪
  fat:number

  constructor(
  id:number,
  name:ResourceStr,
image:ResourceStr,

  categoryId:number,

    unit:ResourceStr,
  calorie:number,



  carbon:number = 0,

  protein:number = 0,

  fat:number = 0
  ) {
    this.id = id
    this.name = name
    this.image = image
    this.categoryId = categoryId
    this.calorie = calorie
    this.unit = unit
    this.carbon = carbon
    this.protein = protein
    this.fat = fat
  }

}