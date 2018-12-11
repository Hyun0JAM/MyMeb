package singletonpattern;

public class Main {

	public void amethod(){
        SingletonCounter aobj = SingletonCounter.getInstance();
        // 객체 생성
        
        System.out.println("amethod에서 카운터 호출 cnt : " + aobj.getNextInt() );
    }
    
    public void bmethod(){
        SingletonCounter bobj = SingletonCounter.getInstance();
        // 객체 생성
        
        System.out.println("bmethod에서 카운터 호출 cnt : " + bobj.getNextInt() );
    }
    
    public void cmethod(){
    	NoSingletonCounter cobj = new NoSingletonCounter();
        // 객체 생성
        
        System.out.println("cmethod에서 카운터 호출 cnt : " + cobj.getNextInt() );
    }
    
    public void dmethod(){
    	NoSingletonCounter dobj = new NoSingletonCounter();
        // 객체 생성
        
        System.out.println("dmethod에서 카운터 호출 cnt : " + dobj.getNextInt() );
    }
	
    
	public static void main(String[] args) {
		Main test = new Main();
		test.amethod();
		test.bmethod();
		test.cmethod();
		test.dmethod();
		/*
		  amethod에서 카운터 호출 cnt : 1
		  bmethod에서 카운터 호출 cnt : 2
		  cmethod에서 카운터 호출 cnt : 1
		  dmethod에서 카운터 호출 cnt : 1
		*/
	}// end of main()-----------------------------

}
