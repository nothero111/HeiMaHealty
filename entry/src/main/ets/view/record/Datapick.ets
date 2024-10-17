@CustomDialog
export default struct dataPick {
  dataController:CustomDialogController
  selectData:Date = new Date()
  build() {
    Column({space:12}){
//日期选择器
DatePicker({
   start:new Date('2010-01-01'),
  end:new Date(),
  selected:this.selectData
}).onDateChange((date:Date)=>{
  this.selectData.setFullYear(date.getFullYear(),date.getMonth(),date.getDay())
})
      //按钮（yes or no）
  Row({space:12}){
  Button('取消').backgroundColor(Color.Gray)
    .width(120)
    .onClick(()=>{
      this.dataController.close()
    })
    Button('确定').backgroundColor('#11d479')
      .width(120)
      .onClick(()=>{
        //1.保存日期到全局存储，AppStorage
      AppStorage.setOrCreate('selectedDate',this.selectData.getTime())
        //这里不能直接存入date对象，
        //因为未来日期发生变化，监控不到，会有错误，用prop，link这些去监控会报错,
        //所以这里用getTime()类型，得到一个基础日期到该日期的毫秒数，就可以监控到日期变化

        // 2.关闭窗口
        this.dataController.close()
      })
  }
    }.padding(12)
  }
}