class map {
   var name ;
   var details;
   int step;
   int dist;
   int ImageName;

  map(this.name,this.details, this.step, this.dist, this.ImageName);
  int getSteps(String HollName) {
    int Steps = 0;
    if (name.contains(HollName)) {
      Steps =this.step;
    }
    return Steps;
  }
  int getdist(String HollName) {
    int Distance = 0;
    if (name.contains(HollName)) {
      Distance = this.dist;
    }
    return Distance;
  }
  int getImageName() {
  return this.ImageName;
  }
  bool CheckName(String HollName){
    if(name.contains(HollName))
      {
        return true;
      }
    return false;
  }
}

