import 'package:chapp/model/subject/person.dart';
import 'package:chapp/model/subject/person_status.dart';

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
  'newton': new Person(
    id: 'newton',
    name: 'Isaac',
    surname: 'Newton',
    lastSeen: DateTime.parse('2021-03-15 21:32:34.612152'),
  ),
  'bohr': new Person(
    id: 'bohr',
    name: 'Niels',
    surname: 'Bohr',
    avatarUrl:
        'https://cdn.icon-icons.com/icons2/1381/PNG/512/electron_94377.png',
    lastSeen: DateTime.parse('2021-03-19 09:32:34.612152'),
  ),
  'galilei': new Person(
    id: 'galilei',
    name: 'Galileo',
    surname: 'Galilei',
    avatarUrl:
        'https://p7.hiclipart.com/preview/395/497/294/galileo-galilei-galileo-s-leaning-tower-of-pisa-experiment-scientist-clip-art-scientist.jpg',
    lastSeen: DateTime.parse('2021-03-24 19:46:34.612152'),
  ),
  'einstein': new Person(
    id: 'einstein',
    name: 'Albert',
    surname: 'Einstein',
    phoneNumber: '+90 501 999 99 99',
    status: PersonStatus.online,
    avatarUrl:
        'https://skolerom.no/wp-content/uploads/sites/2/2020/05/AHB1415.crime_punish.ip_einstein_final-1920x1468.jpg',
  ),
  'maxwell': new Person(
    id: 'maxwell',
    name: 'James Clerk',
    surname: 'Maxwell',
    avatarUrl:
        'https://cdn2.iconfinder.com/data/icons/renewable-energies-colored-outline/220/renewable-energy-512.png',
    lastSeen: DateTime.parse('2021-03-29 17:17:34.612152'),
  ),
  'faraday': new Person(
    id: 'faraday',
    name: 'Michael',
    surname: 'Faraday',
    avatarUrl:
        'https://st4.depositphotos.com/16418170/21230/v/1600/depositphotos_212302102-stock-illustration-michael-faraday-watercolor-vector-portrait.jpg',
    lastSeen: DateTime.parse('2021-03-30 17:19:34.612152'),
  ),
  'curie': new Person(
    id: 'curie',
    name: 'Marie',
    surname: 'Curie',
    status: PersonStatus.online,
    avatarUrl:
        'https://st4.depositphotos.com/16418170/21230/v/1600/depositphotos_212302110-stock-illustration-marie-sklodowska-curie-watercolor-vector.jpg',
  ),
  'rontgen': new Person(
    id: 'rontgen',
    name: 'Wilhelm',
    surname: 'Röntgen',
    avatarUrl:
        'https://cdn0.iconfinder.com/data/icons/healthcare-medicine/512/radiation-512.png',
    lastSeen: DateTime.parse('2021-03-12 18:19:34.612152'),
  ),
  'thomson': new Person(
    id: 'thomson',
    name: 'J. J.',
    surname: 'Thomson',
    lastSeen: DateTime.parse('2021-03-30 20:19:34.612152'),
  ),
  'kepler': new Person(
    id: 'kepler',
    name: 'Johannes',
    surname: 'Kepler',
    avatarUrl:
        'https://thumbs.dreamstime.com/b/johannes-kepler-astronomer-astrologer-vector-portrait-scientist-71806128.jpg',
    lastSeen: DateTime.parse('2021-03-28 20:19:34.612152'),
  ),
  'edison': new Person(
    id: 'edison',
    name: 'Thomas Alva',
    surname: 'Edison',
    phoneNumber: '+90 502 999 99 99',
    avatarUrl:
        'https://www.davison.com/wp/wp-content/uploads/2013/01/Thomas-Edison.jpg',
    status: PersonStatus.online,
  ),
  'tesla': new Person(
    id: 'tesla',
    phoneNumber: '+90 503 999 99 99',
    avatarUrl:
        'https://i.pinimg.com/originals/7a/9b/45/7a9b45f9502ab3a33ad059576e0c81ed.jpg',
    lastSeen: DateTime.parse('2021-03-14 23:32:34.612152'),
  ),
};
