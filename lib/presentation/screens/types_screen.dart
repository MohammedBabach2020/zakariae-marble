import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zakariae_marbre/data/Models/type_.dart';
import 'package:zakariae_marbre/data/Repository/type_repo_interface.dart';
import 'package:zakariae_marbre/data/Repository/type_repository.dart';
import 'package:zakariae_marbre/presentation/widgets/button_widget.dart';
import 'package:zakariae_marbre/presentation/widgets/textfield_widget.dart';

class TypesScreen extends StatefulWidget {
  const TypesScreen({super.key});

  @override
  State<TypesScreen> createState() => _TypesScreenState();
}

class _TypesScreenState extends State<TypesScreen> {
  List<ArticleType> types = [];

  ITypeRepo typeRepo = TypeRepo(db: FirebaseFirestore.instance);

  void getTypes() async {
    types = await typeRepo.getTypes();
    setState(() {
      types = types;
    });
  }

  @override
  void initState() {
    super.initState();
    getTypes();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController typeController = TextEditingController();

    final ITypeRepo typeRepo = TypeRepo(db: FirebaseFirestore.instance);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextFieldWidget(
                        labelText: "New type",
                        hintText: "Type here ...",
                        hidden: false,
                        controller: typeController),
                  ),
                  Expanded(
                    flex: 1,
                    child: ButtonWidget(
                        buttonText: "+",
                        onPressed: () async {
                          typeRepo
                              .addType(ArticleType(type: typeController.text));
                          types = await typeRepo.getTypes();
                          setState(() {
                            types = types;
                          });
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: types.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        title: Text(
                          types[index].type!,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900),
                        ),
                        tileColor: Theme.of(context).colorScheme.primary,
                        trailing: PopupMenuButton(
                          iconColor: Theme.of(context).colorScheme.background,
                          onSelected: (value) => {
                            if (value == "Delete")
                              {typeRepo.deleteType(types[index].id), getTypes()}
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: "Delete",
                              child: Text("Delete"),
                            )
                          ],
                        )),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
