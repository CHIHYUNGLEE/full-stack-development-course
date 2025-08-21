package Inheritance;

public class Car {
	private int speed;
	
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	public int getSpeed() {
		return speed;
	}
	public void speedUp() {
		speed++;
	}
	public void speedDown() {
		if(speed > 0) {
			speed--;
		}
	}
}
