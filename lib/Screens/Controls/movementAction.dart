import 'package:flutter/material.dart';
import './controlSliders_widgit.dart';
class MovementAction extends StatefulWidget {

  static final  routName = '/MovementAction' ;
  final List<double>  minList ;
  final List<double> maxList;
  final int numOfLimits;
  MovementAction({this.minList,this.maxList,this.numOfLimits});
  @override
  _MovementActionState createState() => _MovementActionState();
}

class _MovementActionState extends State<MovementAction> {
  @override
  final movControll = TextEditingController();
  static List<TextEditingController> ValControll = List.generate(10, (i) => TextEditingController()) ;
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Monvment configuration",style: TextStyle(color: Colors.white),)),
      body: SingleChildScrollView (
      child:
      Container(
        margin: EdgeInsets.all(18),
        child:
          Container(
            child: Column(
                children: <Widget>[
                  Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                          Container(
                            width: 250,
                            child: TextField(
                              decoration: InputDecoration(labelText:"movement name"),
                            
                              controller: movControll,
                            ),),
                        ],),),
                  ListView .builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx,index){
                      return SliderWidget(
                        max: widget.maxList[index],
                        min: widget.minList[index],
                        tec:ValControll[index],);
                        },
                    itemCount: widget.numOfLimits,
                  ) ,
                  Container(
                color: Colors.white,
                width: double.infinity,
                child:FlatButton(
                  onPressed: (){},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  child: Text("Add Action",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ),
              ),
                ]
            ),
          )
      ),
      ),
    );
  }
}