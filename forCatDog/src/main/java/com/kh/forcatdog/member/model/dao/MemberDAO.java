package com.kh.forcatdog.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.member.model.vo.License_Quiz;
import com.kh.forcatdog.member.model.vo.License_Quiz_Ans;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.member.model.vo.MyPet;

@Repository("mDAO")
public class MemberDAO {

	public List<Map<Integer, String>> selectPWHint(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("memberMapper.selectPWHint");
	}

	public List<String> selectSido(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("memberMapper.selectSido");
	}

	public List<String> selectSiGunGu(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("memberMapper.selectSiGunGu", map);
	}

	public List<String> selectDong(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("memberMapper.selectDong", map);
	}

	public int selectId(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectId", map);
	}

	public int selectNickname(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectNickname", map);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int updatePw(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePw", m);
	}

	public int insertMyPet(SqlSessionTemplate sqlSession, MyPet mp) {
		return sqlSession.insert("memberMapper.insertMyPet", mp);
	}
	
	public int insertMyPetImg(SqlSessionTemplate sqlSession, MyPet mp) {
		return sqlSession.insert("memberMapper.insertMyPetImg", mp);
	}

	public List<MyPet> selectMyPetList(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("memberMapper.selectMyPetList", m);
	}

	public MyPet selectMyPet(SqlSessionTemplate sqlSession, int petNum) {
		return sqlSession.selectOne("memberMapper.selectMyPet", petNum);
	}

	public int updateMyPet(SqlSessionTemplate sqlSession, MyPet mp) {
		return sqlSession.update("memberMapper.updateMyPet", mp);
	}
	
	public int updateMyPetImg(SqlSessionTemplate sqlSession, MyPet mp) {
		return sqlSession.update("memberMapper.updateMyPetImg", mp);
	}

	public int deleteMyPet(SqlSessionTemplate sqlSession, MyPet mp) {
		return sqlSession.delete("memberMapper.deleteMyPet", mp);
	}

	public int mergeProfileImg(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.mergeProgileImg", m);
	}

	public int getMyPetListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.getMyPetListCount", m);
	}
	
	public List<MyPet> selectMyPetAllList(SqlSessionTemplate sqlSession, Member m, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		
		return sqlSession.selectList("memberMapper.selectMyPetAllList", m, rowBounds);
	}
	
	public Member findMyId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findMyId", m);
	}

	public Member finMyPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findMyPwd", m);
	}

	public int findChangePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.findChangePwd", m);
	}
	
	public List<License_Quiz> selectTest(SqlSessionTemplate sqlSession, String cate) {
		return sqlSession.selectList("memberMapper.selectTest", cate);
	}

	public int checkTest(SqlSessionTemplate sqlSession, ArrayList<License_Quiz_Ans> cList) {
		return sqlSession.selectOne("memberMapper.checkTest", cList);
	}

	public int chageQuiz_Status(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.changeQuiz_Status", id);
	}

	public List<String> selectPetType(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("memberMapper.selectPetType", map);
	}

	public Member selectChatMemberInfo(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectChatMemberInfo", memberId);
	}

	public int updateStopMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.updateStopMember", id);
	}

	public String selectMemberNickname(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectMemberNickname", id);
	}

}
