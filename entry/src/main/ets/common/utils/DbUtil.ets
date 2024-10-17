import { common } from '@kit.AbilityKit'
import { relationalStore } from '@kit.ArkData'
import Logger from './Logger'
import { BusinessError } from '@kit.BasicServicesKit'
import RecordPO from '../bean/RecordPO'
import { ColumnInfo, ColumnType } from '../bean/ColumnInfo'

const DB_FILENAME:string = 'HeiMaHealthy.db'


class DbUtil{
  rdbStore:relationalStore.RdbStore|null = null
  initDB(context:common.UIAbilityContext){
    let config:relationalStore.StoreConfig = {
      name:DB_FILENAME,
      securityLevel:relationalStore.SecurityLevel.S1
    }
    return new Promise<void>((resolve,reject)=>{
      relationalStore.getRdbStore(context,config)
        .then(rdbStore => {
          this.rdbStore = rdbStore
         Logger.debug('rdbStore 初始化完成!')
          resolve()
        })
        .catch((reason:BusinessError) => {
          Logger.debug('rdbStore 初始化异常',JSON.stringify(reason))
          reject(reason)
        })

    })
  }
  createTable(createSQL:string){
    return new Promise<void>((resolve,reject) => {
      this.rdbStore?.executeSql(createSQL)
        .then(()=>{
          Logger.debug('创建表成功',createSQL)
          resolve()
        })
        .catch((err:BusinessError)=>{
          Logger.error('创建表失败',err.message,JSON.stringify(err))
          reject(err)
        })
    })
  }

    insert(tableName:string,obj:RecordPO){
    return new Promise<number>((resolve,reject) => {
      this.rdbStore?.insert(tableName,{typeId:obj.typeId,ItemId:obj.itemId
      ,amount:obj.amount,createTime:obj.createTime},(err,id)=>{
        if (err) {
          Logger.error('新增失败！',JSON.stringify(err))
          reject(err)
        }else{
          Logger.debug('新增成功！',id.toString())
          resolve(id)
        }
      })
    })

  }
  delete(predicates:relationalStore.RdbPredicates){
    return new Promise<number>((resolve,reject) => {
      this.rdbStore?.delete(predicates,(err,rows)=>{
        if (err) {
          Logger.error('新增失败！',JSON.stringify(err))
          reject(err)
        }else{
          Logger.debug('新增成功！,删除行数',rows.toString())
          resolve(rows)
        }
      })
    })
  }
    queryForList(predicates:relationalStore.RdbPredicates,columns:ColumnInfo[]){
      return new Promise<RecordPO[]>((resolve,reject) => {
        this.rdbStore?.query(predicates,(err,result)=>{
          if (err) {
            Logger.error('新增失败！',JSON.stringify(err))
            reject(err)
          }else{
            Logger.debug('新增成功！,删除行数',result.rowCount.toString())
            resolve(this.parseResultSet(result,columns))
          }
        })
      })
    }

    parseResultSet(result:relationalStore.ResultSet,columns:ColumnInfo[]){
    //1.声明最终返回结果
    let arr:RecordPO[] = []
    //2.判断是否有结果
      if(result.rowCount<=0)
    return arr
     //3.处理结果
      while (!result.isAtFirstRow){

        //3.1去下一行
        result.goToNextRow()
        let obj: RecordPO = new RecordPO(0,0,0,0,0)
        //3.2.解析这行数据，转为对象
        columns.forEach(info =>{
            let val:number = 0

          let vals:string = ''

          let valUint: Uint8Array
          switch (info.type){
              case ColumnType.LONG:
                val = result.getLong(result.getColumnIndex(info.columnName))
                 break
            case ColumnType.DOUBLE:
              val = result.getDouble(result.getColumnIndex(info.columnName))
              break
            case ColumnType.STRING:
              vals = result.getString(result.getColumnIndex(info.columnName))
              break
            case ColumnType.BLOB:
              valUint = result.getBlob(result.getColumnIndex(info.columnName))
              break
          }
          if(info.columnName == 'id'){
            obj.id = val
          }
            else if(info.columnName == 'typeId'){
              obj.typeId = val
          }
          else  if(info.columnName == 'itemId'){
              obj.itemId = val
          }
            else  if(info.columnName == 'amount'){
              obj.amount = val
          }
              else  if(info.columnName == 'createTime'){
           obj.createTime = val
          }

        })
        arr.push(obj)
      }
return arr
    }//封装一个函数解析ResultSet函数

}

let dbUtil:DbUtil = new DbUtil()

export default dbUtil as DbUtil