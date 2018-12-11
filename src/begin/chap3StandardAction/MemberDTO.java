package begin.chap3StandardAction;

import java.util.Calendar;

public class MemberDTO {
	
	private String name; // 성명 기본값은 null
	private char gender; // 성별 기본값은 ' ' 남자는 M, 여자는 F
	private int age; // 나이 기본값은 0
	
	private String jubun;
	
	{// 인스턴스 초기화 블럭
		name="이순신";
		gender='M';
		age=25;
	}
	public MemberDTO() {
		
	} //기본 생성자
	
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
	// 메소드 만들때 앞에 get을 써야된다.
	// <jsp:useBean id="memberdto" class="begin.chap3StandardAction.MamberDTO"/>
	// 에서 쓸라고
	public String getViewGender() {
		
		String result = "";
		
		switch (gender) {
		case 'M':
		case 'm':
			result="남자";
			break;
			
		case 'F':
		case 'f':
			result="여자";
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
			result="남자";
			break;
		case "2":
		case "4":
			result="여자";
			break;
		default: break;
		}
		return result;
	}
	public int getShowAge() {// 현재년도 - 태어난년도 + 1
		Calendar currentdate = Calendar.getInstance(); // 현재날짜와 시간을 얻어온다.
		int year = currentdate.get(Calendar.YEAR);
		int birthYear = Integer.parseInt(jubun.substring(0,2));
		if("1".equals(jubun.substring(6,7))||"2".equals(jubun.substring(6,7))) birthYear+=1900;
		else birthYear+=2000;
		return year-birthYear+1;
	}

}
