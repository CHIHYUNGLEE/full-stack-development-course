package world;
import world.asia.Japan;
import world.asia.Korea;
import world.europe.France;
//위 2개의 구문을  import world.asia.*;로 사용가능하다.
//그러나 위처럼 *로 쓰는건 권장하지는 않는다.
public class CountryManager {

	public static void main(String[] args) {
		
		//world.asia.Korea k;
		//k = new world.asia.Korea();
		//이런식으로 매번 패키지이름 적어줘야해서 번거로움.
		
		Korea k;
		k = new Korea();
		
		Japan j = new Japan();
		France f = new France();
		
		k.capital = "평양";
		//k.language = "중국어";
		//k.population = -1;
		k.setPopulation(-1);
		k.setPopulation(5000);
	}

}
