import 'package:flutter/material.dart';
import 'package:flutter_todolist_app_habiskerja/model/todo_item.dart';
import 'package:flutter_todolist_app_habiskerja/utils/network_manager.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambahkan todo list"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(hintText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tidak boleh kosong ya';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descController,
                decoration: const InputDecoration(hintText: "description"),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tidak boleh kosong ya';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final item = TodoItem(
                    title: titleController.text,
                    description: descController.text,
                    isDone: false,
                  );

                  if (item.title.isNotEmpty && item.description.isNotEmpty) {
                    await NetworkManager().postData(item);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Simpan"),
              ),
              TextFormField(
                initialValue: 'admin@gmail.com',
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Enter your email address',
                ),
                onChanged: (value) {},
              ),
              TextFormField(
                initialValue: '123456',
                maxLength: 20,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.password,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Enter your password',
                ),
                onChanged: (value) {},
              ),
              TextFormField(
                initialValue: '24',
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Enter your email address',
                ),
                onChanged: (value) {},
              ),
              InkWell(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  print("pickedDate: $pickedDate");
                },
                child: TextFormField(
                  initialValue: '2022-08-01',
                  maxLength: 20,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Birth date',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    suffixIcon: Icon(Icons.date_range),
                    helperText: "What's your name?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              InkWell(
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child ?? Container(),
                      );
                    },
                  );
                  print("pickedTime: $pickedTime");
                },
                child: TextFormField(
                  initialValue: '08:23',
                  maxLength: 20,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Working hour',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    suffixIcon: Icon(Icons.timer),
                    helperText: "What's your name?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              TextFormField(
                initialValue: 'Jln. Sukangoding No. 45',
                maxLength: 200,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "What's your address",
                ),
                onChanged: (value) {},
              ),
              LayoutBuilder(builder: (context, constraint) {
                String groupValue = "gender";
                List items = [
                  {
                    "label": "Female",
                    "value": "female",
                    "checked": true,
                  },
                  {
                    "label": "Male",
                    "value": "Male",
                  }
                ];
                return FormField(
                  initialValue: false,
                  enabled: true,
                  builder: (FormFieldState<bool> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        errorText: field.errorText,
                        border: InputBorder.none,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          var item = items[index];

                          return RadioListTile<dynamic>(
                            title: Text("${item["label"]}"),
                            groupValue: true,
                            value: item["checked"] ?? false,
                            onChanged: (val) {
                              field.didChange(true);
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              }),
              LayoutBuilder(builder: (context, constraint) {
                List items = [
                  {
                    "label": "Flutter",
                    "value": "Flutter",
                  },
                  {
                    "label": "Java",
                    "value": "Java",
                    "checked": true,
                  },
                  {
                    "label": "C#",
                    "value": "C#",
                  }
                ];
                return FormField(
                  initialValue: false,
                  enabled: true,
                  builder: (FormFieldState<bool> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        errorText: field.errorText,
                        border: InputBorder.none,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          var item = items[index];

                          return CheckboxListTile(
                            title: Text("${item["label"]}"),
                            value: item["checked"] ?? false,
                            onChanged: (value) {
                              field.didChange(true);
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              }),
              LayoutBuilder(builder: (context, constraint) {
                List items = [
                  {
                    "label": "Flutter",
                    "value": "Flutter",
                  },
                  {
                    "label": "Java",
                    "value": "Java",
                    "checked": true,
                  },
                  {
                    "label": "C#",
                    "value": "C#",
                  }
                ];
                return FormField(
                  initialValue: false,
                  enabled: true,
                  builder: (FormFieldState<bool> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        errorText: field.errorText,
                        border: InputBorder.none,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          var item = items[index];

                          return CheckboxListTile(
                            title: Text("${item["label"]}"),
                            value: item["checked"] ?? false,
                            onChanged: (value) {
                              field.didChange(true);
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              }),
              LayoutBuilder(builder: (context, constraint) {
                List<String> itemStringList = ["Female", "Male"];

                return FormField(
                  initialValue: false,
                  enabled: true,
                  builder: (FormFieldState<bool> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Gender",
                        errorText: field.errorText,
                        helperText: "Your gender",
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: "Female",
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 24.0,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                            iconSize: 16,
                            elevation: 16,
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontSize,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontFamily,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                            ),
                            underline: Container(
                              height: 0,
                              color: Colors.grey[300],
                            ),
                            onChanged: (String? newValue) {},
                            items: itemStringList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    value,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
              Builder(
                builder: (context) {
                  String value = 'Female';
                  var items = [
                    'Female',
                    'Male',
                  ];

                  return Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        DropdownButton(
                          isExpanded: true,
                          value: value,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            debugPrint("newValue: $newValue");
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
