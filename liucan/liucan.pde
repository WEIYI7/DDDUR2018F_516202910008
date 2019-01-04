Table mytable;
PFont myFont;

int[] tol = new int[30];
int count = 0;

void setup(){
    int screen_width = 1600;
    int screen_height = 800;
    myFont = createFont("微软雅黑",10);
    textFont(myFont);
    int left_margin = 100;
    int bottom_margin = 80;
    int right_margin = 40;
    int top_margin = 40;
    int y_num_ticks = 4;
    int tick_padding = 5;
 
    int chart_x = left_margin;
    int chart_y = screen_height-bottom_margin;
    int chart_width = screen_width - left_margin - right_margin;
    int chart_height = screen_height - top_margin - bottom_margin;
 
    size(1600, 800);
    background(0);
    
    textSize(36);
    text("六餐各窗口营业额统计柱状图",600,50);
    
    loadData();
    println(count);
    
    int[] numbers = new int[count+1];
    
    for(int i=0; i<count+1 ; i++){
      numbers[i] = tol[i]/100000;
    }
    println(numbers[2]);
    
    float w = chart_width/numbers.length;
    int max_number = max(numbers);
    max_number = max(max_number,10);
    float h = chart_height/max_number;
 
    stroke(100,100,100);
    line(chart_x, chart_y, chart_x+chart_width, chart_y);
    line(chart_x, chart_y, chart_x, chart_y-chart_height);
 
    int y_tick_h = chart_height/(y_num_ticks-1);
    int y_tick_val = max_number / (y_num_ticks-1);
    
    textAlign(RIGHT, CENTER);
    textSize(10);
    text(3*y_tick_val+"（10万元）", chart_x-tick_padding+50, chart_y-3*y_tick_h);
    for(int i=0;i<y_num_ticks;i++){
        line(chart_x, chart_y-i*y_tick_h, chart_x+chart_width, chart_y-i*y_tick_h);
        text(i*y_tick_val, chart_x-tick_padding, chart_y-i*y_tick_h);
        // y axis text
    }
 
    fill(255,255,255);
    textAlign(CENTER, TOP);
    text("六餐东一楼餐厅", chart_x+0*w+w/2, chart_y+tick_padding);
    text("六餐面馆", chart_x+1*w+w/2, chart_y+tick_padding);
    text("六餐伊诺咖啡", chart_x+2*w+w/2, chart_y+tick_padding);//x axis text 
    for(int i=0;i<numbers.length;i++){
        rect(chart_x+i*w, chart_y, w, -h*numbers[i]);
        
    }
}

void loadData(){
  mytable=loadTable("result.csv");
  for (int i=1; i<mytable.getRowCount(); i++) {
    if(mytable.getInt(i,0)==6){
      tol[count] = mytable.getInt(i,2);
      count++;
    }
  }

}
