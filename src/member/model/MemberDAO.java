package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import jdbc.util.*;

public class MemberDAO implements InterMemberDAO {

	Connection conn = null;
	Connection conn2 = null;  // 싱글톤패턴 테스트용
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	AES256 aes = null;
	
	// *** 생성자 *** //
	public MemberDAO() {
		
		try {
			conn = DBConnection.getConn();
			
			conn2 = DBConnection.getConn(); // 싱글톤패턴 테스트용
			
			String key = MyKey.key; // 암호화, 복호화 키 
			aes = new AES256(key);
		} catch (UnsupportedEncodingException e) {
			System.out.println("key 값은 17글자 이상이어야 합니다.");
			e.printStackTrace();
		}
		
	}// end of public MemberDAO()----------------
	
	
	// *** DB와 관련된 rs, pstmt 자원을 반납하는 메소드 생성하기 *** //
	@Override
	public void close() {
		try {
			if(rs != null) 
			   rs.close();
			
			if(pstmt != null) 
			   pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}// end of close()---------------------------
	
	
	// **** DB와 관련된 conn 을 반납하는 메소드 생성하기 ****
	@Override
	public void connClose(){
		try {
			if(conn != null) 
			   conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end of connClose()-----------------------	


	// **** 회원가입(insert)하기  메소드 생성하기 **** //
	@Override
	public int registerMember(MemberVO membervo) 
		throws SQLException {
		
		int result = 0;
		
		try {
			String sql = " insert into jsp_member(IDX, USERID, NAME, PWD, EMAIL, HP1, HP2, HP3, POST1, POST2, ADDR1, ADDR2, GENDER, BIRTHDAY, COIN, POINT, REGISTERDAY, STATUS) "
					   + " values(seq_jsp_member.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default, default) ";  
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, membervo.getUserid());
			pstmt.setString(2, membervo.getName());
			pstmt.setString(3, SHA256.encrypt(membervo.getPwd()));  // 암호를 SHA256 알고리즘으로 단방향 암호화 시키기 
			pstmt.setString(4, aes.encrypt(membervo.getEmail())); // 이메일을 AES256 알고리즘으로 양방향 암호화 시키기 
			pstmt.setString(5, membervo.getHp1());
			pstmt.setString(6, aes.encrypt(membervo.getHp2())); // 휴대폰번호를 AES256 알고리즘으로 양방향 암호화 시키기 
			pstmt.setString(7, aes.encrypt(membervo.getHp3())); // 휴대폰번호를 AES256 알고리즘으로 양방향 암호화 시키기 
			pstmt.setString(8, membervo.getPost1());
			pstmt.setString(9, membervo.getPost2());
			pstmt.setString(10, membervo.getAddr1());
			pstmt.setString(11, membervo.getAddr2());
			pstmt.setString(12, membervo.getGender());
			pstmt.setString(13, membervo.getBirthyyyy()+membervo.getBirthmm()+membervo.getBirthdd() );
			
			result = pstmt.executeUpdate();
		
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}// end of registerMember(MemberVO membervo)--------


	@Override
	public boolean idDuplicateCheck(String userid) throws SQLException {
		try {
			String sql = " select count(*) as cnt "
					   + " from jsp_member where userid = ? ";  
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt =rs.getInt("cnt");
			if(cnt==1) return false;// Id중복인경우
			else return true; //중복이 아닌경우
		} finally {
			close();
		}
	}

	@Override
	public List<MemberVO> getAllMember() throws SQLException {
		List<MemberVO> memberList=null;
		try {
			String sql = "select IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT"+
						 " ,to_char(REGISTERDAY,'yyyy-mm-dd') as REGISTERDAY,STATUS "+
						 " from jsp_member "+
						 " where status=1 "+
						 " order by idx desc "; 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int cnt=0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) memberList = new ArrayList<MemberVO>();
				int idx = rs.getInt("IDX");
				String userid = rs.getString("USERID");
				String name = rs.getString("NAME");
				String pwd = rs.getString("PWD");
				String email = aes.decrypt(rs.getString("EMAIL")); // AES256 복호화
				String hp1 = rs.getString("HP1");
				String hp2 = aes.decrypt(rs.getString("HP2")); // AES256 복호화
				String hp3 = aes.decrypt(rs.getString("HP3")); // AES256 복호화
				String post1 = rs.getString("POST1");
				String post2 = rs.getString("POST2");
				String addr1 = rs.getString("ADDR1");
				String addr2 = rs.getString("ADDR2");
				String gender= rs.getString("GENDER");
				String birthday = rs.getString("BIRTHDAY");
				int coin = rs.getInt("COIN");
				int point = rs.getInt("POINT");
				String registerday = rs.getString("REGISTERDAY");
				int status = rs.getInt("STATUS");
				MemberVO member = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, gender, birthday.substring(0, 4), birthday.substring(4,7), birthday.substring(6), coin, point, registerday, status);
				memberList.add(member);
			}
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return memberList;
	}
	
	@Override
	public List<MemberVO> getAllMember(int sizePerPage, int currentShowPageNo) throws SQLException {
		List<MemberVO> memberList=null;
		try {
			String sql = " select RNO,IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS "+
						 " from( "+
						 "    select rownum as RNO,IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS "+
						 "    from( "+
						 "        select IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT "+
						 "              ,to_char(REGISTERDAY,'yyyy-mm-dd') as REGISTERDAY,STATUS  "+
						 "        from jsp_member "+
						 "        where status=1 "+
						 "        order by idx desc "+
						 "    )V "+
						 " )T "+
						 " where T.rno between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (currentShowPageNo*sizePerPage)-(sizePerPage-1));
			pstmt.setInt(2, currentShowPageNo*sizePerPage);
			rs = pstmt.executeQuery();
			int cnt=0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) memberList = new ArrayList<MemberVO>();
				int idx = rs.getInt("IDX");
				String userid = rs.getString("USERID");
				String name = rs.getString("NAME");
				String pwd = rs.getString("PWD");
				String email = aes.decrypt(rs.getString("EMAIL")); // AES256 복호화
				String hp1 = rs.getString("HP1");
				String hp2 = aes.decrypt(rs.getString("HP2")); // AES256 복호화
				String hp3 = aes.decrypt(rs.getString("HP3")); // AES256 복호화
				String post1 = rs.getString("POST1");
				String post2 = rs.getString("POST2");
				String addr1 = rs.getString("ADDR1");
				String addr2 = rs.getString("ADDR2");
				String gender= rs.getString("GENDER");
				String birthday = rs.getString("BIRTHDAY");
				int coin = rs.getInt("COIN");
				int point = rs.getInt("POINT");
				String registerday = rs.getString("REGISTERDAY");
				int status = rs.getInt("STATUS");
				MemberVO member = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, gender, birthday.substring(0, 4), birthday.substring(4,7), birthday.substring(6), coin, point, registerday, status);
				memberList.add(member);
			}
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return memberList;
	}
	
	@Override
	public List<MemberVO> getAllMember(int sizePerPage, int currentShowPageNo, int period) throws SQLException {
		List<MemberVO> memberList=null;
		try {
			String sql = " select RNO,IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS "+
						 " from( "+
						 "    select rownum as RNO,IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS "+
						 "    from( "+
						 "        select IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT "+
						 "              ,to_char(REGISTERDAY,'yyyy-mm-dd') as REGISTERDAY,STATUS  "+
						 "        from jsp_member "+
						 "        where status=1 ";
			if(period == -1) {
				sql += "        order by idx desc "+
						 "    )V "+
						 " )T "+
						 " where T.rno between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, (currentShowPageNo*sizePerPage)-(sizePerPage-1));
				pstmt.setInt(2, currentShowPageNo*sizePerPage);
			}
			else {
				sql +=   " 		  and to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - "+ 
						 " 		  to_date(to_char(registerday, 'yyyy-mm-dd'), 'yyyy-mm-dd') <= ? "+
						 "        order by idx desc "+
						 "    )V "+
						 " )T "+
						 " where T.rno between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, period);
				pstmt.setInt(2, (currentShowPageNo*sizePerPage)-(sizePerPage-1));
				pstmt.setInt(3, currentShowPageNo*sizePerPage);
			}
			rs = pstmt.executeQuery();
			int cnt=0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) memberList = new ArrayList<MemberVO>();
				int idx = rs.getInt("IDX");
				String userid = rs.getString("USERID");
				String name = rs.getString("NAME");
				String pwd = rs.getString("PWD");
				String email = aes.decrypt(rs.getString("EMAIL")); // AES256 복호화
				String hp1 = rs.getString("HP1");
				String hp2 = aes.decrypt(rs.getString("HP2")); // AES256 복호화
				String hp3 = aes.decrypt(rs.getString("HP3")); // AES256 복호화
				String post1 = rs.getString("POST1");
				String post2 = rs.getString("POST2");
				String addr1 = rs.getString("ADDR1");
				String addr2 = rs.getString("ADDR2");
				String gender= rs.getString("GENDER");
				String birthday = rs.getString("BIRTHDAY");
				int coin = rs.getInt("COIN");
				int point = rs.getInt("POINT");
				String registerday = rs.getString("REGISTERDAY");
				int status = rs.getInt("STATUS");
				MemberVO member = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, gender, birthday.substring(0, 4), birthday.substring(4,7), birthday.substring(6), coin, point, registerday, status);
				memberList.add(member);
			}
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return memberList;
	}
	@Override
	public int getTotalCount() throws SQLException {
		int count = 0;
		try {
			String sql = " select count(*) as CNT from jsp_member where status = 1 ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} finally {
			close();
		}
		return count;
	}

	@Override
	public int getTotalCount(int period) throws SQLException {
		int count = 0;
		try {
			String sql = "select count(*) as CNT "+
						 " from jsp_member "+
						 " where status=1 ";
			if(period == -1) pstmt = conn.prepareStatement(sql);
			else {
				sql += " and to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - "+ 
					   " to_date(to_char(registerday, 'yyyy-mm-dd'), 'yyyy-mm-dd') <= ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, period);
			}
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} finally {
			close();
		}
		return count;
	}


	@Override
	public int getTotalCount(String searchType, String searchWord, int period) throws SQLException {
		int count = 0;
		try {
			String sql = "select count(*) as CNT "+
						 " from jsp_member "+
						 " where status=1 ";
			if("email".equals(searchType)) searchWord = aes.encrypt(searchWord);
			if(period == -1) {
				sql += " and "+searchType+" like '%'|| ? ||'%' "; // 컬럼값에는 물음표가 올 수 없다.
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
			}
			else {
				sql += " and "+searchType+" like '%'|| ? ||'%' "+ // 컬럼값에는 물음표가 올 수 없다.
					   " and to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - "+ 
					   " to_date(to_char(registerday, 'yyyy-mm-dd'), 'yyyy-mm-dd') <= ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, period);
			}
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return count;
	}


	@Override
	public List<MemberVO> getAllMember(int sizePerPage, int currentShowPageNo, int period, String searchType,
			String searchWord) throws SQLException {
		List<MemberVO> memberList=null;
		try {
			String sql = " select RNO,IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS "+
						 " from( "+
						 "    select rownum as RNO,IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS "+
						 "    from( "+
						 "        select IDX,USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT "+
						 "              ,to_char(REGISTERDAY,'yyyy-mm-dd') as REGISTERDAY,STATUS  "+
						 "        from jsp_member "+
						 "        where status=1 ";
			if("email".equals(searchType)) searchWord = aes.encrypt(searchWord);
			if(period == -1) {
				sql +=   " and "+searchType+" like '%'|| ? ||'%' "+ // 컬럼값에는 물음표가 올 수 없다.
						 "        order by idx desc "+
						 "    )V "+
						 " )T "+
						 " where T.rno between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, (currentShowPageNo*sizePerPage)-(sizePerPage-1));
				pstmt.setInt(3, currentShowPageNo*sizePerPage);
			}
			else {
				sql +=   " and "+searchType+" like '%'|| ? ||'%' "+ // 컬럼값에는 물음표가 올 수 없다.
						 " 		  and to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - "+ 
						 " 		  to_date(to_char(registerday, 'yyyy-mm-dd'), 'yyyy-mm-dd') <= ? "+
						 "        order by idx desc "+
						 "    )V "+
						 " )T "+
						 " where T.rno between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, period);
				pstmt.setInt(3, (currentShowPageNo*sizePerPage)-(sizePerPage-1));
				pstmt.setInt(4, currentShowPageNo*sizePerPage);
			}
			rs = pstmt.executeQuery();
			int cnt=0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) memberList = new ArrayList<MemberVO>();
				int idx = rs.getInt("IDX");
				String userid = rs.getString("USERID");
				String name = rs.getString("NAME");
				String pwd = rs.getString("PWD");
				String email = aes.decrypt(rs.getString("EMAIL")); // AES256 복호화
				String hp1 = rs.getString("HP1");
				String hp2 = aes.decrypt(rs.getString("HP2")); // AES256 복호화
				String hp3 = aes.decrypt(rs.getString("HP3")); // AES256 복호화
				String post1 = rs.getString("POST1");
				String post2 = rs.getString("POST2");
				String addr1 = rs.getString("ADDR1");
				String addr2 = rs.getString("ADDR2");
				String gender= rs.getString("GENDER");
				String birthday = rs.getString("BIRTHDAY");
				int coin = rs.getInt("COIN");
				int point = rs.getInt("POINT");
				String registerday = rs.getString("REGISTERDAY");
				int status = rs.getInt("STATUS");
				MemberVO member = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, gender, birthday.substring(0, 4), birthday.substring(4,7), birthday.substring(6), coin, point, registerday, status);
				memberList.add(member);
			}
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberList;
	}


	@Override
	public MemberVO getByIdx(int idx) throws SQLException {
		MemberVO member=null;
		try {
			String sql = " select USERID,NAME,PWD,EMAIL,HP1,HP2,HP3,POST1,POST2,ADDR1,ADDR2,GENDER,BIRTHDAY,COIN,POINT,REGISTERDAY,STATUS "+
						 " from jsp_member "+
						 " where idx = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String userid = rs.getString("USERID");
				String name = rs.getString("NAME");
				String pwd = rs.getString("PWD");
				String email = aes.decrypt(rs.getString("EMAIL")); // AES256 복호화
				String hp1 = rs.getString("HP1");
				String hp2 = aes.decrypt(rs.getString("HP2")); // AES256 복호화
				String hp3 = aes.decrypt(rs.getString("HP3")); // AES256 복호화
				String post1 = rs.getString("POST1");
				String post2 = rs.getString("POST2");
				String addr1 = rs.getString("ADDR1");
				String addr2 = rs.getString("ADDR2");
				String gender= rs.getString("GENDER");
				String birthday = rs.getString("BIRTHDAY");
				int coin = rs.getInt("COIN");
				int point = rs.getInt("POINT");
				String registerday = rs.getString("REGISTERDAY");
				int status = rs.getInt("STATUS");
				member = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, gender, birthday.substring(0, 4), birthday.substring(4,6), birthday.substring(6), coin, point, registerday, status);
			}			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}


	@Override
	public boolean deleteByIdx(int idx) throws SQLException {
		boolean result = false;
		try {
			String sql = " update jsp_member set status = 0 "+
						 " where idx = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			int n = pstmt.executeUpdate();
			if(n>0) result = true;
		} finally {
			close();
		}
		return result;
	}

	@Override
	public int modifyMemberInfo(MemberVO membervo) throws SQLException {
		int result = 0;
		try {
			
		 
			String sql = "update jsp_member\n"
					   + "set NAME = ?, PWD = ?, EMAIL = ?, HP1 = ?, HP2 = ?, HP3 = ?, POST1 = ?, POST2 = ?,"
					   + "    ADDR1 = ?, ADDR2 = ?, GENDER = ? \n"
					   + "where idx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, membervo.getName());
			pstmt.setString(2, SHA256.encrypt(membervo.getPwd()));
			pstmt.setString(3, aes.encrypt(membervo.getEmail()));
			pstmt.setString(4, membervo.getHp1());
			pstmt.setString(5, aes.encrypt(membervo.getHp2()));
			pstmt.setString(6, aes.encrypt(membervo.getHp3()));		
			pstmt.setString(7, membervo.getPost1());
			pstmt.setString(8, membervo.getPost2());
			pstmt.setString(9, membervo.getAddr1());
			pstmt.setString(10, membervo.getAddr2());
			pstmt.setString(11, membervo.getGender()); 
			pstmt.setInt(12, membervo.getIdx());
			
			result = pstmt.executeUpdate();
		
		}catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}finally {
			close();
		}// end of registerMember
		
		
		return result;
	}
}
