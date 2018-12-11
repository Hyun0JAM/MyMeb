package singletonpattern;

public class SingletonCounter {
    
	private int cnt = 0;    
	// �̰��� �׽�Ʈ�� ���ؼ� ���� �ν��Ͻ� ��������̴�.
	
	// **** singleton ���Ͽ��� �߿��� ���� ���� �� �����̴�.**** //
	// ù��°, private ��� ������ �ڱ� �ڽ��� Ŭ������ �ν��Ͻ��� �������� �Ѵ�.
	//       private �̹Ƿ� �ܺ� Ŭ���������� ���������� ������ �Ұ��ϴ�.
	//       ���� static ��������� �����Ͽ� SingletonCounter Ŭ������ ����Ҷ� ��ü������ �� 1���� �����ȴ�.
	private static SingletonCounter singleton = null;
	
	static {
		singleton = new SingletonCounter();
	}
	
	
	// �ι�°, �����ڿ� ���������ڷ� private �� �����Ͽ�, �ܺο��� ����� �ν��Ͻ��� �������� ���ϰ� �Ѵ�.
	private SingletonCounter() { }
    
    
	// ����°, static �� getInstance() �޼ҵ带 ���ؼ��� �ܺο��� �ش� Ŭ������ ��ü�� ������ �� �ֵ��� �Ѵ�.
    public static SingletonCounter getInstance() {
        return singleton;
    }
    
    
    public int getNextInt(){
        return ++cnt;
    }
}
