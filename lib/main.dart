import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
  const  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "whatsApp",
      theme: ThemeData(primaryColor: Colors.teal),

      home: const MyHomePage(),
    );

  }
}



class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

Widget openPopUp() {
  return PopupMenuButton(
      itemBuilder: (context) {
        return List. generate(3, (index) => const PopupMenuItem(
            child: Text("Setting"),
        ));
  },
  );
}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child:  Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(child: const Icon(Icons.search),onTap: (){}),

        PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text("New Group")),
              const PopupMenuItem(child: Text("New Broadcast")),
              const PopupMenuItem(child: Text("Linked Devices")),
              const PopupMenuItem(child: Text("Starred Messages")),
              const PopupMenuItem(child: Text("Settings")),
            ];
          },
        ),
       ],
        backgroundColor: const Color(0xff128c7e),
        title: const Text("Whatsapp"),
        bottom: const TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              iconMargin: EdgeInsets.all(100),
              child: Icon(
                  Icons.camera_alt_rounded,
            )),
            Tab(
              child: Text("CHATS", style: TextStyle(color: Colors.white)),
            ),
            Tab(
              child: Text("STATUS", style: TextStyle(color: Colors.white)),
            ),
            Tab(
              child: Text("CALLS", style: TextStyle(color: Colors.white)),
            ),
          ],
          labelColor: Colors.white,
        ),
      ),
      body: const TabBarView(
          children: [
            Center(child: Text("This feature is coming soon")),
            ChatsTab(),
            StatusTab(),
            CallTab(),
          ],
      ),
    ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
    child: ListView(
    children: const [
      SingleChatWidget(
    chatTitle: "Ronaldo",
    chatMessage: "I hate Football",
    seenStatusColor: Colors.blue,
        imageUrl: "https://th.bing.com/th/id/OIP.rMjqCfx6LwWtxDqWb42OQwHaEK?w=268&h=180&c=7&r=0&o=5&pid=1.7j x2w2sa",
    ),
     SingleChatWidget(
    chatTitle:"Lionel",
    chatMessage:"always play football",
    seenStatusColor: Colors.grey,
    imageUrl:"https://tse1.mm.bing.net/th/id/OIP.QaQ-FXrieRdcYbvIegXKywHaE8?w=257&h=180&c=7&r=0&o=5&pid=1.7"
    ),
     SingleChatWidget(
    chatTitle:"Neymar",
    chatMessage:"eat vegetables",
    seenStatusColor: Colors.grey,
    imageUrl:"https://tse3.mm.bing.net/th/id/OIP.LX6NitYXoyRyMFlaXYVHYQHaIb?w=163&h=184&c=7&r=0&o=5&pid=1.7"
    ),
     SingleChatWidget(
    chatTitle:"chelsea",
    chatMessage:"champions League",
    seenStatusColor: Colors.blue,
    imageUrl:"https://th.bing.com/th/id/OIP.poK6aQs9Dz_HroPRcsZ1GQHaFj?w=240&h=180&c=7&r=0&o=5&pid=1.7"
     ),
     SingleChatWidget(
    chatTitle:"ManUnited",
    chatMessage:"No Title",
    seenStatusColor: Colors.grey,
    imageUrl:"https://th.bing.com/th/id/OIP.6NWhLLc7MdJ2Todgt3PLbwHaEo?w=266&h=180&c=7&r=0&o=5&pid=1.7"
     ),
     SingleChatWidget(
    chatTitle:"Real Madrid",
    chatMessage:"14 Champions League Title",
    seenStatusColor: Colors.blue,
    imageUrl:"https://tse4.mm.bing.net/th/id/OIF.TBIPSxCMbjtuHsXk8N6TAg?w=115&h=180&c=7&r=0&o=5&pid=1.7"
    ),
     SingleChatWidget(
     chatTitle: "Mane",
     chatMessage: "i play for Senegal",
     seenStatusColor: Colors.grey,
     imageUrl: "https://th.bing.com/th/id/OIP.g0KmnkfL04v-j4OpNoj84gHaEJ?w=289&h=180&c=7&r=0&o=5&pid=1.7",
    ),
     SingleChatWidget(
       chatTitle: "Mbappe",
       chatMessage: "I am the richest footballer",
       seenStatusColor: Colors.blue,
       imageUrl: "https://th.bing.com/th/id/R.8d60a99167d00f211b69bdb727b9fcfc?rik=rhpPJwL4C3aKSw&pid=ImgRaw&r=0",
     ),
     SingleChatWidget(
       chatTitle: "Benzema",
       chatMessage: "I play in France",
       seenStatusColor: Colors.grey,
       imageUrl: "https://th.bing.com/th/id/OIP.jdxRz5i2x48Ew0u33FUlCwHaEK?w=307&h=180&c=7&r=0&o=5&pid=1.7#",
     )]
    ),
    ),
    );
  }
}
class SingleChatWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final Color? seenStatusColor;
  final String? imageUrl;

  const SingleChatWidget({
    Key? key,
    this.chatMessage,
    this.chatTitle,
    this.seenStatusColor,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundImage: NetworkImage(imageUrl!),
        ),
        Expanded(child: ListTile(
          title: Text("$chatTitle",
          style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Row(children: [
            Icon(
              seenStatusColor == Colors.blue ? Icons.done_all : Icons.done,
              size: 15,
              color: seenStatusColor,
            ),
            Expanded(child: (Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                "$chatMessage",
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            )))
          ]),
          trailing: Column(
            children: const [
              Padding(
                  padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Yesterday",
              ),)
            ],
          ),
        ))
      ],
    );
  }
}

