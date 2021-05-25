import 'package:flutter/material.dart';

import '../main.dart';

class ColoresStep extends Step {

  ColoresStep(BuildContext context, ColorsEnum coloresValue,
      Function(ColorsEnum value) coloresUpdateColorCallback
      ) : super(
    isActive: true,
    state: StepState.editing,
    title: Text("Colores estandar"),
    content: GridView.count(
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
            Radio<ColorsEnum>(
              value: ColorsEnum.blanco,
              groupValue: coloresValue,
              onChanged: (ColorsEnum value) {
                coloresUpdateColorCallback(value);

              },
            ),
            Text("Blanco"),
          ],
        ),
        Row(
          children: [
            Container(
              child: ColoredBox(
                color: Colors.blue,
              ),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),
            Radio<ColorsEnum>(
              value: ColorsEnum.azul,
              groupValue: coloresValue,
              onChanged: (ColorsEnum value) {
                coloresUpdateColorCallback(value);

              },
            ),
            Text("Azul"),
          ],
        ),
        Row(
          children: [
            Container(
              child: ColoredBox(
                color: Colors.black,
              ),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),
            Radio<ColorsEnum>(
              value: ColorsEnum.negrPlata,
              groupValue: coloresValue,
              onChanged: (ColorsEnum value) {
                coloresUpdateColorCallback(value);

              },
            ),
            Text("Negro + Plata"),
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
            Radio<ColorsEnum>(
              value: ColorsEnum.gris,
              groupValue: coloresValue,
              onChanged: (ColorsEnum value) {
                coloresUpdateColorCallback(value);

              },
            ),
            Text("Gris"),
          ],
        ),
        Row(
          children: [
            Container(
              child: ColoredBox(
                color: Colors.black12,
              ),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),
            Radio<ColorsEnum>(
              value: ColorsEnum.blancoPlata,
              groupValue: coloresValue,
              onChanged: (ColorsEnum value) {
                coloresUpdateColorCallback(value);

              },
            ),
            Text("Blanco + Plata"),
          ],
        ),
      ],
    ),
  );


}