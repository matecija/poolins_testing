import 'package:flutter/material.dart';
import 'package:testformulario/main.dart';
class CoverStep extends Step {

  CoverStep(BuildContext context,
      GlobalKey<FormState> formKey,

      Cover1Enum cover1value,
      Cover2Enum cover2value,
      Function(Cover1Enum cover1enum) coverUpdateCover1Callback,
      Function(Cover2Enum cover2enum) coverUpdateCover2Callback,

      ) : super(
    title: Text("Cobertura"),
    state: StepState.editing,
    isActive: true,
    content: Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                "Cobertura",
                style: TextStyle(fontSize: 20),
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent.withOpacity(0.4),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(
                  //width: MediaQuery.of(context).size.width * 0.4,
                  child: Text("LAMAS DE PVC"),
                ),


                Container(
                  //width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: GridView.count(
                    childAspectRatio: 7.5,
                    crossAxisCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.white,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover1Enum>(
                            value: Cover1Enum.white,
                            groupValue: cover1value,
                            onChanged: (Cover1Enum value) {
                              coverUpdateCover1Callback(value);
                            },
                          ),
                          Text("WHITE"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.amberAccent,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover1Enum>(
                            value: Cover1Enum.sand,
                            groupValue: cover1value,
                            onChanged: (Cover1Enum value) {
                              coverUpdateCover1Callback(value);
                            },
                          ),
                          Text("SAND"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.indigo,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover1Enum>(
                            value: Cover1Enum.blueSkay,
                            groupValue: cover1value,
                            onChanged: (Cover1Enum value) {
                              coverUpdateCover1Callback(value);
                            },
                          ),
                          Text("BLUE SKAY"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.white12,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover1Enum>(
                            value: Cover1Enum.darkGray,
                            groupValue: cover1value,
                            onChanged: (Cover1Enum value) {
                              coverUpdateCover1Callback(value);
                            },
                          ),
                          Text("DARK GRAY"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.black45,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover1Enum>(
                            value: Cover1Enum.gray,
                            groupValue: cover1value,
                            onChanged: (Cover1Enum value) {
                              coverUpdateCover1Callback(value);
                            },
                          ),
                          Text("GRAY"),
                        ],
                      ),
                    ],
                  ),
                ),


                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Text("LAMAS POLICARBONATO"),
                ),

                Container(
                  // width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: GridView.count(
                    childAspectRatio: 7.5,
                    crossAxisCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.indigo,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover2Enum>(
                            value: Cover2Enum.solarBlue,
                            groupValue: cover2value,
                            onChanged: (Cover2Enum value) {
                              coverUpdateCover2Callback(value);
                            },
                          ),
                          Text("SOLAR BLUE"),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.amberAccent,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover2Enum>(
                            value: Cover2Enum.solarBronze,
                            groupValue: cover2value,
                            onChanged: (Cover2Enum value) {
                              coverUpdateCover2Callback(value);
                            },
                          ),
                          Text("SOLAR BRONZE"),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.white,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover2Enum>(
                            value: Cover2Enum.cristal,
                            groupValue: cover2value,
                            onChanged: (Cover2Enum value) {
                              coverUpdateCover2Callback(value);
                            },
                          ),
                          Text("CRISTAL"),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.black45,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover2Enum>(
                            value: Cover2Enum.solarClear,
                            groupValue: cover2value,
                            onChanged: (Cover2Enum value) {
                              coverUpdateCover2Callback(value);
                            },
                          ),
                          Text("SOLAR SILVER"),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            child: ColoredBox(
                              color: Colors.grey,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          Radio<Cover2Enum>(
                            value: Cover2Enum.solarSilver,
                            groupValue: cover2value,
                            onChanged: (Cover2Enum value) {
                              coverUpdateCover2Callback(value);
                            },
                          ),
                          Text("SOLAR CLEAR"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),



  );

}