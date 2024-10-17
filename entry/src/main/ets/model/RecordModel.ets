//数据库建表语句
import { ColumnInfo, ColumnType } from '../common/bean/ColumnInfo'
import RecordPO from '../common/bean/RecordPO'
import DbUtil from '../common/utils/DbUtil'
import { relationalStore } from '@kit.ArkData'

const CREATE_TABLE_SQL:string = `
CREATE TABLE IF NOT EXISTS record (
id INTEGER PRIMARY KEY AUTOINCREMENT,
typeId INTEGER NOT NULL,
itemId INTEGER NOT NULL,
amount DOUBLE NOT NULL,
createTime INTEGER NOT NULL
)
`
const TABLE_NAME = 'record'
const ID_COLUMN = 'id'
const DATE_COLUMN = 'createTime'
 const  COLUMNS:ColumnInfo[] = [
  {name:'id',columnName:'id',type:ColumnType.LONG},
  {name:'typeId',columnName:'typeId',type:ColumnType.LONG},
  {name:'itemId',columnName:'itemId',type:ColumnType.LONG},
  {name:'amount',columnName:'amount',type:ColumnType.DOUBLE},
  {name:'createTime',columnName:'createTime',type:ColumnType.LONG},

]

class RecordModel{
  getCreateTableSql():string{
    return CREATE_TABLE_SQL
  }

  async  insert(record:RecordPO){
    await DbUtil.insert(TABLE_NAME,record)
  }

 async  deleteById(id:number){
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo(ID_COLUMN,id)
 return await DbUtil.delete(predicates)
  }

 async  queryByDate(date:number){
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo(DATE_COLUMN,date)

    return await DbUtil.queryForList(predicates,COLUMNS)
  }

}

let recordModel = new RecordModel()

export default recordModel as RecordModel