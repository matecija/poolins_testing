import 'package:flutter/material.dart';

import '../main.dart';

class SizeStep extends Step{
  PoolSizeEnum poolSizeValue;

  SizeStep(BuildContext context,
      GlobalKey<FormState> formKey,
      PoolSizeEnum poolSizeValue,
      Function(PoolSizeEnum value) sizeUpdateSizeCallback

      )
  : super(
      title: Text("Tamaño"),
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
                "Tamaño",
                style: TextStyle(fontSize: 20),
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent.withOpacity(0.4),
            ),
            GridView.count(
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [

                Align(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'img/rectangle.png',
                          height: 140,
                          width: 80,
                        ),
                        Text("3,7 x 9,8 x 1,4 m."),
                        Radio<PoolSizeEnum>(
                          value: PoolSizeEnum.size1,
                          groupValue: poolSizeValue,
                          onChanged: (PoolSizeEnum value) {
                            sizeUpdateSizeCallback(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'img/rectangle.png',
                          height: 110,
                          width: 80,
                        ),
                        Text("3,7 x 8,0 x 1,4 m."),
                        Radio<PoolSizeEnum>(
                          value: PoolSizeEnum.size2,
                          groupValue: poolSizeValue,
                          onChanged: (PoolSizeEnum value) {
                            sizeUpdateSizeCallback(value);

                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'img/rectangle.png',
                          height: 90,
                          width: 80,
                        ),
                        Text("3,0 x 6,0 x 1,4 m. m."),
                        Radio<PoolSizeEnum>(
                          value: PoolSizeEnum.size3,
                          groupValue: poolSizeValue,
                          onChanged: (PoolSizeEnum value) {
                            sizeUpdateSizeCallback(value);

                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'img/rectangle.png',
                          height: 80,
                          width: 80,
                        ),
                        Text("2,0 x 4,0 x 1,0 m."),
                        Radio<PoolSizeEnum>(
                          value: PoolSizeEnum.size4,
                          groupValue: poolSizeValue,
                          onChanged: (PoolSizeEnum value) {
                            sizeUpdateSizeCallback(value);

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ) ,


  );

}