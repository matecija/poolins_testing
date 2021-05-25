import 'package:flutter/material.dart';

class ObservationStep extends Step {

  ObservationStep(BuildContext context,
      TextEditingController observationController

      ):super(
    title: Text("Observaciones"),
    state: StepState.editing,
    isActive: true,
    content: Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              "Observaciones",
              style: TextStyle(fontSize: 20),
            ),
            width: MediaQuery.of(context).size.width,
            color: Colors.blueAccent.withOpacity(0.4),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: observationController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
          ),
          Text(
              "*En las piscinas desbordantes los impulsores se colocarán en el mismo paramento que los focos de led."),
        ],
      ),
    ),
  );

}