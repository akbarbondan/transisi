part of 'pages.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  List<User> user = [];
  int id = 1;

  addUser(String email, String name) {
    user.add(
        User(id: id, email: email, firstName: name, lastName: "", avatar: ""));
    id++;

    return UserServices.allUser.addAll(user);
  }

  Future addImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: "3F50B5".toColor(),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.close)),
        title: Text("Criar novo contato"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: GestureDetector(
                onTap: () {
                  if (name.text != "" && email.text != "") {
                    Get.snackbar("Berhasil membuat data", "",
                        backgroundColor: Colors.pink, colorText: Colors.white);
                    addUser(email.text, name.text);
                    Get.to(ListPage());
                  } else {
                    Get.snackbar("Data Gagal disimpan", "",
                        backgroundColor: Colors.pink, colorText: Colors.white);
                  }
                },
                child: Text("SALVAR")),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Stack(
                  children: [
                    Center(
                        child: GestureDetector(
                      onTap: addImage,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          label: Text("Name"),
                        ),
                      ),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          label: Text("E - Mail"),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.work),
                          label: Text("Trabalho"),
                        ),
                      ),
                      TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          label: Text("Phone"),
                        ),
                        maxLength: 16,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          label: Text("E-mail"),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(MdiIcons.link),
                          label: Text("Site da web"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
