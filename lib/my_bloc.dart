import 'dart:async';

class MyBloc {
    int counter =0;
    StreamController _countercontroller = new StreamController<int>();
    Stream get counterStream => _countercontroller.stream;

    void incremnent(){
        counter+=1;
        _countercontroller.sink.add(counter);
    }
    void dispose(){
        _countercontroller.close();
    }
}