import 'package:flutter/material.dart';
import 'package:testformulario/main.dart';
class PreStep extends Step{

  PreStep(BuildContext context,
      GlobalKey<FormState> formKey,
      PreInstalationEnum preInstValue,
      Function(PreInstalationEnum value) preUpdatePreInstCallback

      ) : super(
    title: Text("Pre-instalación"),
    isActive: true,
    state: StepState.editing,
    content: Form(
      key: formKey,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                "Pre-instalación",
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
                    Image.asset(
                      "img/rectangle2.png",
                      width: 100,
                      height: 100,
                    ),
                    Radio<PreInstalationEnum>(
                      value: PreInstalationEnum.cover,
                      groupValue: preInstValue,
                      onChanged: (PreInstalationEnum value) {
                        preUpdatePreInstCallback(value);
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "COBERTURA (INSTALACIÓN INTERIOR)",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio<PreInstalationEnum>(
                      value: PreInstalationEnum.counterCurrent,
                      groupValue: preInstValue,
                      onChanged: (PreInstalationEnum value) {
                        preUpdatePreInstCallback(value);
                      },
                    ),
                    Text("CONTRA CORRIENTE"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ) ,




  );

}