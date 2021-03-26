import 'package:chapp/components/blueprint/person.dart';
import 'package:chapp/components/blueprint/person_status.dart';

Map<String, Person> peopleList = {
  'icanseker': new Person(
    id: 'icanseker',
    name: 'İsmail Can',
    surname: 'Şeker',
    phoneNumber: '+90 543 943 19 90',
    avatarUrl:
        'https://e7.pngegg.com/pngimages/951/920/png-clipart-albert-einstein-facial-hair-computer-icons-others.png',
    status: PersonStatus.online,
  ),
  'einstein': new Person(
    id: 'einstein',
    name: 'Albert',
    surname: 'Einstein',
    phoneNumber: '+90 501 999 99 99',
    status: PersonStatus.online,
    avatarUrl:
        'https://cdn.dribbble.com/users/1210339/screenshots/2773815/einstein.jpg',
    lastSeen: DateTime.parse('2021-03-13 23:32:34.612152'),
  ),
  'edison': new Person(
    id: 'edison',
    name: 'Thomas',
    surname: 'Edison',
    phoneNumber: '+90 502 999 99 99',
    avatarUrl:
        'https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png',
    status: PersonStatus.online,
  ),
  'tesla': new Person(
    id: 'tesla',
    phoneNumber: '+90 503 999 99 99',
    avatarUrl: 'https://clearhub.tech/wp-content/uploads/2018/10/man-1.png',
    status: PersonStatus.online,
    lastSeen: DateTime.parse('2021-03-14 23:32:34.612152'),
  ),
  'newton': new Person(
    id: 'newton',
    name: 'Isaac',
    surname: 'Newton',
    lastSeen: DateTime.parse('2021-03-15 21:32:34.612152'),
  ),
  'curie': new Person(
    id: 'curie',
    name: 'Marie',
    surname: 'Curie',
    avatarUrl: 'https://freesvg.org/img/marie-curie.png',
  )
};
