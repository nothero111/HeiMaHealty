import { mediaquery } from '@kit.ArkUI'
import BreakpointConstants from '../constants/BreakpointConstants'

export default class BreakpointSystem{
  //查询当前设备信息
  private smListener:mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_SM)
  private mdListener:mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_MD)
  private lgListener:mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_LG)


  updateCurrentBreakpoint(breakpoint:string){
      AppStorage.setOrCreate(BreakpointConstants.CURRENT_BREAKPOINT,breakpoint)
    //console.log('testTag','查询成功')
  }

  smListenerCallback(result:mediaquery.MediaQueryResult){
   console.log('testTag','查询成功')

    if(result.matches){
  this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_SM)
    }
  }
  mdListenerCallback(result:mediaquery.MediaQueryResult){
   // console.log('testTag','查询成功')

    if(result.matches){
      this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_MD)
    }
  }
  lgListenerCallback(result:mediaquery.MediaQueryResult){
   // console.log('testTag','查询成功')

    if(result.matches){
      this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_LG)
    }
  }
  register(){
this.smListener.on('change',(result)=>{this.smListenerCallback(result)
   // console.log('testTag','sm')
})
    this.mdListener.on('change',(result)=>this.mdListenerCallback(result))
    this.lgListener.on('change',(result)=>this.lgListenerCallback(result))

  }
  unregister(){
    this.smListener.off('change',(result)=>this.smListenerCallback(result))
    this.mdListener.off('change',(result)=>this.mdListenerCallback(result))
    this.lgListener.off('change',(result)=>this.lgListenerCallback(result))
    this.lgListener.off('change',(result)=>this.lgListenerCallback(result))

  }
}