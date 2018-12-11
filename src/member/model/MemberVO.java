package member.model;

import java.util.Calendar;

/*
  VO(Value Object) �삉�뒗  DTO(Data Transfer Object) �깮�꽦�븯湲� 
*/

public class MemberVO {

	private int idx;            // �쉶�썝踰덊샇(�떆���뒪濡� �뜲�씠�꽣媛� �뱾�뼱�삩�떎)
	private String userid;      // �쉶�썝�븘�씠�뵒
	private String name;        // �쉶�썝紐�
	private String pwd;         // 鍮꾨�踰덊샇
	private String email;       // �씠硫붿씪
	private String hp1;         // �쑕���룿 踰덊샇
	private String hp2;   
	private String hp3;   
	private String post1;       // �슦�렪踰덊샇
	private String post2;  
	private String addr1;       // 二쇱냼
	private String addr2;       // �긽�꽭二쇱냼
	
	private String gender;      // �꽦蹂�   (�궓�옄 : 1 / �뿬�옄 : 2)
	private String birthyyyy;   // �깮�뀈
	private String birthmm;     // �깮�썡
	private String birthdd;     // �깮�씪
	
	private int coin;           // 肄붿씤�븸
	private int point;          // �룷�씤�듃
	
	private String registerday; // 媛��엯�씪�옄
	private int status;         // �쉶�썝�깉�눜�쑀臾�   1:�궗�슜媛��뒫(媛��엯以�) / 0:�궗�슜遺덈뒫(�깉�눜) 
	
	public MemberVO() { }
	
	public MemberVO(int idx, String userid, String name, String pwd, String email, String hp1, String hp2, String hp3,
			String post1, String post2, String addr1, String addr2, 
			String gender, String birthyyyy, String birthmm, String birthdd,
			int coin, int point,
			String registerday, int status) {
		this.idx = idx;
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		
		this.gender = gender;
		this.birthyyyy = birthyyyy;
		this.birthmm = birthmm;
		this.birthdd = birthdd;
		this.coin = coin;
		this.point = point;
				
		this.registerday = registerday;
		this.status = status;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}

	public String getPost1() {
		return post1;
	}

	public void setPost1(String post1) {
		this.post1 = post1;
	}

	public String getPost2() {
		return post2;
	}

	public void setPost2(String post2) {
		this.post2 = post2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getBirthyyyy() {
		return birthyyyy;
	}

	public void setBirthyyyy(String birthyyyy) {
		this.birthyyyy = birthyyyy;
	}
	
	public String getBirthmm() {
		return birthmm;
	}

	public void setBirthmm(String birthmm) {
		this.birthmm = birthmm;
	}
	
	public String getBirthdd() {
		return birthdd;
	}

	public void setBirthdd(String birthdd) {
		this.birthdd = birthdd;
	}
	
	public int getCoin() {
		return coin;
	}

	public void setCoin(int coin) {
		this.coin = coin;
	}
	
	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getAllHp() {
		return hp1+"-"+hp2+"-"+hp3;
	}
	
	public String getAllPost() {
		return post1+"-"+post2;
	}
	
	public String getAllAddr() {
		return addr1+" "+addr2;
	}
	
	
	public String getShowGender() {
		if("1".equals(gender))
			return "남";
		else 
			return "여";
	}
	
	
	public int getShowAge() {

		Calendar currentdate = Calendar.getInstance(); // �쁽�옱�궇吏쒖� �떆媛꾩쓣 �뼸�뼱�삩�떎.
		int year = currentdate.get(Calendar.YEAR);
		
		return  year - Integer.parseInt(birthyyyy) + 1;
	}
	
}
