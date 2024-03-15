import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageFormRegister extends StatefulWidget {
  const PageFormRegister({super.key});

  @override
  State<PageFormRegister> createState() => _PageFormRegisterState();
}

class _PageFormRegisterState extends State<PageFormRegister> {
  //untuk mendapatkan value dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtTglLahir = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  String? valAgama, valJk;
  //validasi form
  GlobalKey<FormState> keyForm= GlobalKey<FormState>();
  //untuk datepicker
  Future selectDate() async{
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if(pickedDate != null){
      setState(() {
        txtTglLahir.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Form  Register'),
        ),

        body: Form(
            key: keyForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    TextFormField(
                      //validasi kosong
                      validator: (val){
                        return val!.isEmpty ? "tidak boleh kosong " : null;
                      },
                      controller: txtUsername,
                      decoration: InputDecoration(
                          hintText: 'Input Username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      //validasi kosong
                      validator: (val){
                        return val!.isEmpty ? "tidak boleh kosong " : null;
                      },
                      controller: txtFullName,
                      decoration: InputDecoration(
                          hintText: 'Input Full Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      //validasi kosong
                      validator: (val){
                        return val!.isEmpty ? "tidak boleh kosong " : null;
                      },
                      controller: txtEmail,
                      decoration: InputDecoration(
                          hintText: 'Input Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      validator: (val){
                        return val!.isEmpty ? "tidak boleh kosong " : null;
                      },
                      controller: txtPassword,
                      obscureText: true,//biar password nya gak keliatan
                      decoration: InputDecoration(
                          hintText: 'Input Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      onTap: (){
                        selectDate();
                      },
                      validator: (val){
                        return val!.isEmpty ? "tidak boleh kosong " : null;
                      },
                      controller: txtTglLahir,
                      decoration: InputDecoration(
                          hintText: 'Input Tanggal Lahir',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      height: 65,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton(
                        value: valAgama,
                        underline: Container(),
                        isExpanded: true,
                        hint: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Pilih Agama'),
                        ),
                        items: [
                          "Islam",
                          "Kristen",
                          "Protestan",
                          "Budha"
                        ].map((e){
                          return DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(e),
                            ),
                          );
                        }).toList(),
                        onChanged: (val){
                          setState(() {
                            valAgama = val;
                            print('hasil agama: ${valAgama}');
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: RadioListTile(
                            value: "Laki-laki",
                            groupValue: valJk,
                            onChanged: (val){
                              setState(() {
                                valJk = val;
                              });
                            },
                            activeColor: Colors.grey,
                            title: Text(
                                'Laki-Laki'
                            ),
                          ),
                        ),
                        Flexible(
                          child: RadioListTile(
                            value: "Perempuan",
                            groupValue: valJk,
                            onChanged: (val){
                              setState(() {
                                valJk = val;
                              });
                            },
                            activeColor: Colors.grey,
                            title: Text(
                                'Perempuan'
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    MaterialButton(
                      color: Colors.green,
                      minWidth: 200,
                      height: 45,
                      onPressed: () {
                        if (keyForm.currentState?.validate() == true) {
                          if (valJk != null && valAgama != null) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Data Register"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Fullname: ${txtFullName.text}"),
                                        Text("Username: ${txtUsername.text}"),
                                        Text("Email: ${txtEmail.text}"),
                                        Text("Password: ${txtPassword.text}"),
                                        Text("Tanggal Lahir: ${txtTglLahir.text}"),
                                        Text("Agama: $valAgama"),
                                        Text("Jenis Kelamin: $valJk")
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Dismiss"))
                                    ],
                                  );
                                });
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Pilih agama dan jenis kelamin"),
                              backgroundColor: Colors.green,
                            ));
                          }
                        }
                      },
                      child: const Text("SIMPAN"),
                    )
                  ],
                ),
              ),
            ),
            ),
        );
    }
}
