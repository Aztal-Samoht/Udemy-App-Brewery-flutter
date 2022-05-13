class TasksScreenBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          children: [ListItem(), ListItem()],
        ),
      ),
    );
  }
}
