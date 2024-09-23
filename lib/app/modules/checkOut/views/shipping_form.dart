// Shipping Info Form Screen
import 'package:flutter/material.dart';

class ShippingInfoFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping Information"),
        backgroundColor: Colors.green,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: ShippingForm(),
      ),
    );
  }
}

// Widget for shipping form
class ShippingForm extends StatefulWidget {
  const ShippingForm({super.key});

  @override
  _ShippingFormState createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
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
              ),
              TextFormField(
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
              ),
              TextFormField(
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                  focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                  ),),
              ),
              TextFormField(
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(labelText: 'Address Line 1',
                  labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                  focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                  ),),
              ),
              TextFormField(
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(labelText: 'City',
                  labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                  focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                  ),),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      decoration: const InputDecoration(labelText: 'State',
                        labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                        focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 1.0)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                        ),),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      decoration: const InputDecoration(labelText: 'Zip Code',
                        labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                        focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 1.0)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:  Colors.black54 , width: 1.0),
                        ),),
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
}
