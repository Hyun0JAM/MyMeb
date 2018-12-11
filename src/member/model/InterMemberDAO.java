package member.model;

import java.sql.SQLException;
import java.util.List;

public interface InterMemberDAO {
	void close(); // *** DB와 관련된 rs, pstmt 자원을 반납하는 메소드 생성하기 *** //
	void connClose(); // **** DB와 관련된 conn 을 반납하는 메소드 생성하기 ****
	int registerMember(MemberVO membervo) throws SQLException;
	boolean idDuplicateCheck(String userid) throws SQLException; // 중복아이디 여부를 체크하는 추상 메소드
	List<MemberVO> getAllMember() throws SQLException; // 페이징퍼리 안한 전체회원을 보여주는 추상메소드
	List<MemberVO> getAllMember(int sizePerPage, int currentShowPageNo) throws SQLException;
	List<MemberVO> getAllMember(int sizePerPage, int currentShowPageNo,int period) throws SQLException;
	List<MemberVO> getAllMember(int sizePerPage, int currentShowPageNo,int period,String searchType,String searchWord) throws SQLException;
	int getTotalCount() throws SQLException;
	int getTotalCount(int period) throws SQLException;
	int getTotalCount(String searchType,String searchWord,int period) throws SQLException;
	MemberVO getByIdx(int idx)throws SQLException;
	boolean deleteByIdx(int idx)throws SQLException;
	int modifyMemberInfo(MemberVO membervo) throws SQLException;
}
