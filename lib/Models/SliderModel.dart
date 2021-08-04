class SliderModel{
  String imagePath ;
  String title ;
  String desc ;

  SliderModel({this.imagePath,this.title,this.desc});
  void setImageAssertPath(String getImagepath)
  {
    imagePath = getImagepath;
  }
  void setTitle(String getTitle)
  {
    title = getTitle;
  }
  void setDoc(String getDoc)
  {
    desc = getDoc;
  }
  String getImageAssertPath(){
    return imagePath;
  }
  String getTitle(){
    return title;
  }
  String getDosc(){
    return desc;
  }
}
List<SliderModel> getSliders(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();
  //1
  sliderModel.setImageAssertPath("assets/images/robot5.jpg");
  sliderModel.setTitle("R O B O T ");
  sliderModel.setDoc("Welcome to Hospital Robot ");
  slides.add(sliderModel);
  //2
  sliderModel = new SliderModel();
  sliderModel.setImageAssertPath("assets/images/robot7.jpg");
  sliderModel.setTitle("How can help you ?");
  sliderModel.setDoc("give my any taks to help you ");
  slides.add(sliderModel);
  //3
  sliderModel = new SliderModel();
  sliderModel.setImageAssertPath("assets/images/robot8.jpg");
  sliderModel.setTitle("Lets get start");
  sliderModel.setDoc("j3ndwked n3djk2e dnjd ojn1dejw2q n3jew 32jned");
  slides.add(sliderModel);

  return slides;
}