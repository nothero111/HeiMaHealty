import { window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import recordIndex from '../view/record/recordIndex'
import BreakpointSystem from '../common/utils/BreakpointSystem';
import BreakpointConstants from '../common/constants/BreakpointConstants';
import breakpointType from '../common/bean/BreakpointType';

class barPosition{
     sm:BarPosition
    md:BarPosition
  lg:BarPosition

  constructor(sm:BarPosition,md:BarPosition,lg:BarPosition) {
       this.sm = sm
    this.md = md
    this.lg = lg
  }
}

@Entry
@Component
struct Index {
   bar: barPosition = new barPosition(BarPosition.Start,BarPosition.End,BarPosition.End)
  context = getContext(this) as common.UIAbilityContext
  //预览器效果显示
  windowClass?: window.Window

  async setFullScreen(flag: boolean) {
    if (!this.windowClass) {
      this.windowClass = await window.getLastWindow(getContext(this))
    }
    this.windowClass.setWindowLayoutFullScreen(flag)
  }

  onPageShow(): void {
    this.setFullScreen(true)
  }

  onPageHide(): void {
    this.setFullScreen(false)
  }////

  @StorageProp('currentBreakpoint') currentBreakpoint:string = BreakpointConstants.BREAKPOINT_SM

  chooseBarPosition(){
    if(this.currentBreakpoint=='sm')
      return BarPosition.End
    else if(this.currentBreakpoint=='md')
      return BarPosition.Start
    else
      return BarPosition.Start
  }


private breakpointSystem:BreakpointSystem = new BreakpointSystem()
  aboutToAppear(): void {
  this.breakpointSystem.register()


  }
aboutToDisappear(): void {
    this.breakpointSystem.unregister()
}




//构建一个组件，用来控制tabBar样式
@Builder tabBarBuilder(image:string,text:string,index:number){
    Column(){
      Image($r(image)).width(25)
        .fillColor(this.currentIndex===index?'#5bbfdc':Color.Gray)
      Text(text).width(40).fontColor(this.currentIndex===index?'#5bbfdc':Color.Gray)
        .margin({left:5})
    }.alignItems(HorizontalAlign.Center).width(50)

}
@State currentIndex:number = 0

  build() {
    Tabs({barPosition: new breakpointType({
      sm:BarPosition.End,
      md:BarPosition.Start,
      lg:BarPosition.Start,
    }).getValue(this.currentBreakpoint)}) {
      TabContent(){
        Column(){
          //顶部搜索栏
          recordIndex()
          //统计信息

        }
      }
        .tabBar(this.tabBarBuilder('app.media.home','记录',0))
      TabContent(){
        Text('发现页面')
      }.tabBar(this.tabBarBuilder('app.media.find','发现',1))
      TabContent(){
        Text('我的页面')
      }.tabBar(this.tabBarBuilder('app.media.mine','我的',2))

    }.onChange((idx)=>{
      this.currentIndex = idx
      console.log('testTag',this.currentIndex)
    })
    .height('100%')
    .width('100%')
    .vertical(new breakpointType({
      sm:false,
      md:true,
      lg:true,
    }).getValue(this.currentBreakpoint))
  }
}