import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testformulario/services/formService.dart';
import 'package:testformulario/steps/coloresStep.dart';
import 'package:testformulario/steps/coverStep.dart';
import 'package:testformulario/steps/observationStep.dart';
import 'package:testformulario/steps/pedidoStep.dart';
import 'package:testformulario/steps/preStep.dart';
import 'package:testformulario/steps/sizeStep.dart';
import 'package:testformulario/steps/stairsStep.dart';
import 'package:testformulario/steps/tipoStep.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum ColorsEnum { blanco, azul, negrPlata, gris, blancoPlata }
enum PoolSizeEnum { size1, size2, size3, size4 }
enum StairsEnum { lateral, lateralPlaya, esquina, nada }
enum PreInstalationEnum { cover, counterCurrent }
enum Cover1Enum { white,sand,blueSkay,darkGray,gray}
enum Cover2Enum { solarBlue, solarBronze, cristal, solarSilver, solarClear}
enum OverflowingEnum { superior, lateral, rack, noRack}
enum SkimmerEnum { integrated, surface}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  ColorsEnum coloresValue ;
  PoolSizeEnum poolSizeValue ;
  StairsEnum stairsValue;
  PreInstalationEnum preInstValue;
  Cover1Enum cover1Value;
  Cover2Enum cover2Value;
  OverflowingEnum overflowingValue;
  SkimmerEnum skimmerValue;

  TextEditingController observationController = TextEditingController();
  TextEditingController dateController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController streetController= TextEditingController();
  TextEditingController postalCodeController= TextEditingController();
  TextEditingController provinceController= TextEditingController();


  bool isScrollable = true;

  ValueNotifier<bool> physicsValue ;

  //ValueNotifier<bool> isScrollable = ValueNotifier<bool>(true);

  final FirestoreService _firestore = FirestoreService();


  @override
  void initState() {
    super.initState();
  }
  Offset o_line = Offset(10, 40);
  Offset o_rectangulo = Offset(10, 80);
  Offset o_cruz = Offset(10, 100);
  Offset o_circulo = Offset(10, 150);

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != 9
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() {
      currentStep = step;
      if(currentStep == 1){
        isScrollable =false;
      }else{
        isScrollable =true;
      }
    });
  }

  var fieldContainerKey;
  @override
  Widget build(BuildContext context) {
    physicsValue = ValueNotifier(true);
    return Scaffold(

      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.95,
            width: MediaQuery.of(context).size.width,
            child:Form(
              key: _formKey,
              child:Stepper(
                type: StepperType.vertical,
                physics: isScrollable
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),

                onStepTapped: (step) => goTo(step),
                currentStep: currentStep,

                //If null, the button will appear as disabled.
                onStepContinue: currentStep == 9 ? null : next,
                onStepCancel: currentStep == 0 ? null : cancel,
                steps: [
                  PedidoStep(context, dateController,nameController,streetController,postalCodeController,provinceController,
                      billsUpdateNameCallback,billsUpdateDateCallback,billsUpdatePostalCodeCallback,
                  billsUpdateProvinceCallback, billsUpdateStreetCallback),

                  Step(
                    title: Text("Croquis"),
                    isActive: true,
                    state: StepState.editing,
                    content:
                    StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          //  height: MediaQuery.of(context).size.height * 0.4,
                          //: MediaQuery.of(context).size.width * 0.9,
                            margin: EdgeInsets.all(5),

                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 20, top: 20, right: 10),
                                  child: Text(
                                    "Croquis",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.blueAccent.withOpacity(0.4),
                                ),
                                Stack(
                                  overflow: Overflow.visible,
                                  children: [

                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.3,
                                      width: MediaQuery.of(context).size.width * 0.73,
                                      key: fieldContainerKey,
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.only(top: 80,right: 20),
                                      child: Container(
                                        width: 200,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            )),
                                      ),
                                    ),
                                    Positioned(
                                      left: o_cruz.dx,
                                      top: o_cruz.dy,
                                      child: GestureDetector(
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          child: Icon(
                                            Icons.clear,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                        ),
                                        onPanUpdate: (details) {
                                          if(checkArea(fieldContainerKey.currentContext, o_cruz)){
                                            setState(() {
                                              o_cruz = Offset(o_cruz.dx + details.delta.dx,
                                                  o_cruz.dy + details.delta.dy);
                                            });
                                          }else{
                                            o_cruz = Offset(10, 80);
                                          }
                                        },
                                      ),
                                    ),

                                    Positioned(
                                      left: o_line.dx,
                                      top: o_line.dy,
                                      child: GestureDetector(
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.red,
                                            size: 60,
                                          ),
                                        ),
                                        onPanUpdate: (details) {
                                          if(checkArea(fieldContainerKey.currentContext, o_line)){
                                            setState(() {
                                              o_line = Offset(o_line.dx + details.delta.dx,
                                                  o_line.dy + details.delta.dy);
                                            });
                                          }else{
                                            o_line = Offset(10, 20);
                                          }
                                        },

                                      ),
                                    ),

                                    Positioned(
                                      left: o_rectangulo.dx,
                                      top: o_rectangulo.dy,
                                      child: GestureDetector(
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          child: Icon(
                                            Icons.stay_current_landscape_sharp,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                        ),
                                        onPanUpdate: (details) {
                                          if(checkArea(fieldContainerKey.currentContext, o_rectangulo)){
                                            setState(() {
                                              o_rectangulo = Offset(o_rectangulo.dx + details.delta.dx,
                                                  o_rectangulo.dy + details.delta.dy);
                                            });
                                          }else{
                                            o_rectangulo = Offset(10, 40);
                                          }
                                        },

                                      ),
                                    ),
                                    Positioned(
                                      left: o_circulo.dx,
                                      top: o_circulo.dy,
                                      child: GestureDetector(
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          child: Image.asset("img/circle.png",
                                            color: Colors.red,
                                          ),

                                        ),
                                        onPanUpdate: (details) {
                                          if(checkArea(fieldContainerKey.currentContext, o_circulo)){
                                            setState(() {
                                              o_circulo = Offset(o_circulo.dx + details.delta.dx,
                                                  o_circulo.dy + details.delta.dy);
                                            });
                                          }else{
                                            o_circulo = Offset(10, 100);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      },
                    ),


                  ),

                  TipoStep(context,overflowingValue,skimmerValue,
                      tipoUpdateOverflowingCallback,tipoUpdateSkimmerCallback),

                  ColoresStep(context,coloresValue,coloresUpdateColorCallback),

                  SizeStep(context,poolSizeValue,sizeUpdateSizeCallback),

                  StairsStep(context,stairsValue,stairsUpdateStairsCallback),

                  PreStep(context,preInstValue,preUpdatePreInstCallback),

                  CoverStep(context,cover1Value,cover2Value,
                      coverUpdateCover1Callback,coverUpdateCover2Callback),

                  ObservationStep(context,observationController),
                ],
              ),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            child:FlatButton(
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Text("Submit"),
              onPressed: () {
                if(_formKey.currentState.validate() && (
                coloresValue != null && preInstValue != null &&
                    stairsValue != null && cover1Value != null &&
                    cover2Value != null && poolSizeValue != null &&
                    overflowingValue != null && skimmerValue != null
                )){
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Success')));

                      _firestore.saveBills(
                          name: nameController.text,
                        colors: coloresValue.index,
                        overflowing: overflowingValue.index,
                        preInstalation: preInstValue.index,
                        size: poolSizeValue.index,
                        skimmer: skimmerValue.index,
                        stairs: stairsValue.index,
                        coverPolicarbonate: cover2Value.index,
                        coverPVC: cover1Value.index,
                        observations: observationController.text,
                        date: Timestamp.now(),
                        postalCode: int.parse(postalCodeController.text),
                        province: provinceController.text,
                        street: streetController.text,
                      );
                }else{
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Errors in form')));
                }
              }
            ),
          )
        ],
      )

    );
  }

  bool checkArea(BuildContext context, Offset offsetChild){
    if(context.size.contains(offsetChild))
      return true;

    return false;
  }

  coverUpdateCover1Callback(Cover1Enum cover1enum){
    setState(() {
      cover1Value = cover1enum;
    });
  }

  coverUpdateCover2Callback(Cover2Enum cover2enum){
    setState(() {
      cover2Value = cover2enum;
    });
  }

  tipoUpdateOverflowingCallback(OverflowingEnum value){
    setState(() {
      overflowingValue = value;
    });
  }

  tipoUpdateSkimmerCallback(SkimmerEnum value){
    setState(() {
      skimmerValue = value;
    });
  }

  coloresUpdateColorCallback(ColorsEnum value){
    setState(() {
      coloresValue = value;
    });
  }
  sizeUpdateSizeCallback(PoolSizeEnum value){
    setState(() {
      poolSizeValue = value;
    });
  }
  stairsUpdateStairsCallback(StairsEnum value){
    setState(() {
      stairsValue = value;
    });
  }
  preUpdatePreInstCallback(PreInstalationEnum value){
    setState(() {
      preInstValue = value;
    });
  }

  billsUpdateNameCallback(String value){
    setState(() {
      nameController.text = value;
    });
  }
  billsUpdateDateCallback(String value){
    setState(() {
      dateController.text = value;
    });
  }

  billsUpdateStreetCallback(String value){
    setState(() {
      streetController.text = value;
    });
  }
  billsUpdateProvinceCallback(String value){
    setState(() {
      provinceController.text = value;
    });
  }
  billsUpdatePostalCodeCallback(String value){
    setState(() {
      postalCodeController.text = value;
    });
  }

}
