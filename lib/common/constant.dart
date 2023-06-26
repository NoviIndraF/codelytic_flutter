class Constant {
  static const baseUrl = "http://10.0.2.2:8000/api/";
  // static final baseUrl = "http://10.0.2.2:8000/api/";
  // SharedPreferences
  static final token = "token";
  static final codeRoom = "code_room";
  static final roomId = "room_id";

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

}