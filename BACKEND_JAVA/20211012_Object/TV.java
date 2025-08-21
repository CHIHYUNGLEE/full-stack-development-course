
public class TV {
	boolean power;
	int channel;
	int volume;
	
	boolean ispower() {
		return power;
	}
	void powerOn() {
		power = true;
	}	
	void powerOff() {
		power = false;
	}
	void setChannel(int ch) {
		channel = ch;
	}
	void volumeUp() {
		volume++;
	}	
	void printinfo() {
		System.out.println("전원은 "+power);
		System.out.println("볼륨은 "+volume);
		System.out.println("채널은 "+channel);
	}
}
