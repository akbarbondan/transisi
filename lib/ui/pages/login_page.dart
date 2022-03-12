part of 'pages.dart';

class LoginPage extends StatelessWidget {
  Login? login;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
              child: Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person), hintText: "E-mail"),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 44,
                      width: double.infinity,
                      child: RaisedButton(
                        color: "3F50B5".toColor(),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        onPressed: () async {
                          String login = await Login.postLogin(
                              emailController.text, passwordController.text);
                          String token = "QpwL5tke4Pnpja7X4";
                          if (login == token) {
                            login = "";
                            Get.to(ListPage());
                          } else {
                            Get.snackbar(login, "",
                                backgroundColor: Colors.pink,
                                colorText: Colors.white);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text("email: eve.holt@reqres.in"),
                    Text("password: cityslicka"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
