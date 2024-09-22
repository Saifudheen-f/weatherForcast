import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Time extends StatelessWidget {
 final dynamic clockStream;
  const Time({super.key,required this.clockStream});
  
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<DateTime>(
            stream: clockStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 20)
                 , DateFormat('EE H:mm').format(snapshot.data!),
                  
                );
              } else {
                return Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white.withOpacity(0.5),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                );
              }
            },
          );
  }
}