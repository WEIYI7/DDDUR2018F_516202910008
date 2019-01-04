PFont myFont;
Table mytable;
PImage bg;
int sys30=0;//一餐
int Yican_money =0;
int sys34=0;//二餐
int Ercan_money =0;
int sys36=0;//三餐
int Sancan_money =0;
int sys38=0;//四餐
int Sican_money =0;
int sys33=0;//五餐
int Wucan_money =0;
int sys37=0;//六餐
int Liucan_money =0;


void setup() {
  size(1920, 1080);
  bg = loadImage("62-1.jpg");
  background(bg);
  myFont = createFont("微软雅黑",22);
  textFont(myFont);
  loadData();
  println(sys30);
  println(Yican_money);
  println(sys34);
  println(Ercan_money);
  println(sys36);
  println(Sancan_money);
  println(sys38);
  println(Sican_money);
  println(sys33);
  println(Wucan_money);
  println(sys37);
  println(Liucan_money);
  drawPoints(430,535,628,740,sys30);//一餐的范围
  drawPoints(785,880,730,790,sys34);//二餐的范围
  drawPoints(810,880,440,510,sys36);//三餐的范围
  drawPoints(217,267,285,350,sys38);//四餐的范围
  drawPoints(1190,1265,820,860,sys33);//五餐的范围
  drawPoints(1600,1660,450,470,sys37);//六餐的范围

}

void draw(){
  if(mouseX>430 && mouseX<535 && mouseY>628 && mouseY<740){
    fill(0);
    textSize(22);
    text("共有"+sys30+"条消费记录",480,688);
    text("营业额为" + Yican_money/10000 +"万元",480,718);
  }
  
  else if(mouseX>785 && mouseX<880 && mouseY>730 && mouseY<790){
    fill(0);
    textSize(22);
    text("共有"+sys34+"条消费记录",830,770);
    text("营业额为" + Ercan_money/10000 +"万元",830,800);
  }
  
  else if(mouseX>810 && mouseX<880 && mouseY>440 && mouseY<510){
    fill(0);
    textSize(22);
    text("共有"+sys36+"条消费记录",845,475);
    text("营业额为" + Sancan_money/10000 +"万元",845,505);
  }
  else if(mouseX>217 && mouseX<267 && mouseY>285 && mouseY<350){
    fill(0);
    textSize(22);
    text("共有"+sys38+"条消费记录",242,315);
    text("营业额为" + Sican_money/10000 +"万元",242,345);
  }
  
  else if(mouseX>1190 && mouseX<1265 && mouseY>820 && mouseY<860){
    fill(0);
    textSize(22);
    text("共有"+sys33+"条消费记录",1230,840);
    text("营业额为" + Wucan_money/10000 +"万元",1230,870);
  }
  
  else if(mouseX>1600 && mouseX<1660 && mouseY>450 && mouseY<470){
    fill(0);
    textSize(22);
    text("共有"+sys37+"条消费记录",1630,460);
    text("营业额为" + Liucan_money/10000 +"万元",1630,490);
  }
  
}

void drawPoints(int x1, int x2, int y1, int y2, int Num){
  int point_number = floor(Num/1000);
  for(int i=0; i<point_number; i++){
   float x = random(x1,x2);
   float y = random(y1,y2);
   fill(255,0,0);
   stroke(255,0,0);
   strokeWeight(5);
   point(x,y);
  }
 }

void loadData() {
  mytable=loadTable("trade.csv");
  for (int i=0; i<mytable.getRowCount(); i++) {
    if (mytable.getInt(i, 2)==30||mytable.getInt(i, 2)==99) {
      sys30++;
      Yican_money = Yican_money+mytable.getInt(i,4);
    }
    
    else if (mytable.getInt(i, 2)==34||mytable.getInt(i, 2)==269) {
      sys34++;
      Ercan_money = Ercan_money+mytable.getInt(i,4);
    }
    
    else if (mytable.getInt(i, 2)==36||mytable.getInt(i, 2)==268) {
      sys36++;
      Sancan_money = Sancan_money+mytable.getInt(i,4);
    }
    
    else if (mytable.getInt(i, 2)==38||mytable.getInt(i, 2)==267) {
      sys38++;
      Sican_money = Sican_money+mytable.getInt(i,4);
    }
    
    else if (mytable.getInt(i, 2)==33||mytable.getInt(i, 2)==256) {
      sys33++;
      Wucan_money = Wucan_money+mytable.getInt(i,4);
    }
    
    else if (mytable.getInt(i, 2)==37||mytable.getInt(i, 2)==266) {
      sys37++;
      Liucan_money = Liucan_money+mytable.getInt(i,4);
    }
    }

}

