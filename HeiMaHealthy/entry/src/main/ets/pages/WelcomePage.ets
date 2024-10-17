import { router } from '@kit.ArkUI';
import noticeDialog from '../view/Welcome/userPrivacyDlialog'
import { common } from '@kit.AbilityKit';
import preference from '../Until/preference'


@Extend(Text) function OpacityWhiteText(Size:number,Opacity:number){
  .fontColor(Color.White)
  .opacity(Opacity).fontSize(Size)
}

@Entry
@Component
struct WelcomePage {

  context = getContext(this) as common.UIAbilityContext


  aboutToAppear(): void {

      preference.getPreference('userPrivacy',false)
        .then((value)=>{
          let isAgree = value as boolean

          if(isAgree == true){//先判断userPrivacy的值，为假则退出

            setTimeout(()=>{
              router.replaceUrl({
                url:'pages/Index'
              })
            },1000)//设置一个定时任务，模拟打开页面的额加载情况

          }else{
            this.dialogController.open()
          }
          console.log('testTag','获取有关用户隐私的首选项成功',`this.userPrivacy=${isAgree}`)
        }).catch(()=>{
          console.log('testTag','获取有关用户隐私的首选项失败')
      })



  }


confirm(){
    //同意用户协议

      preference.putPreferenceValue('userPrivacy',true)

  setTimeout(()=>{
    router.replaceUrl({
      url:'pages/Index'
    })
  },1000)//设置一个定时任务，模拟打开页面的额加载情况

}

exitApp(){
    //不同意用户协议
  this.context.terminateSelf()
}




  dialogController:CustomDialogController = new CustomDialogController({
    builder:noticeDialog({confirm:this.confirm,cancel:this.exitApp})
  })//定义对话框，传入两个本地函数处理交互事件
  build() {

      Column({space:10}){
        //黑马slogen显示
        Row(){
          Image($r('app.media.home_slogan')).width(260)
        }.layoutWeight(1)

        Image($r('app.media.home_logo')).width(150)

        Row(){//设置一行字体
          Text('黑马健康支持').OpacityWhiteText(12,0.8)
            .padding({right:5})

          Text('  IPV6  ')
            .border({style:BorderStyle.Solid,radius:10,width:1,color:Color.White})
            .OpacityWhiteText(10,1)

          Text('网络').padding({left:5,right:5}).OpacityWhiteText(12,0.8)


        }
        Text('\'减更多\'指的是黑马健康App希望通过软件工具的形式，帮助更多用户实现身材管理')
          .OpacityWhiteText(9,0.6)

        Text('浙ICP备0000000000号-36D')
          .OpacityWhiteText(9,0.6)

      }.width('100%').height('100%')




    .backgroundColor($r('app.color.welcome_back_ground'))
  }
}


//自定义一个弹窗
