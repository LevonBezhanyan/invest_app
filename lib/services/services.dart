import 'package:flutter/material.dart';

List<Map<String, dynamic>> planListData = [
  {
    'backgroundImage': 'assets/image 4.png',
    'backgroundColor': const [
      Color.fromRGBO(217, 143, 57, 1),
      Color.fromRGBO(221, 185, 54, 0.298),
    ],
    'text': 'Gold',
    'infoText': '30% return',
    'assetImage': 'assets/image coin.png'
  },
  {
    'backgroundImage': 'assets/image 5.png',
    'backgroundColor': const [
      Color.fromRGBO(133, 133, 133, 1),
      Color.fromRGBO(183, 183, 183, 0.3)
    ],
    'text': 'Silver',
    'infoText': '60% return',
    'assetImage': 'assets/image 5.png'
  },
  {
    'backgroundImage': 'assets/image 6.png',
    'backgroundColor': const [
      Color.fromRGBO(83, 71, 221, 1),
      Color.fromRGBO(170, 116, 240, 0.3)
    ],
    'text': 'Platinium',
    'infoText': '90% return',
    'assetImage': 'assets/image 6.png'
  }
];

Widget planList(List<Map<String, dynamic>> data) {
  return SizedBox(
    height: 165,
    child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      barrierColor: Colors.white,
                      
                      context: context,
                      showDragHandle: true,
                      builder: (context) {
                        return Container(
                          height: 600,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.only(top: 40),
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Text(
                                        'My Asset',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade500,
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                            padding: const EdgeInsets.all(2),
                                            style: const ButtonStyle(),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 18,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Your total asset portfolio',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade500),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'N203,935',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        child: const Row(
                                          children: [
                                            Icon(Icons.upload_sharp,
                                                size: 20,
                                                color: Color.fromRGBO(
                                                    48, 169, 94, 1)),
                                            Text(' +2%',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromRGBO(
                                                        48, 169, 94, 1)))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 80)
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Current Plans',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:const EdgeInsets.fromLTRB(20, 20, 20, 5),
                                  child: Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            colorFilter: const ColorFilter.mode(
                                                Color.fromRGBO(
                                                    123, 121, 121, 1),
                                                BlendMode.colorBurn),
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                data[index]['assetImage'])),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: data[index]
                                                  ['backgroundColor']),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 30, 15, 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data[index]['text'],
                                              style: const TextStyle(
                                                  height: 1.5,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              data[index]['infoText'],
                                              style: const TextStyle(
                                                  height: 1.5,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('See All Plans ',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  254, 85, 93, 1),
                                              fontSize: 18,
                                            )),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          size: 18,
                                          color: Color.fromRGBO(254, 85, 93, 1),
                                        )
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'History',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                history(),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: 134,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: const ColorFilter.mode(
                              Color.fromRGBO(123, 121, 121, 1),
                              BlendMode.colorBurn),
                          fit: BoxFit.cover,
                          image: AssetImage(data[index]['backgroundImage'])),
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: data[index]['backgroundColor']),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['text'],
                            style: const TextStyle(
                                height: 1.15,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            data[index]['infoText'],
                            style: const TextStyle(
                                height: 1.15,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 15);
        },
        itemCount: 3),
  );
}

Widget bestPlan() {
  return planList(planListData);
}

List<Map<String, dynamic>> guideListData = [
  {
    'title': 'Basic type of investments',
    'subtitle':
        'This is how you set your foot for 2020 Stock market recession. What’s next...',
    'image': 'assets/Ellipse 740.png'
  },
  {
    'title': 'How much can you start wit..',
    'subtitle':
        'What do you like to see? It\'s a very different market from 2018. The way...',
    'image': 'assets/Ellipse 740 (1).png'
  }
];

Widget guideList(List<Map<String, dynamic>> data) {
  return SizedBox(
    child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            title: Text(
              data[index]['title'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              data[index]['subtitle'],
              style: const TextStyle(fontSize: 14),
            ),
            trailing: Image(image: AssetImage(data[index]['image'])),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
              height: 5,
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey.shade300))),
              ));
        },
        itemCount: 2),
  );
}

Widget investmentGuide() {
  return guideList(guideListData);
}

List<Map<String, dynamic>> notificationListData = [
  {
    'image': 'assets/Rectangle 57.png',
    'title': 'Apple stocks just increased. Check it out now.',
    'time': '15min ago'
  },
  {
    'image': 'assets/Rectangle 58.png',
    'title': 'Check out today\'s best inves-tor. You\'ll learn from him',
    'time': '3min ago'
  },
  {
    'image': 'assets/Rectangle 59.png',
    'title': 'Where do you see yourself in the next ages.',
    'time': '30secs ago'
  },
];

Widget notificationList(List<Map<String, dynamic>> data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SizedBox(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              title: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image(image: AssetImage(data[index]['image'])),
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          data[index]['title'],
                          style: const TextStyle(fontSize: 15, height: 1),
                        ),
                      )),
                ],
              ),
              trailing: Column(
                children: [
                  Text(
                    data[index]['time'],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
                height: 10,
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: Colors.grey.shade300))),
                ));
          },
          itemCount: data.length),
    ),
  );
}

Widget notificHistory() {
  return notificationList(notificationListData);
}

List<Map<String, dynamic>> historyListData = [
  {
    'title': const Text(
      'Rp 200.000',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    'subtitle': 'Buy “APPL” Stock',
    'day': 'TUE 22 Jun 2020'
  },
  {
    'title': const Text(
      'Rp 200.000',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(48, 169, 94, 1),
      ),
    ),
    'subtitle': 'Sell “TLKM” Stock',
    'day': 'TUE 22 Jun 2020'
  },
  {
    'title': const Text(
      'Rp 200.000',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    'subtitle': 'Buy “FB” Stock',
    'day': 'TUE 22 Jun 2020'
  },
  {
    'title': const Text(
      'Rp 200.000',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(48, 169, 94, 1),
      ),
    ),
    'subtitle': 'Sell “APPL” Stock',
    'day': 'TUE 22 Jun 2020'
  }
];

Widget historyList(List<Map<String, dynamic>> data) {
  return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [data[index]['title']],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data[index]['subtitle'],
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.shade500),
                    ),
                    Text(
                      data[index]['day'],
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SizedBox(
              height: 10,
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey.shade300))),
              )),
        );
      },
      itemCount: 4);
}

Widget history() {
  return historyList(historyListData);
}
