@Component
export default struct numberKeyBoard {
  numbers:string[] = ['1','2','3','4','5','6'
  ,'7','8','9','0','.']

  @Link amount:number
  @Link value:string
@Styles keyBoxStyles(){
  .backgroundColor(Color.White)
  .height(60).borderRadius(8)
}

  build() {
    Grid(){
      ForEach(this.numbers,(num:string) => {
        GridItem(){
          Text(num).fontSize(20).fontWeight(900)
        }.keyBoxStyles().onClick(()=>{
          this.clickNumber(num)
        })


      })
      GridItem(){
        Text('删除').fontSize(20).fontWeight(900)
      }.keyBoxStyles()
      .onClick(()=>{
        this.clickDelete()
      })
    }.backgroundColor('#f7f8fb')
    .width('100%').height(300)
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(8).rowsGap(8).padding(8)
    .margin({top:10})
  }
  clickNumber(number:string){
    //1.拼接用户输入的内容
    let val =  this.value + number
    //2.校验格式
    let firstIndex = val.indexOf('.')
    let lastIndex = val.lastIndexOf('.')
    if(firstIndex !== lastIndex||(lastIndex != -1 && lastIndex < val.length-2))
      return
    //3.将字符串转为数值
let amount = this.parseFloat(val)

//4.保存
    if(amount>=999.9){
      this.amount = 999.9
      this.value = '999.9'
    }
    else {
      this.amount = amount
      this.value = val
    }

  }
  clickDelete(){
    if(this.value.length<=0){
      this.amount = 0
      this.value = ''
      return
    }
    this.value = this.value.substring(0,this.value.length-1)
  this.amount = this.parseFloat(this.value)
  }
parseFloat(str:string){
    if(!str){
      return 0
    }
    if(str.endsWith('.')){
      str = str.substring(0,str.length - 1)
    }
    return parseFloat(str)
}

}