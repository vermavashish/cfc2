import 'package:cfc2/pages/find.dart';
import 'package:cfc2/pages/found.dart';
import 'package:cfc2/pages/missing.dart';
import 'package:cfc2/pages/missing_report.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Dashboard(),
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  State createState() => new DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _dashBody(context),
    );
  }

  Widget _dashBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _dashHeader(),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Our Contribution",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Card(
              elevation: 4.0,
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      leading: Container(
                        alignment: Alignment.bottomCenter,
                        width: 45.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 8.0,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(width: 4.0),
                            Container(
                              height: 25,
                              width: 8.0,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(width: 4.0),
                            Container(
                              height: 40,
                              width: 8.0,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(width: 4.0),
                            Container(
                              height: 30,
                              width: 8.0,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                      title: Text("Found"),
                      subtitle: Text("10 Found"),
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: ListTile(
                      leading: Container(
                        alignment: Alignment.bottomCenter,
                        width: 45.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 8.0,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(width: 4.0),
                            Container(
                              height: 25,
                              width: 8.0,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(width: 4.0),
                            Container(
                              height: 40,
                              width: 8.0,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 4.0),
                            Container(
                              height: 30,
                              width: 8.0,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                      title: Text("Missing"),
                      subtitle: Text("50 Missing"),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Report()));
                    },
                    child: _dashTile(
                        color: Color(0Xff4f3961),
                        icon: Icons.report,
                        title: " Missing Report",
                        data: ""),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Find()));
                    },
                    child: _dashTile(
                        color: Color(0Xffea728c),
                        icon: Icons.portrait,
                        title: "Identify",
                        data: ""),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Missing()));
                    },
                    child: _dashTile(
                        color: Color(0Xfffc9d9d),
                        icon: Icons.priority_high,
                        title: "Missing",
                        data: "8"),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Found()));
                    },
                    child: _dashTile(
                        color: Color(0Xfff3d4d4),
                        icon: Icons.favorite,
                        title: "Found",
                        data: "6"),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Toast.show("Donate", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },
                    child: _dashTile(
                        color: Color(0Xff9fdfcd),
                        icon: Icons.attach_money,
                        title: "Donate",
                        data: ""),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Container _dashHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          color: Color(0xff696b9e)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text("Dashboard",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
            /*trailing: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage("assets/user.png"),
            ),*/
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("Call For Code",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Region",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Container _dashTile({Color color, IconData icon, String title, String data}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0)),
          Text(
            data,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
