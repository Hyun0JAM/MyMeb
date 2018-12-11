package member.model;

import java.sql.SQLException;
import java.util.List;

public interface InterMemberDAO {
	void close(); // *** DB�� ���õ� rs, pstmt �ڿ��� �ݳ��ϴ� �޼ҵ� �����ϱ� *** //
	void connClose(); // **** DB�� ���õ� conn �� �ݳ��ϴ� �޼ҵ� �����ϱ� ****
	int registerMember(MemberVO membervo) throws SQLException;
	boolean idDuplicateCheck(String userid) throws SQLException; // �ߺ����̵� ���θ� üũ�ϴ� �߻� �޼ҵ�
	List<MemberVO> getAllMember() throws SQLException; // ����¡�۸� ���� ��üȸ���� �����ִ� �߻�޼ҵ�
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
