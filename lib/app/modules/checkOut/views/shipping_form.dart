// Shipping Info Form Screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';

// Widget for shipping form
class ShippingForm extends StatefulWidget {
  const ShippingForm({super.key});

  @override
  _ShippingFormState createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {


  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CheckoutController());
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: controller.formKey,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.nameController,
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  labelStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.green, width: 1.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black54, width: 1.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide Your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.phoneNumberController,
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.green, width: 1.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide a valid phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.addressLine1Controller,
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(labelText: 'Address Line 1',
                  labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                  focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                  ),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide a valid Address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.areaController,
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(labelText: 'Area',
                  labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                  focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                  ),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide a Area name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.cityController,
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(labelText: 'City',
                  labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                  focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                  ),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide a city name';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.stateController,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      decoration: const InputDecoration(labelText: 'State',
                        labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                        focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 1.0)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                        ),),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provide a state name';
                        }
                        return null;
                      },
                    ),
                  ),
                  // const SizedBox(width: 20),
                  // Expanded(
                  //   child: TextFormField(
                  //     style: const TextStyle(fontWeight: FontWeight.normal),
                  //     decoration: const InputDecoration(labelText: 'Zip Code',
                  //       labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                  //       focusedBorder:  UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.green, width: 1.0)),
                  //       enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                  //       ),),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
