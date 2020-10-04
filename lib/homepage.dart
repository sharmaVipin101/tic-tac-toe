import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //todo: link images
  AssetImage cross = AssetImage("assets/cross.png");
  AssetImage edit = AssetImage("assets/edits.png");
  AssetImage circle = AssetImage("assets/circle.png");


  bool iscross = true;
  String message;
  List<String> gameState;

  //initialize state of box with empty;

  @override
  void initState(){
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //play game method
  playGame(int index){
    if(this.gameState[index]=='empty')
      {
        setState(() {
          if(this.iscross){
            this.gameState[index] = 'cross';
          }
          else {
            this.gameState[index] = 'circle';
          }
          this.iscross = !this.iscross;
          this.checkWin();
        });
      }

  }
  //reset game
  resetGame()
  {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }
  //get image
   getImage(String value){

    switch(value)
    {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;

    }
  }

  void dialog(String message)
  {
      showDialog(context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Color(0xffF0DF87),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          content:Container(

            child: Text(message.toUpperCase(),style:
            TextStyle(
                fontSize: 30,
                color: Colors.black,
              fontFamily: 'monospace'
            ),) ,
          ),
          actions: [
            FlatButton(
              child: Text('Okay',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 20
              ),),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      });
  }

  // winning logic

  checkWin(){

    if((gameState[0]!='empty')&& gameState[0]==gameState[1] && gameState[1]==gameState[2])
      {
        setState(() {

          this.message = '${this.gameState[0]} Wins';
          dialog(message);
          resetGame();

        });

      }
    else if((gameState[3]!='empty')&& gameState[3]==gameState[4] && gameState[4]==gameState[5])
    {
      setState(() {

        this.message = '${this.gameState[3]} Wins';
        dialog(message);
        resetGame();

      });

    }
   else if((gameState[6]!='empty')&& gameState[6]==gameState[7] && gameState[7]==gameState[8])
    {
      setState(() {

        this.message = '${this.gameState[6]} Wins';
        dialog(message);
        resetGame();

      });

    }///////////////three rows
    else if((gameState[0]!='empty')&& gameState[0]==gameState[3] && gameState[3]==gameState[6])
    {
      setState(() {

        this.message = '${this.gameState[0]} Wins';
        dialog(message);
        resetGame();

      });
    }
    else if((gameState[1]!='empty')&& gameState[1]==gameState[4] && gameState[4]==gameState[7])
    {
      setState(() {

        this.message = '${this.gameState[1]} Wins';
        dialog(message);
        resetGame();

      });

    }
    else if((gameState[2]!='empty')&& gameState[2]==gameState[5] && gameState[5]==gameState[8])
    {
      setState(() {

        this.message = '${this.gameState[2]} Wins';
        dialog(message);
        resetGame();

      });

    }
    else if((gameState[0]!='empty')&& gameState[0]==gameState[4] && gameState[4]==gameState[8])
    {
      setState(() {

        this.message = '${this.gameState[0]} Wins';
        dialog(message);
        resetGame();

      });

    }
    else if((gameState[2]!='empty')&& gameState[2]==gameState[4] && gameState[4]==gameState[6])
    {
      setState(() {

        this.message = '${this.gameState[2]} Wins';
        dialog(message);
        resetGame();

      });

    }else if(!gameState.contains('empty'))
      {
        setState(() {
          this.message = "It's a draw";
          dialog(message);
          resetGame();

        });


      }






  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBD28B),
      appBar: AppBar(
        backgroundColor: Color(0xffF5C469),
        title: Text(' Tic-Tac-Toe',
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 30,
          color: Colors.black45,

        ),
        ),

        
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                
              ),
              itemCount: 9,
              itemBuilder: (context,i)=>SizedBox(
                height:100.0,
                width: 100.0,
                child: MaterialButton(
                  onPressed:(){
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              )
                
            ),
          ),
          MaterialButton(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Color(0xffF9DDA4),
            minWidth: 300.0,
            height: 50.0,
            elevation: 5.0,

            onPressed:(){
              this.resetGame();
            },
            child: Text(
              'Reset Game',

              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontFamily: 'monospace',

              ),
            ),
          ),

SizedBox(height: 40,)
        ],
      ),
    );
  }


}
