class Constant {
  static const baseUrl = "http://10.0.2.2:8000/api/";
  // static final baseUrl = "http://10.0.2.2:8000/api/";
  // SharedPreferences
  static const token = "token";
  static const codeRoom = "code_room";
  static const roomId = "room_id";
  static const userId = "user_id";


  static const DISCUSSION = 1;
  static const CHATGROUP = 2;

  static String sToken="";
  static void setToken (String rtoken){
    sToken = rtoken;
  }
  static String getToken (){
    return sToken;
  }


  static String sCode="";
  static void setCode (String code){
    sCode = code;
  }
  static String getCode (){
    return sCode;
  }

  static int sRoomId=0;
  static void setRoomId (int id){
    sRoomId = id;
  }
  static int getRoomId (){
    return sRoomId;
  }

  static int iUserId=0;
  static void setUserId (int id){
    iUserId = id;
  }
  static int getUserId (){
    return iUserId;
  }

}