declare interface breakpointOption<T>{
  sm?:T,
  md?:T,
  lg?:T
}



export default class breakpointType<T>{
  option:breakpointOption<T>
 Row:Record<string,T> = {
 }
  constructor(option:breakpointOption<T>) {
  this.option = option
  }
  getValue(breakpoint:string){
      if(breakpoint == 'sm')
        return this.option.sm
    else if(breakpoint == 'md')
      return this.option.md
    else return this.option.lg


  }
}