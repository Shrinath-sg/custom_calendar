import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Color lightblue = const Color(0xffeef9ff);
  late DateTime initialDate;
  @override
  void initState() {
    initialDate = DateTime.now();
    super.initState();
  }

  List<CustomNames> names = [
    CustomNames(id: 0, name: 'Never ends', isClecked: false),
    CustomNames(id: 1, name: '15 days later', isClecked: false),
    CustomNames(id: 2, name: '30 days later', isClecked: false),
    CustomNames(id: 3, name: '60 days later', isClecked: false),
    CustomNames(id: 4, name: '90 days later', isClecked: false),
    CustomNames(id: 5, name: '120 days later', isClecked: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Calendar Demo'),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text('Click here'),
          onPressed: () async {
            await showDatePicker(
                context: context,
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2050, 9),
                customHeaderWidget: GridView.builder(
                    // primary: ,
                    shrinkWrap: true,
                    itemCount: names.length,
                    // padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 8 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return myButton(context, names[index]);
                    }),
                initialDate: initialDate);
          },
        )));
  }

  myButton(BuildContext context, CustomNames name) {
    return StatefulBuilder(
      builder: (context, setState2) {
        return TextButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                  name.isClecked ? Colors.blue : lightblue),
              foregroundColor: MaterialStateProperty.all(
                  name.isClecked ? Colors.white : Colors.blue)),
          child: Text(name.name ?? ''),
          onPressed: () async {
            name.isClecked = !name.isClecked;
            setState(() {});
          },
        );
      },
      // child:
    );
  }
}

class CustomNames {
  CustomNames({this.id, this.name, this.isClecked = false});
  final String? name;
  final int? id;
  bool isClecked;
}
