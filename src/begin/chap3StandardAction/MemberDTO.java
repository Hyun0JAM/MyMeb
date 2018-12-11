package begin.chap3StandardAction;

import java.util.Calendar;

public class MemberDTO {
	
	private String name; // ���� �⺻���� null
	private char gender; // ���� �⺻���� ' ' ���ڴ� M, ���ڴ� F
	private int age; // ���� �⺻���� 0
	
	private String jubun;
	
	{// �ν��Ͻ� �ʱ�ȭ ��
		name="�̼���";
		gender='M';
		age=25;
	}
	public MemberDTO() {
		
	} //�⺻ ������
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getJubun() {
		return jubun;
	}

	public void setJubun(String jubun) {
		this.jubun = jubun;
	}
	// �޼ҵ� ���鶧 �տ� get�� ��ߵȴ�.
	// <jsp:useBean id="memberdto" class="begin.chap3StandardAction.MamberDTO"/>
	// ���� �����
	public String getViewGender() {
		
		String result = "";
		
		switch (gender) {
		case 'M':
		case 'm':
			result="����";
			break;
			
		case 'F':
		case 'f':
			result="����";
			break;

		default:
			break;
		}
		
		return result;
	}//end of viewGender()---
	public String getShowGender() {
		String genderflag = jubun.substring(6,7);
		String result = "";
		switch (genderflag) {
		case "1":
		case "3":
			result="����";
			break;
		case "2":
		case "4":
			result="����";
			break;
		default: break;
		}
		return result;
	}
	public int getShowAge() {// ����⵵ - �¾�⵵ + 1
		Calendar currentdate = Calendar.getInstance(); // ���糯¥�� �ð��� ���´�.
		int year = currentdate.get(Calendar.YEAR);
		int birthYear = Integer.parseInt(jubun.substring(0,2));
		if("1".equals(jubun.substring(6,7))||"2".equals(jubun.substring(6,7))) birthYear+=1900;
		else birthYear+=2000;
		return year-birthYear+1;
	}

}
