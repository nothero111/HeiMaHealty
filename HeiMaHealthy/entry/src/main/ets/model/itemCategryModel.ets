import itemCategory from '../viewmodel/itemCategory'


enum FoodCategoryEnum {
  //主食
  STAPLE,
  //蔬果
  FRUIT,
  //肉奶蛋
  MEAT,
  //坚果
  NUT,
  //其他
  OTHER,
  WALKING
} //不给枚举赋值，那枚举的值就是从0开始一直结束
//不给枚举赋值，那枚举的值就是从0开始一直结束

let FoodCategory = [
  new itemCategory(0,$r('app.string.staple')),
new itemCategory(1,$r('app.string.fruit')),
new itemCategory(2,$r('app.string.meat')),
new itemCategory(3,$r('app.string.nut')),
new itemCategory(4,$r('app.string.other_type'))
]


enum WorkoutCategoryEnum{
  //走路
  WALKING,
  //跑步
  RUNNING,
  //骑行
  RIDING,

  //跳操

  AEROBICS,
  //游泳

  SWIMMING,
  //打球

  BALLGAME,

  //力量训练

  STRENGTH
}

let WorkoutCategories = [
  new itemCategory(0,$r('app.string.walking_type')),
new itemCategory(1,$r('app.string.running')),
new itemCategory(2,$r('app.string.riding')),
new itemCategory(3,$r('app.string.aerobics')),
new itemCategory(4,$r('app.string.swimming')),
new itemCategory(5,$r('app.string.ballgame')),
new itemCategory(6,$r('app.string.strength'))

]


export {FoodCategoryEnum,FoodCategory,WorkoutCategoryEnum,WorkoutCategories}