import 'package:flutter/cupertino.dart';
import 'package:loader_skeleton/loader_skeleton.dart';

class Loader extends StatefulWidget{
  const Loader({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LoaderState();
  }

}
class LoaderState extends State<Loader>{
  @override
  Widget build(BuildContext context) {
    return CardPageSkeleton(totalLines: 5,);
  }

}