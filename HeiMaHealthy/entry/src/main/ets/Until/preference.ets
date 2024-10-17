import preferences from '@ohos.data.preferences'
import { common } from '@kit.AbilityKit'

class preferenceUtil{
  pref: preferences.Preferences|null = null
async  loadPreference(context:common.UIAbilityContext,name:string){
  try {
    this.pref = await preferences.getPreferences(context, name) //name是实例名称
    console.log('testTag',`加载Preferences[${name}]成功`)
  } catch (e) {
    console.log('testTag',`加载Preferences[${name}]失败`, JSON.stringify(e))
  }
  }

 async putPreferenceValue(key:string,value:preferences.ValueType){
          if(!this.pref){
            console.log(
            'testTag','preference尚未初始化')
            return
          }
   try {
     await this.pref.put(key, value)
     await this.pref.flush()
     console.log('testTag','保存preference成功',`${value}`)
   } catch (e) {
            console.log('testTag','保存preference失败',JSON.stringify(e))
   }
  }
async getPreference(key:string,defaultValue:preferences.ValueType){
    if(!this.pref){
      console.log(
        'testTag','preference尚未初始化')
      return
    }
  try {
    let value = await this.pref.get(key, defaultValue)
    console.log('testTag', `读取preference${key}成功`)
    return value
  } catch (e) {
    console.log('testTag','读取preference失败',JSON.stringify(e))
    return
  }

}
}


const preference: preferenceUtil = new preferenceUtil()
export default preference