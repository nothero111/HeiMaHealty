import groupInfo from '../viewmodel/groupInfo'
import itemCategory from '../viewmodel/itemCategory'
import RecordItem from '../viewmodel/Recorditem'
import { FoodCategory, FoodCategoryEnum, WorkoutCategories, WorkoutCategoryEnum } from './itemCategryModel'


const foods: RecordItem[] = [
  new RecordItem(0,'米饭',$r('app.media.rice'),FoodCategoryEnum.STAPLE,'碗',209, 46.6, 4.7, 0.5),
  new RecordItem(1,'馒头',$r('app.media.steamed_bun'),FoodCategoryEnum.STAPLE,'个', 114, 24.0, 3.6, 0.6),
  new RecordItem(2,'面包',$r('app.media.bun'),FoodCategoryEnum.STAPLE,'个', 188, 35.2, 5.0, 3.1),
  new RecordItem(3,'全麦吐司',$r('app.media.toast'),FoodCategoryEnum.STAPLE,'片', 91, 15.5, 4.4, 1.3),
  new RecordItem(4,'紫薯',$r('app.media.purple_potato'),FoodCategoryEnum.STAPLE,'个', 163, 42.0, 1.6, 0.4),
  new RecordItem(5,'煮玉米',$r('app.media.corn'),FoodCategoryEnum.STAPLE,'根', 111, 22.6, 4.0, 1.2),
  new RecordItem(6,'黄瓜',$r('app.media.cucumber'),FoodCategoryEnum.FRUIT,'根', 29, 5.3, 1.5, 0.4),
  new RecordItem(7,'蓝莓',$r('app.media.blueberry'),FoodCategoryEnum.FRUIT,'盒', 71, 18.1, 0.9, 0.4),
  new RecordItem(8,'草莓',$r('app.media.strawberry'),FoodCategoryEnum.FRUIT,'颗', 14, 3.1, 0.4, 0.1),
  new RecordItem(9,'火龙果',$r('app.media.pitaya'),FoodCategoryEnum.FRUIT,'个', 100, 24.6, 2.2, 0.5),
  new RecordItem(10,'奇异果',$r('app.media.kiwi'),FoodCategoryEnum.FRUIT,'个', 25, 8.4, 0.5, 0.3),
  new RecordItem(11,'煮鸡蛋',$r('app.media.egg'),FoodCategoryEnum.MEAT,'个', 74, 0.1, 6.2, 5.4),
  new RecordItem(12,'煮鸡胸肉',$r('app.media.chicken_breast'),FoodCategoryEnum.MEAT,'克', 1.15, 0.011, 0.236, 0.023),
  new RecordItem(13,'煮鸡腿肉',$r('app.media.chicken_leg'),FoodCategoryEnum.MEAT,'克', 1.87, 0.0, 0.243, 0.092),
  new RecordItem(14,'牛肉',$r('app.media.beef'),FoodCategoryEnum.MEAT,'克', 1.22, 0.0, 0.23, 0.033),
  new RecordItem(15,'鱼肉',$r("app.media.fish"),FoodCategoryEnum.MEAT,'克', 1.04, 0.0, 0.206, 0.024),
  new RecordItem(16,'牛奶',$r("app.media.milk"),FoodCategoryEnum.MEAT,'毫升', 0.66, 0.05, 0.03, 0.038),
  new RecordItem(17,'酸奶',$r("app.media.yogurt"),FoodCategoryEnum.MEAT,'毫升', 0.7, 0.10, 0.032, 0.019),
  new RecordItem(18,'核桃',$r("app.media.walnut"),FoodCategoryEnum.NUT,'颗', 42, 1.2, 1.0, 3.8),
  new RecordItem(19,'花生',$r("app.media.peanut"),FoodCategoryEnum.NUT,'克', 3.13, 0.13, 0.12, 0.254),
  new RecordItem(20,'腰果',$r("app.media.cashew"),FoodCategoryEnum.NUT,'克', 5.59, 0.416, 0.173, 0.367),
  new RecordItem(21,'无糖拿铁',$r("app.media.coffee"),FoodCategoryEnum.OTHER,'毫升', 0.43, 0.044, 0.028, 0.016),
  new RecordItem(22,'豆浆', $r("app.media.soybean_milk"), FoodCategoryEnum.OTHER, '毫升', 0.31, 0.012, 0.02, 0.016)
]


