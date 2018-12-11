package singletonpattern;

public class NoSingletonCounter {

	private int cnt = 0;    
	// 이것은 테스트를 위해서 만든 인스턴스 멤버변수이다.
	    
    public int getNextInt(){
        return ++cnt;
    }	
	
}
