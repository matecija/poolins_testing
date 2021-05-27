import 'package:flutter/material.dart';

class PedidoStep extends Step{

  BuildContext context;
  PedidoStep(this.context,
      GlobalKey<FormState> formKey,
      TextEditingController dateController,
      TextEditingController nameController,
      TextEditingController streetController,
      TextEditingController postalCodeController,
      TextEditingController provinceController,
      Function(String value) billsUpdateNameCallback,
      Function(String value) billsUpdateDateCallback,
      Function(String value) billsUpdatePostalCodeCallback,
      Function(String value) billsUpdateProvinceCallback,
      Function(String value) billsUpdateStreetCallback

      ) :
        super(
    title: Text("Hoja de pedidos"),
    state: StepState.editing,
    isActive: true,
    content: Form(
      key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                "Hoja de pedido",
                style: TextStyle(fontSize: 20),
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent.withOpacity(0.4),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: dateController,
                  onEditingComplete: () => billsUpdateDateCallback(dateController.text),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Fecha',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontFamily: 'AvenirLight'),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontFamily: 'AvenirLight'),
                  ),
                  onEditingComplete: () => billsUpdateNameCallback(nameController.text),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller:streetController ,
                onEditingComplete: () => billsUpdateStreetCallback(streetController.text),

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Calle',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontFamily: 'AvenirLight'),
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller:provinceController ,
                onEditingComplete : () => billsUpdateProvinceCallback(provinceController.text),

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Provincia',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontFamily: 'AvenirLight'),
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller:postalCodeController ,
                onEditingComplete: () => billsUpdatePostalCodeCallback(postalCodeController.text),

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Código postal',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontFamily: 'AvenirLight'),
                ),
              ),
            ),
          ], //HOJA PEDIDO COLUMN
        ),
    ) ,



  );

}