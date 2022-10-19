import 'package:flutter/material.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  final listNames = [
    'Never ends',
    '15 days later',
    '30 days later',
    '60 days later',
    '90 days later',
    '120 days later'
  ];
  List<CustomNames> myNames = [];
  @override
  void initState() {
    myNames = List.generate(listNames.length,
        (index) => CustomNames(id: index, name: listNames[index])).toList();

    super.initState();
  }

  demo() {
    SizedBox(
      // height: _datePickerHeaderPortraitHeight,
      child: Material(
        // color: colorScheme.copyWith(background: Colo),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 24,
            end: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('button'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('button'),
                  ),
                ],
              ),

              // help,
              const Flexible(child: SizedBox(height: 38)),
              // Row(
              //   children: <Widget>[
              //     Expanded(child: title),
              //     if (entryModeButton != null) entryModeButton!,
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (ctx, index) {
              return customButton(myNames[index]);
            })
        // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: firstDate, lastDate: lastDate)
      ],
    );
  }

  Widget customButton(CustomNames customNames) {
    return ElevatedButton(onPressed: () {}, child: const Text('text'));
  }
}

class CustomNames {
  CustomNames({this.id, this.name});
  final String? name;
  final int? id;
}
