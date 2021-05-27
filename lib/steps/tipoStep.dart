import 'package:flutter/material.dart';

import '../main.dart';

class TipoStep extends Step{
  OverflowingEnum overflowingValue;
  SkimmerEnum skimmerValue;

  BuildContext context;
  TipoStep(
      this.context ,
      GlobalKey<FormState> formKey,
      this.overflowingValue,
      this.skimmerValue,
      Function(OverflowingEnum value) tipoUpdateOverflowingCallback,
      Function(SkimmerEnum value) tipoUpdateSkimmerCallback,

      ) :
        super(title: Text("Tipo"), state: StepState.editing, isActive: true,
    content: Form(
      key: formKey,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                "Tipo",
                style: TextStyle(fontSize: 20),
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent.withOpacity(0.4),
            ),
            //Container Desbordante
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Desbordante",
                      style: TextStyle(fontSize: 20),
                    ),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueAccent.withOpacity(0.4),
                  ),
                  GridView.count(
                    childAspectRatio: 7 / 2,
                    crossAxisCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [

                      Row(
                        children: [
                          Image.asset("img/rectangle2.png"),
                          Radio<OverflowingEnum>(
                            value: OverflowingEnum.superior,
                            groupValue: overflowingValue,
                            onChanged: (OverflowingEnum value) {
                              tipoUpdateOverflowingCallback(value);
                            },
                          ),
                          Text("Superior"),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("img/rectangle2.png"),
                          Radio<OverflowingEnum>(
                            value: OverflowingEnum.lateral,
                            groupValue: overflowingValue,
                            onChanged: (OverflowingEnum value) {
                              tipoUpdateOverflowingCallback(value);
                            },
                          ),
                          Text("Lateral"),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("img/rectangle2.png"),
                          Radio<OverflowingEnum>(
                            value: OverflowingEnum.rack,
                            groupValue: overflowingValue,
                            onChanged: (OverflowingEnum value) {
                              tipoUpdateOverflowingCallback(value);
                            },
                          ),
                          Text("Con rejilla"),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("img/rectangle2.png"),
                          Radio<OverflowingEnum>(
                            value: OverflowingEnum.noRack,
                            groupValue: overflowingValue,
                            onChanged: (OverflowingEnum value) {
                              tipoUpdateOverflowingCallback(value);
                            },
                          ),
                          Text("Sin rejilla"),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Skimmer",
                      style: TextStyle(fontSize: 20),
                    ),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueAccent.withOpacity(0.4),
                  ),
                  GridView.count(
                    childAspectRatio: 7 / 2,
                    crossAxisCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [

                      Row(
                        children: [
                          Image.asset("img/rectangle2.png"),

                          Radio<SkimmerEnum>(
                            value: SkimmerEnum.integrated,
                            groupValue: skimmerValue,
                            onChanged: (SkimmerEnum value) {
                              tipoUpdateSkimmerCallback(value);
                            },
                          ),
                          Text("Integrado"),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("img/rectangle2.png"),

                          Radio<SkimmerEnum>(
                            value: SkimmerEnum.surface,
                            groupValue: skimmerValue,
                            onChanged: (SkimmerEnum value) {
                              tipoUpdateSkimmerCallback(value);
                            },
                          ),
                          Text("De superficie"),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ), // CONTAINER DESBORDANTE
          ],
        ),
      ),
    )


  );

}