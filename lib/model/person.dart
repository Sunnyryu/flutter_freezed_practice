import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

// 꼴랑 이코드만 추가함
@freezed
class Person with _$Person {
  //(2)

  @Assert('name.isNotEmpty', 'name cannot be empty')
  @Assert('age >= 0')
  factory Person({
    required int id,
    required String name,
    required int age,
    required Group group,
  }) = _Person;

  // factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  const Person._();
  // 밑의 get과 hello를 쓰기 위해 이친구를 사용함 / 그리고 코드에 오류가 발생하기에 다시 build를 해줘야함
  // define a private empty constructor:

  get nameLength => this.name.length;

  void hello() {
    print("123");
  }
}

@freezed
class Group with _$Group {
  factory Group({
    required int id,
    required String name,
    required School school,
  }) = _Group;
}

@freezed
class School with _$School {
  factory School({
    required int id,
    required String name,
  }) = _School;
}


//(1)
// class Person {
//   final int id;
//   final int name;
//   final age;

//   Person({
//     required int id,
//     required String name,
//     required int age,
//   });
// }

//(2)
// class Person {
//   final int id;

//   Person({required this.id,}) : assert (id < 10);
// }
