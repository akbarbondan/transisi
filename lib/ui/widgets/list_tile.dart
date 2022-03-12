part of 'widgets.dart';

class Listile extends StatefulWidget {
  final Function? onTap;
  final String? nama;
  final String? email;
  final String? avatar;
  bool? selected;
  Listile(
      {this.onTap, this.avatar, this.email, this.nama, this.selected = true});

  @override
  State<Listile> createState() => _ListileState();
}

class _ListileState extends State<Listile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.brown.shade800,
        backgroundImage: NetworkImage("${widget.avatar}"),
      ),
      title: Text("${widget.nama}"),
      subtitle: Text("${widget.email}"),
      trailing: GestureDetector(
          onTap: () {
            setState(() {
              if (widget.selected != true) {
                widget.selected = true;
              } else if (widget.selected == true) {
                widget.selected = false;
              }
            });
          },
          child: (widget.selected != false)
              ? Icon(Icons.star_border_outlined)
              : Icon(
                  Icons.star,
                  color: "3F50B5".toColor(),
                )),
    );
  }
}
