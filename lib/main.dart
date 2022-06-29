import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: BillSplitter(),));
}

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int tp=0,pc=1;
  double a=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIP CALCULATOR",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          fontStyle: FontStyle.italic,
          color: Colors.white
        ),),
        centerTitle: true,
        shadowColor: Colors.blue.shade800,
        backgroundColor: Colors.blue.shade400,


      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("Total Per Person",style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("\$${calculateTpp(calculatett(a, pc, tp), a, pc)}",style: TextStyle(
                              color: Colors.blue.shade500,
                              fontSize: 25,fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),


              ),

            ),
            Container(
              margin: EdgeInsets.only(top:20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount:",
                      prefixIcon: Icon(Icons.attach_money)
                    ),
                    onChanged: (String value){
                      try{
                        a=double.parse(value);
                      }catch(exception){
                        a=0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",style: TextStyle(
                        color: Colors.grey.shade800
                      ),),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(pc>1)pc--;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.blue.shade100
                              ),
                              child: Center(
                                child: Text(
                                  "-",style: TextStyle(
                                  color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                            ),
                          ),
                          Text("$pc",style: TextStyle(
                            color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 17
                          ),),
                          InkWell(
                            onTap: (){
                              setState(() {
                                pc++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.blue.shade100
                              ),
                              child: Center(
                                child: Text(
                                  "+",style: TextStyle(
                                    color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip",style: TextStyle(
                          color: Colors.grey.shade800),),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("\$${(calculatett(a,pc, tp)).toStringAsFixed(2)}",style: TextStyle(
                            color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold
                          ),),
                        ),

                        
                    ],
                  ),
                  Column(
                    children: [
                      Text("$tp%",style: TextStyle(
                        color: Colors.blue,fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),),
                      Slider(
                        min: 0,
                          max: 100,
                          activeColor: Colors.blue,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: tp.toDouble(),
                          onChanged: (double v){
                        setState(() {
                          tp=v.round();
                        });
                      })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTpp(double tt,double ba,int spp){
    var tpp=(tt+ba)/spp;
    return tpp.toStringAsFixed(2);

  }
  calculatett(double ba,int spp,int tpp){
    double tt=0.00;
    if(ba<0||ba.toString().isEmpty||ba==null){

    }
    else{tt=(ba*tpp)/100;

    }
    return tt;
  }
}

