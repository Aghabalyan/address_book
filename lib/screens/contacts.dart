import 'package:flutter/material.dart';
import 'package:address_book/models/contact.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    Contact contact1 = Contact(
        1,
        'Albert Einstein',
        11,
        false,
        'https://upload.wikimedia.org/wikipedia/commons/e/e9/Albert-einstein-profile-picture-512x512.png.cf.png',
        'Theory of relativity',
        'Albert Einstein was a German-born theoretical physicist who developed the theory of relativity',
        [
          'https://cdn.wallpapersafari.com/25/95/BvMFHt.jpg',
          'https://www.breamishvalley.com/wp-content/uploads/2015/03/Mundane-nature-800x400-c-default.jpg',
          'https://www.perutravelmajestic.com/wp-content/uploads/2017/04/Tuc%C3%A1n-800x400.jpg',
          'https://www.newcaledonia.travel/sites/default/files/inline-images/Aquarium-Naturel-Mare-Loyalty-Islands-800x400.png'
        ]);

    Contact contact2 = Contact(
        2,
        'Amazon Prime',
        1,
        true,
        'https://pbs.twimg.com/profile_images/2449223859/111v879dnnemc7ej1ku2_400x400.jpeg',
        'Check out whats included with your Prime membership and rate',
        'Amazon Prime is a paid subscription program from Amazon that gives users access to additional services otherwise unavailable or available at a premium to regular Amazon customers. Services include same, one or two-day delivery and streaming music and video.',
        []);

    Contact contact3 = Contact(
        3,
        'Google Express',
        9,
        true,
        'https://vistatec.com/wp-content/uploads/2018/12/google-favicon-vector-400x400.png',
        'Flutter | Microsoft Active',
        'We needed to build an iOS and Android native application that could log into our customer’s Active Directory account, do some custom scope things and pull authorized information via an API.',
        ['https://yaftamobile-pulse.s3.eu-central-1.amazonaws.com/blog/flutter.png']);

    Contact contact4 = Contact(
        4,
        'Google Express',
        2,
        false,
        'https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/CNN_logo_400x400.png',
        'CNN International - Breaking News, US News, World News',
        'Cable News Network is an American news-based pay television channel owned by CNN Worldwide, a unit of the WarnerMedia News & Sports division of AT&Ts WarnerMedia. CNN was founded in 1980 by American media proprietor Ted Turner and Reese Schonfeld as a 24-hour cable news channel.',
        ['https://i.insider.com/5f1b201a5af6cc7e1b741330?width=1136&format=jpeg',
          'https://media.wired.com/photos/5c1d53145ecee564c8186fd9/125:94/w_2375,h_1786,c_limit/SpaceX-1074353714.jpg',
          'https://static01.nyt.com/images/2019/09/28/us/politics/28spacex/28spacex-videoSixteenByNineJumbo1600.jpg']);

    //Box decoration

    contacts.add(contact1);
    contacts.add(contact2);
    contacts.add(contact3);
    contacts.add(contact4);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 16),
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            return InkWell(
              onTap: () {
                // _showUserDetail(users[index]);
              },
              child: Container(
                 padding: EdgeInsets.only(bottom: itemIndex == (contacts.length - 1) ? 0 : 8),
                color: Colors.black12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${contacts[itemIndex].userName} - ${contacts[itemIndex].elapsedTimeInHour} hrs ago',
                                  style: const TextStyle(fontSize: 15),
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  contacts[itemIndex].title ?? '-',
                                  style: const TextStyle(
                                      fontSize: 21, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          // const Spacer(),
                          ClipOval(
                            child: SizedBox.fromSize(
                                size: const Size.fromRadius(25.0), // Image radius
                                child: Image.network(
                                  contacts[itemIndex].userImage ?? '',
                                  width: 50,
                                  height: 50,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        contacts[itemIndex].description ?? '-',
                        style: const TextStyle(fontSize: 15),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height:contacts[itemIndex].images.isNotEmpty ? 100.0 : 0.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts[itemIndex].images.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Container(
                                    color: Colors.grey,
                                    child: Image.network(
                                      contacts[itemIndex].images[index] ?? '',
                                      height: 100,
                                      width: 160,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
