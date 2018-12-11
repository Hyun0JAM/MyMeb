package singletonpattern;

public class SingletonCounter {
    
	private int cnt = 0;    
	// 이것은 테스트를 위해서 만든 인스턴스 멤버변수이다.
	
	// **** singleton 패턴에서 중요한 것은 다음 세 가지이다.**** //
	// 첫번째, private 멤버 변수로 자기 자신의 클래스의 인스턴스를 가지도록 한다.
	//       private 이므로 외부 클래스에서는 직접적으로 접근이 불가하다.
	//       또한 static 멤버변수로 지정하여 SingletonCounter 클래스를 사용할때 객체생성은 딱 1번만 생성된다.
	private static SingletonCounter singleton = null;
	
	static {
		singleton = new SingletonCounter();
	}
	
	
	// 두번째, 생성자에 접근제한자로 private 를 지정하여, 외부에서 절대로 인스턴스를 생성하지 못하게 한다.
	private SingletonCounter() { }
    
    
	// 세번째, static 한 getInstance() 메소드를 통해서만 외부에서 해당 클래스의 객체를 가져갈 수 있도록 한다.
    public static SingletonCounter getInstance() {
        return singleton;
    }
    
    
    public int getNextInt(){
        return ++cnt;
    }
}
