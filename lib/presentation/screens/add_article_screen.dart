import 'package:flutter/material.dart';
import 'package:zakariae_marbre/presentation/widgets/button_widget.dart';
import 'package:zakariae_marbre/presentation/widgets/textfield_widget.dart';

class AddArticleScreen extends StatelessWidget {
  const AddArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController sizeController = TextEditingController(),
        nameController = TextEditingController(),
        buyingPriceController = TextEditingController(),
        sellingPriceController = TextEditingController(),
        descController = TextEditingController(),
        quantityController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Add new marble piece",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),
              ),
              TextFieldWidget(
                  controller: nameController,
                  labelText: "Name",
                  hintText: "Type here ...",
                  hidden: false),
              const SizedBox(
                height: 35.0,
              ),
              TextFieldWidget(
                  controller: sizeController,
                  labelText: "Size",
                  hintText: "Type here ...",
                  hidden: false),
              const SizedBox(
                height: 35.0,
              ),
              TextFieldWidget(
                  controller: quantityController,
                  labelText: "Quantity",
                  hintText: "Type here ...",
                  hidden: false),
              const SizedBox(
                height: 35.0,
              ),
              TextFieldWidget(
                  controller: buyingPriceController,
                  labelText: "Buying price",
                  hintText: "Type here ...",
                  hidden: false),
              const SizedBox(
                height: 35.0,
              ),
              TextFieldWidget(
                  controller: sellingPriceController,
                  labelText: "Selling price",
                  hintText: "Type here ...",
                  hidden: false),
              const SizedBox(
                height: 35.0,
              ),
              TextFieldWidget(
                  controller: descController,
                  labelText: "Description",
                  hintText: "Type here ...",
                  hidden: false),
              const SizedBox(
                height: 35.0,
              ),
              ButtonWidget(buttonText: "Add ", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
