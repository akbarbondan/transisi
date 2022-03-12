part of 'pages.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: "3F50B5".toColor(),
        title: Text("Contatos"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.search_outlined),
          )
        ],
      ),
      body: FutureBuilder(
        future: UserServices.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Text(
              ("Loading...."),
            ));
          } else {
            return ListView.builder(
                itemCount: UserServices.allUser.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(DetailPage(UserServices.allUser[index]));
                      },
                      child: Listile(
                        nama: "${UserServices.allUser[index].firstName}" +
                            " " +
                            "${UserServices.allUser[index].lastName}",
                        email: UserServices.allUser[index].email,
                        avatar: UserServices.allUser[index].avatar,
                      ),
                    ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: "3F50B5".toColor(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(CreatePage());
        },
      ),
    );
  }
}