const workouts:RecordItem[] = [
  new RecordItem(0,'散步',$r('app.media.ic_walk'), WorkoutCategoryEnum.WALKING,'小时', 111),
  new RecordItem(1,'快走',$r('app.media.ic_walk'), WorkoutCategoryEnum.WALKING,'小时', 343),
  new RecordItem(2,'慢跑',$r('app.media.ic_running'), WorkoutCategoryEnum.RUNNING,'小时', 472),
  new RecordItem(3,'快跑',$r('app.media.ic_running'), WorkoutCategoryEnum.RUNNING,'小时', 652),
  new RecordItem(4,'自行车',$r('app.media.ic_ridding'), WorkoutCategoryEnum.RIDING,'小时', 497),
  new RecordItem(5,'动感单车',$r('app.media.ic_ridding'), WorkoutCategoryEnum.RIDING,'小时', 587),
  new RecordItem(6,'瑜伽',$r('app.media.ic_aerobics'), WorkoutCategoryEnum.AEROBICS,'小时', 172),
  new RecordItem(7,'健身操',$r('app.media.ic_aerobics'), WorkoutCategoryEnum.AEROBICS,'小时', 429),
  new RecordItem(8,'游泳',$r('app.media.ic_swimming'), WorkoutCategoryEnum.SWIMMING,'小时', 472),
  new RecordItem(9,'冲浪',$r('app.media.ic_swimming'), WorkoutCategoryEnum.SWIMMING,'小时', 429),
  new RecordItem(10,'篮球',$r('app.media.ic_basketball'), WorkoutCategoryEnum.BALLGAME,'小时', 472),
  new RecordItem(11,'足球',$r('app.media.ic_football'), WorkoutCategoryEnum.BALLGAME,'小时', 515),
  new RecordItem(12,'排球',$r("app.media.ic_volleyball"), WorkoutCategoryEnum.BALLGAME,'小时', 402),
  new RecordItem(13,'羽毛球',$r("app.media.ic_badminton"), WorkoutCategoryEnum.BALLGAME,'小时', 381),
  new RecordItem(14,'乒乓球',$r("app.media.ic_table_tennis"), WorkoutCategoryEnum.BALLGAME,'小时', 321),
  new RecordItem(15,'哑铃飞鸟',$r("app.media.ic_dumbbell"), WorkoutCategoryEnum.STRENGTH,'小时', 312),
  new RecordItem(16,'哑铃卧推',$r("app.media.ic_dumbbell"), WorkoutCategoryEnum.STRENGTH,'小时', 422),
  new RecordItem(17,'仰卧起坐',$r("app.media.ic_sit_up"), WorkoutCategoryEnum.STRENGTH,'小时', 515)
]

class ItemModel{

  getById(id:number,isFood:boolean = true):RecordItem{
    return isFood ? foods[id] : workouts[id]

  }

  list(isFood:boolean = true):RecordItem[]{
    return isFood ? foods : workouts
  }
  listItemGroupByCategory(isFood:boolean){
    //判断要处理的是食物还是运动
    let categories = isFood ? FoodCategory : WorkoutCategories
    let items = isFood ? foods : workouts
    //创建空的分组
    let groups = categories.map(itemCategor => new groupInfo<itemCategory,RecordItem>(itemCategor,[]))
//遍历记录项列表，将食物添加到对应的分组
    items.forEach(item=>{
    groups[item.categoryId].items.push(item)
  })
    return groups
  }
}

let itemModel = new ItemModel()
export default itemModel as ItemModel