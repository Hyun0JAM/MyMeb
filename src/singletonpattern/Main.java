package singletonpattern;

public class Main {

	public void amethod(){
        SingletonCounter aobj = SingletonCounter.getInstance();
        // ��ü ����
        
        System.out.println("amethod���� ī���� ȣ�� cnt : " + aobj.getNextInt() );
    }
    
    public void bmethod(){
        SingletonCounter bobj = SingletonCounter.getInstance();
        // ��ü ����
        
        System.out.println("bmethod���� ī���� ȣ�� cnt : " + bobj.getNextInt() );
    }
    
    public void cmethod(){
    	NoSingletonCounter cobj = new NoSingletonCounter();
        // ��ü ����
        
        System.out.println("cmethod���� ī���� ȣ�� cnt : " + cobj.getNextInt() );
    }
    
    public void dmethod(){
    	NoSingletonCounter dobj = new NoSingletonCounter();
        // ��ü ����
        
        System.out.println("dmethod���� ī���� ȣ�� cnt : " + dobj.getNextInt() );
    }
	
    
	public static void main(String[] args) {
		Main test = new Main();
		test.amethod();
		test.bmethod();
		test.cmethod();
		test.dmethod();
		/*
		  amethod���� ī���� ȣ�� cnt : 1
		  bmethod���� ī���� ȣ�� cnt : 2
		  cmethod���� ī���� ȣ�� cnt : 1
		  dmethod���� ī���� ȣ�� cnt : 1
		*/
	}// end of main()-----------------------------

}
