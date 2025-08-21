
public class WatchTV {

	public static void main(String[] args) {
		TV tv;
		tv = new TV();
		tv.power = true; //전원을 켠다.
		tv.channel = 7; //채널 7번으로 바꾼다.
		tv.volume = 10;//볼륨을 10으로 설정한다.
		System.out.println(tv.power);
		System.out.println(tv.channel);
		System.out.println(tv.volume);
	
		
		
		boolean powerFlag = tv.ispower();
		if(!powerFlag) {
			tv.powerOn();//전원을 켠다.
			tv.setChannel(7);//채널을 7로 설정한다.
			for(int i=0 ; i<10 ; i++) {
			tv.volumeUp();
			}
			//System.out.println("볼륨은 "+tv.volume);
			//System.out.println("채널은 "+tv.channel);
			tv.printinfo();
		}else {
			tv.powerOff();
		}
		
		
		
		
	}

}
