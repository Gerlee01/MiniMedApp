import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<Map<String, String>> imgList = [
  {
    'url':
        'https://www.montsame.mn/uploads/content/277f342fe7af013373ce2c8a171f9946.png',
    'title': 'Төрийн тусгай албан хаагчдын нэгдсэн эмнэлэг Чингэлтэй дүүргийн иргэдэд үйлчилж эхэлжээ',
  },
  {
    'url': 'https://www.montsame.mn/files/5d1ef10b220ba.jpeg',
    'title': 'Төрийн тусгай албан хаагчдын нэгдсэн эмнэлэг эмчлүүлэгчээ таних систем нэвтрүүллээ',
  },
  {
    'url': 'http://media.itoim.mn/media/imagel/22998/image_660.jpeg',
    'title': 'Энгийн иргэд Төрийн тусгай албан хаагчдын нэгдсэн эмнэлгээс авч болох онцлох 5 үйлчилгээ',
  },
  {
    'url':
        'http://www.mnb.mn/uploads/202010/news/thumb/35f386ce75e3f407394d44e29f80f917_x3.jpg',
    'title': 'Монгол Улсын Ерөнхий сайд У.Хүрэлсүх өнөөдөр хуульзүйн салбарын зарим байгууллагад зочиллоо.',
  },
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item['url'], fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          item['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class CarouselSliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: imageSliders,
    ));
  }
}
