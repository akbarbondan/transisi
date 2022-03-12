part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: "3F50B5".toColor(),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.white)),
        actions: [
          (user.select)
              ? Icon(Icons.star_border_rounded)
              : Icon(
                  Icons.star,
                  color: "3F50B5".toColor(),
                ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(MdiIcons.pencil),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: "3F50B5".toColor(),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (user.avatar == "")
                              ? Icon(
                                  Icons.person,
                                  size: 150,
                                  color: Colors.white,
                                )
                              : Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(user.avatar),
                                          fit: BoxFit.cover)),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${user.firstName}" + " " + "${user.lastName}",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: Icon(Icons.phone),
                          ),
                        ),
                        trailing: Icon(Icons.sms),
                        title: Text('08324325443'),
                        subtitle: Text('Telephone'),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: Icon(Icons.mail),
                          ),
                        ),
                        title: Text(user.email),
                        subtitle: Text('E-Mail'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
