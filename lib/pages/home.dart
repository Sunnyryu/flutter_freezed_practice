import 'package:flutter/material.dart';
import 'package:flutter_freezed/model/person.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  renderText(String title, String text) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
        const Divider(
          height: 1,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final schoolOne = School(id: 3, name: 'MIT');
    final groupOne =
        Group(id: 2, name: 'Flutter Development', school: schoolOne);
    final personOne = Person(id: 1, name: 'sunny', age: 29, group: groupOne);

    final personNew = personOne.copyWith(
      group: groupOne.copyWith(
        school: schoolOne.copyWith(
          name: 'Yale',
        ),
      ),
    );
    final personNewTwo = personOne.copyWith.group.school(name: 'Harvard');

    final personTwo = Person(id: 1, name: 'sunny', age: 29, group: groupOne);
    final personThree = Person(
        id: personOne.id, name: personOne.name, age: 18, group: groupOne);
    final personFour = personOne.copyWith(age: 18);

    // personOne.hello();
    // 호출 가능!
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("freezed test"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                renderText('person1.id', personOne.id.toString()),
                renderText('person1.name', personOne.name),
                renderText('person1.age', personOne.age.toString()),
                renderText('toString()', personOne.toString()),
                // renderText('toJson()', personOne.toJson().toString()),
                renderText('==', (personOne == personTwo).toString()),
                renderText('nameLength', personOne.nameLength.toString()),
                renderText('person4.ToString()', personFour.toString()),
                renderText('personNew.ToString()', personNew.toString()),
                renderText('personNewTwo.ToString()', personNewTwo.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
