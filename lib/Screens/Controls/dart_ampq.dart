/*import "package:dart_amqp/dart_amqp.dart";

void main() async {
  Client client = Client();

  Channel channel = await client.channel(); // auto-connect to localhost:5672 using guest credentials
  Queue queue = await channel.queue("hello");
  Consumer consumer = await queue.consume();
  consumer.listen((AmqpMessage message) {
    // Get the payload as a string
    print(" [x] Received string: ${message.payloadAsString}");

    // Or unserialize to json
    print(" [x] Received json: ${message.payloadAsJson}");

    // Or just get the raw data as a Uint8List
    print(" [x] Received raw: ${message.payload}");

    // The message object contains helper methods for
    // replying, ack-ing and rejecting
    message.reply("world");
  });
}*/
import 'dart:io';

import "package:dart_amqp/dart_amqp.dart";

void main(String eventStr ) async {
  
  String routingKey = 'task';
  //String get routingKey ;
  String event=eventStr;
  // You can provide a settings object to override the
  // default connection settings
  ConnectionSettings settings = ConnectionSettings(
    host: "192.168.137.117:8000",
    // authProvider: PlainAuthenticator("user", "pass")
  );
  Client client = Client(settings: settings);

  Channel channel = await client.channel();
  Exchange exchange = await channel.exchange("", ExchangeType.FANOUT);
  // We dont care about the routing key as our exchange type is FANOUT
  exchange.publish( event,routingKey);
  client.close();
}