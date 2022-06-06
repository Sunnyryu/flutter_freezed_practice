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
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  mapWhen(Person person) {
    return person.when(
        (id, name, age, statusCode) =>
            'id: $id, name: $name, age: $age, statusCode: $statusCode',
        loading: (int? statusCode) => 'loading...',
        error: (String message, int? statusCode) => message);
  }

  @override
  Widget build(BuildContext context) {
    final person = Person(id: 1, name: "sunny", age: 29, statusCode: 200);
    final personLoading = Person.loading();
    final personError = Person.error('accessToken이 잘못됐습니다.', statusCode: 401);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("freezed test"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                renderText('person', person.toString()),
                renderText('personLoading', personLoading.toString()),
                renderText('personError', personError.toString()),
                renderText('personcode', person.statusCode.toString()),
                // renderText('person', person.id), 맨 위 객체에선 statusCode만 공통되기에 에러 발생
                renderText('person.when', mapWhen(person)),
                renderText('personLoading.when', mapWhen(personLoading)),
                renderText('personError.when', mapWhen(personError)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
