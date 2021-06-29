
import 'package:flutter/material.dart';


/// This is the stateful widget that the main application instantiates.
class SliderWidget extends StatefulWidget {
  
  final double min ; 
  final double max ; 
  final TextEditingController tec;
  SliderWidget({this.max,this.min , this.tec});
  static String routeName = "/slider";
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 0;
 // TextEditingController minValControl =new TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.17,
      width: MediaQuery.of(context).size.width,
      child: 
      
      Column(
       children:<Widget>[ 
       /* Row(
          children :<Widget>[ 
           Container(
               padding: const EdgeInsets.all(2.0),
               height: MediaQuery.of(context).size.height*0.08,
               width: MediaQuery.of(context).size.width,
               child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row (children: [
                          Container( child:Image.asset("assets/images/pngegg.png")),
                          Text(" "+(1).toString()), ]),
            
                           ),),*/
            
        Row(
          children :<Widget>[ 
            Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width*0.5,
              child: TextField(
                     decoration: InputDecoration(labelText:" value"),
                     keyboardType: TextInputType.number,
                     controller: widget.tec,
                     onChanged:(val){ setState(() { _currentSliderValue=double.parse(val);}); } , ),
            ),
              ],),
        Container(
          padding: EdgeInsets.only(left: 10 , top: 5),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children :<Widget>[ 
              Text("min : "+widget.min.toString()+"  "),
              Text("max : "+widget.max.toString()+"  "),
              ]),
        ),
        Slider(
            value: _currentSliderValue,
            min: widget.min,
            max: widget.max,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                widget.tec.text = value.toString();
                _currentSliderValue=value;
              });
            },
            ),
            ]
      ),
      
    );
  }
}
