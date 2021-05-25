import 'package:flutter/material.dart';

import '../main.dart';

class StairsStep extends Step{

  BuildContext context;

  StairsStep(BuildContext context, StairsEnum stairsValue,
      Function(StairsEnum value) stairsUpdateStairsCallback,

      ): super(
    title: Text("Escalera"),
    isActive: true,
    state: StepState.editing,
    content: Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              "Escalera",
              style: TextStyle(fontSize: 20),
            ),
            width: MediaQuery.of(context).size.width,
            color: Colors.blueAccent.withOpacity(0.4),
          ),
          //Container Desbordante
          GridView.count(
            childAspectRatio: 7 / 2,
            crossAxisCount: 1,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Image.asset("img/rectangle2.png"),
                  Radio<StairsEnum>(
                    value: StairsEnum.esquina,
                    groupValue: stairsValue,
                    onChanged: (StairsEnum value) {
                      stairsUpdateStairsCallback(value);
                    },
                  ),
                  Text("ESQUINA"),
                ],
              ),
              Row(
                children: [
                  Image.asset("img/rectangle2.png"),
                  Radio<StairsEnum>(
                    value: StairsEnum.lateralPlaya,
                    groupValue: stairsValue,
                    onChanged: (StairsEnum value) {
                      stairsUpdateStairsCallback(value);
                    },
                  ),
                  Text("LATERAL + PLAYA"),
                ],
              ),
              Row(
                children: [
                  Image.asset("img/rectangle2.png"),
                  Radio<StairsEnum>(
                    value: StairsEnum.lateral,
                    groupValue: stairsValue,
                    onChanged: (StairsEnum value) {
                      stairsUpdateStairsCallback(value);
                    },
                  ),
                  Text("LATERAL"),
                ],
              ),
              Row(
                children: [
                  Radio<StairsEnum>(
                    value: StairsEnum.nada,
                    groupValue: stairsValue,
                    onChanged: (StairsEnum value) {
                      stairsUpdateStairsCallback(value);
                    },
                  ),
                  Text("SIN ESCALERA NI PLAYA"),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );

}