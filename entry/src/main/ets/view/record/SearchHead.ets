@Component
export default struct searchHeader {
  build() {
    Row(){
      Search({placeholder:'搜索饮食或运动信息'})
        .layoutWeight(1).textFont({size:18})
      Badge({count:1,position:BadgePosition.RightTop,style:{fontSize:12}}){
        Image($r('app.media.email')).width(25)
      }

    }.width('94%')
  }
}