package model.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JNDI;
import model.users.UsersVO;

public class TestDAO { 

	static int pageSize = 3; // ����¡ ���� ����

	static String sql_INSERT = "INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) "
			+ "VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),?,?,?,?,?,?,?)";
	static String sql_SELECT_ONE = "SELECT * FROM test WHERE tid=?";
	static String sql_HIT_UP = "UPDATE test SET thit=thit+1 WHERE tid=?"; // �Խñ� ��ȸ == ��ȸ�� ++
	static String sql_UPDATE = "UPDATE test SET ttitle=?, tcontent=?, tanswer=?, tex=?, tlang=? WHERE tid=?";
	static String sql_DELETE = "DELETE FROM test WHERE tid =?";

	//--------------------------------------------------------------------------------------------------------------------------	

	// getDBList --> �˻���ɱ��� + ����(�ֽ�, ���, ��ȸ��)
	@SuppressWarnings("resource")
	public TestSet getDBList(String content, int pageNum, UsersVO uvo, String pageOrder) {
		Connection conn = JNDI.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs;
		String sql;
		int cnt = 0;

		TestSet datas = new TestSet();
		TestVO data = null;

		try { // �α��� �Ѱ��
			if (uvo.getUserNum() > 0) {
				if (pageOrder.equals("reply")) { // RE_CNT
					sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, test.* FROM (SELECT * FROM test "
							+ "WHERE usernum=? AND ttitle LIKE '%" + content
							+ "%' ORDER BY recnt DESC, tdate DESC) "
							+ "test WHERE ROWNUM <= ?) WHERE RNUM > ? ORDER BY recnt DESC";

				} else if (pageOrder.equals("hit")) { // T_HIT
					sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, test.* FROM (SELECT * FROM test "
							+ "WHERE usernum=? AND ttitle LIKE '%" + content + "%' ORDER BY thit DESC, tdate DESC) "
							+ "test WHERE ROWNUM <= ?) WHERE RNUM > ? ORDER BY thit DESC";
				} else {

					sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, test.* FROM ("
							+ "SELECT * FROM test WHERE usernum=? AND ttitle LIKE '%" + content
							+ "%' ORDER BY tdate DESC) test WHERE ROWNUM <= ?) WHERE RNUM > ? ORDER BY tdate DESC";
				}
				// System.out.println("�α��� �Ѱ�� , content: " + content);

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, uvo.getUserNum());
				pstmt.setInt(2, (pageNum * pageSize) + pageSize);
				pstmt.setInt(3, pageNum * pageSize);

			} else {
				// System.out.println("�α��� �� �Ѱ�� + content : " + content);

				if (pageOrder.equals("reply")) { // RE_CNT
					System.out.println("��ۼ�");
					sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, test.* FROM (SELECT * FROM test "
		                     + "WHERE ttitle LIKE '%" + content + "%' ORDER BY recnt DESC, tdate DESC) "
		                     + "test WHERE ROWNUM <= ?) WHERE RNUM > ? ORDER BY recnt DESC";



				} else if (pageOrder.equals("hit")) { // T_HIT
					System.out.println("��ȸ��");
					sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, test.* FROM (SELECT * FROM test "
		                     + "WHERE ttitle LIKE '%" + content + "%' ORDER BY thit DESC, tdate DESC) "
		                     + "test WHERE ROWNUM <= ?) WHERE RNUM > ? ORDER BY thit DESC";
				} else {
					System.out.println("�ֽż�");
					sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, test.* FROM ("
		                     + "SELECT * FROM test WHERE ttitle LIKE '%" + content
		                     + "%' ORDER BY tdate DESC) test WHERE ROWNUM <= ?"
		                     + ") WHERE RNUM > ? ORDER BY tdate DESC";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, (pageNum * pageSize) + pageSize);
				pstmt.setInt(2, pageNum * pageSize);
			}
			rs = pstmt.executeQuery();

			ArrayList<TestVO> tlist = new ArrayList<TestVO>();

			while (rs.next()) {
				data = new TestVO();

				data.settId(rs.getInt("tid"));
				data.setUserNum(rs.getInt("usernum"));
				data.settTitle(rs.getString("ttitle"));
				data.settContent(rs.getString("tcontent"));
				data.settAnswer(rs.getString("tanswer"));
				data.settEx(rs.getString("tex"));
				data.settWriter(rs.getString("twriter"));
				data.settDate(rs.getDate("tdate"));
				data.settHit(rs.getInt("thit"));
				data.settLang(rs.getString("tlang"));
				data.setReCnt(rs.getInt("recnt"));
				tlist.add(data);
			}
			rs.close();

			if (uvo.getUserNum() > 0) {
				sql = "SELECT COUNT(*) FROM test WHERE usernum =? AND ttitle LIKE '%" + content + "%'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, uvo.getUserNum());

			} else {
				sql = "SELECT COUNT(*) FROM test WHERE ttitle LIKE '%" + content + "%'";
				pstmt = conn.prepareStatement(sql);
			}

			ResultSet total = pstmt.executeQuery();
			if (total.next()) {
				cnt = total.getInt(1);
			}
			total.close();

			datas.setTlist(tlist); // �Խñ� ���
			datas.setTestCnt(cnt); // �Խñ� �� ����

		} catch (SQLException e) {
			System.out.println("TestDAO-getDBList ���� �α�");
			e.printStackTrace();
		} finally {
			JNDI.disconnect(pstmt, conn);
		}
		System.out.println("datas : " + datas);

		return datas;

	}
	/////////////////////////////////////////////////////////////////////////	

	// getDBData --> ��ȸ�� ++ (Ʈ�����)
	@SuppressWarnings("resource")
	public TestVO getDBData(TestVO tvo, UsersVO uvo) {
		Connection conn = JNDI.getConnection();
		TestVO data = null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		boolean check = false; // Ʈ����� Ŀ��, �ѹ� ���� �Ǵ� ����
		try {

			// System.out.println("���� �� �� Ŭ�� -> ��ȸ������xxx");
			// ������ Ŭ���Ѱ��� -> ��ȸ�� ���� xxxx ===> ����Ʈ ������
			pstmt = conn.prepareStatement(sql_SELECT_ONE);
			pstmt.setInt(1, tvo.gettId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new TestVO();
				data.settId(rs.getInt("tid"));
				data.setUserNum(rs.getInt("usernum"));
				data.settTitle(rs.getString("ttitle"));
				data.settContent(rs.getString("tcontent"));
				data.settAnswer(rs.getString("tanswer"));
				data.settEx(rs.getString("tex"));
				data.settWriter(rs.getString("twriter"));
				data.settDate(rs.getDate("tdate"));
				data.settHit(rs.getInt("thit"));
				data.settLang(rs.getString("tlang"));
				data.setReCnt(rs.getInt("recnt"));
			}
			if (!(data.getUserNum() == uvo.getUserNum())) {
				// ������ �ƴϸ� -> ��ȸ�� ����ooo ==> Ʈ������� �̿�
				conn.setAutoCommit(false); // Ʈ�����

				System.out.println("���� ��  Ŭ�� -> ��ȸ������ooo");

				pstmt = conn.prepareStatement(sql_HIT_UP);
				pstmt.setInt(1, tvo.gettId());
				pstmt.executeUpdate();
				check = true;

				if (check) {
					conn.commit();
				} else {
					conn.rollback();
				}
			}

			rs.close();

		} catch (SQLException e) {
			System.out.println("TestDAO-getDBData �����α�");
			e.printStackTrace();
		} finally {
			JNDI.disconnect(pstmt, conn);
		}
		return data;
	}
	/////////////////////////////////////////////////////////////////////////	

	public boolean insert(TestVO vo) {
		Connection conn = JNDI.getConnection();
		boolean res = false;
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql_INSERT);

			pstmt.setInt(1, vo.getUserNum());
			pstmt.setString(2, vo.gettTitle());
			pstmt.setString(3, vo.gettContent());
			pstmt.setString(4, vo.gettAnswer());
			pstmt.setString(5, vo.gettEx());
			pstmt.setString(6, vo.gettWriter());
			pstmt.setString(7, vo.gettLang());
			pstmt.executeUpdate();

			res = true;

		} catch (SQLException e) {
			System.out.println("TestDAO-insert ���� �α�");
			e.printStackTrace();
		} finally {
			JNDI.disconnect(pstmt, conn);
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////

	// update
	public boolean update(TestVO vo) {
		Connection conn = JNDI.getConnection();
		boolean res = false;
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql_UPDATE);
			pstmt.setString(1, vo.gettTitle());
			pstmt.setString(2, vo.gettContent());
			pstmt.setString(3, vo.gettAnswer());
			pstmt.setString(4, vo.gettEx());
			pstmt.setString(5, vo.gettLang());
			pstmt.setInt(6, vo.gettId());
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("TestDAO-update ���� �α�");
			e.printStackTrace();
		} finally {
			JNDI.disconnect(pstmt, conn);
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////

	// delete
	public boolean delete(TestVO vo) {
		Connection conn = JNDI.getConnection();
		boolean res = false;
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql_DELETE);
			pstmt.setInt(1, vo.gettId());
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("TestDAO-delete ���� �α�");
			e.printStackTrace();
		} finally {
			JNDI.disconnect(pstmt, conn);
		}
		return res;
	}

	/////////////////////////////////////////////////////////////////////////	

}