class StatusTab extends StatelessWidget {
  const StatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children:  const [
                  CircleAvatar(
                    backgroundColor: Color(0xff128C7E),
                    foregroundColor: Color(0xff128C7E),
                    radius: 30,
                    backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.Ss29k-qekVgcFZSDnsjc_wHaEK?w=328&h=184&c=7&r=0&o=5&pid=1.7"),
                  ),
                  Positioned(
                    top: 40,
                      left: 40,
                      child: CircleAvatar(
                        radius: 10,
                        child: Icon(Icons.add,size: 20),
                      ))
                ],
              ),
              const Expanded(
                  child: ListTile(
                title: Text("My Status"),
                subtitle: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                child: Text("Tap to add status update"),),
              ))
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text("Viewed updates",
          style: TextStyle(fontWeight: FontWeight.w400),),),
          Row(
            children: [
              Stack(
                children:  const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: 
                      NetworkImage("https://th.bing.com/th/id/OIP.D2MbyXDZd7SDaXPQIs2i8AHaIR?w=154&h=180&c=7&r=0&o=5&pid=1.7"),
                    ),
                  )
                ],
              ),
              const Expanded(
                  child:ListTile(
                    title: Text("Ronaldo"),
                    subtitle: Padding(
                        padding: EdgeInsets.only(top: 2.0),
                    child: Text("7 minutes ago"),),
                  ))
            ],
          ),
          Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: const ExpansionTile(
                textColor: Colors.black,
                tilePadding: EdgeInsets.all(0.0),
                title: Text("Muted updates",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
              ),
    children: [
      SingleStatusItem(
                  statusTitle: "Messi",
                statusTime:"45 minutes ago",
                statusImage:"https://th.bing.com/th/id/R.654e6dac8bc45957312f6584e18aaf76?rik=rsBErdPrJGppYQ&pid=ImgRaw&r=0"
              ),
            SingleStatusItem(
              statusTitle: "Neymar",
              statusTime: "3 minutes ago",
              statusImage:"https://www.albawaba.com/sites/default/files/styles/default/public/2020-05/psg.jpg?itok=W4E21nvw"
            ),
            SingleStatusItem(
              statusTitle:"Benzema",
              statusTime:"18 minutes ago",
              statusImage:"https://th.bing.com/th/id/OIP.-RW7ud9M0fqLHp6nqY6fBgHaD4?pid=ImgDet&rs=1"
            ),
    ],))
        ]
      ),
    ),);
  }
}
class SingleStatusItem extends StatelessWidget {
  final String? statusTitle;
  final String? statusTime;
  final String? statusImage;
  const SingleStatusItem({
    Key? key,
    this.statusTitle,
    this.statusTime,
    this.statusImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(statusImage!),
              ),
            )
          ],
        ),
        Expanded(
            child: ListTile(
              title: Text("$statusTitle"),
              subtitle: Padding(

                padding: const EdgeInsets.only(top: 2.0),
                child: Text("$statusTime"),
              ),
            ))
      ],

    );
  }
}
class CallTab extends StatelessWidget {
  const CallTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SingleCallWidget(
              callStatus: "Outgoing",
              callType: "Audio",
              chatMessage: "Today, 12:25 PM",
              chatTitle: "Ronaldo",
              imageUrl:"https://th.bing.com/th/id/OIP.PetHeX0hecQIvuzeCJccAgHaE7?w=253&h=180&c=7&r=0&o=5&pid=1.7"
            ),
            SingleCallWidget(
                callStatus: "Incoming",
                callType: "Video",
                chatMessage: "Today, 01:11 AM",
                chatTitle: "Messi",
                imageUrl:"https://th.bing.com/th/id/OIP.QaQ-FXrieRdcYbvIegXKywHaE8?w=257&h=180&c=7&r=0&o=5&pid=1.7"
            ),
            SingleCallWidget(
                callStatus: "Outgoing",
                callType: "Audio",
                chatMessage: "Today, 01:25 PM",
                chatTitle: "Neymar",
                imageUrl:"https://th.bing.com/th/id/R.d78c507e2c59fc218c366d7155c97d7e?rik=gpvm7ftjocUIgg&pid=ImgRaw&r=0"
            ),
            SingleCallWidget(
                callStatus: "Incoming",
                callType: "Video",
                chatMessage: "Today, 03:25 PM",
                chatTitle: "Benzema",
                imageUrl:"https://th.bing.com/th/id/R.655b0dd82078bde59d92b9d1d6c5ea51?rik=3GXpS%2fdDSZfxqg&pid=ImgRaw&r=0"
            ),
          ],
        )
      ),
    );
  }
}
class SingleCallWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final String? callStatus;
  final String? imageUrl;
  final String? callType;
  const SingleCallWidget({
    Key? key,
    this.chatMessage,
    this.chatTitle,
    this.callStatus,
    this.imageUrl,
    this.callType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl!),
        ),
        Expanded(
            child: ListTile(
              title: Text("$chatTitle",
              style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Row(children: [
                Icon(
                  callStatus == "Incoming"
                      ? (Icons.call_received_sharp)
                      : Icons.call_made_sharp,
                  size: 15,
                  color: callStatus == "Incoming" ? Colors.teal : Colors.red,
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      "$chatMessage",
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),))
              ],) ,
              trailing: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(callType == "Audio" ? Icons.call :Icons.videocam,color: Colors.teal),)
                ],
              ),
            ))
      ],
    );
  }
}
