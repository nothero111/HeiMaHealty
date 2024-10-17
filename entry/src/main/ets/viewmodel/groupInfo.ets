

export default class groupInfo<TYPE,ELEMENT>{
  type:TYPE

  items:ELEMENT[]


  calories: number = 0
  constructor(type: TYPE, items: ELEMENT[]) {
  this.type = type
    this.items = items
  }
}