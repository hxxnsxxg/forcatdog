package com.kh.forcatdog.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.member.model.dao.MemberDAO;
import com.kh.forcatdog.member.model.vo.License_Quiz;
import com.kh.forcatdog.member.model.vo.License_Quiz_Ans;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.member.model.vo.MyPet;


@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<Integer, String>> selectPWHint() {
		return mDAO.selectPWHint(sqlSession);
	}
	
	@Override
	public int selectId(HashMap<String, String> map) {
		return mDAO.selectId(sqlSession, map);
	}

	@Override
	public int selectNickname(HashMap<String, String> map) {
		return mDAO.selectNickname(sqlSession, map);
	}

	@Override
	public List<String> selectSido() {
		return mDAO.selectSido(sqlSession);
	}

	@Override
	public List<String> selectSiGunGu(HashMap<String, String> map) {
		return mDAO.selectSiGunGu(sqlSession, map);
	}

	@Override
	public List<String> selectDong(HashMap<String, String> map) {
		return mDAO.selectDong(sqlSession, map);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public Member selectMember(Member m) {
		return mDAO.selectMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int updatePw(Member m) {
		return mDAO.updatePw(sqlSession, m);
	}

	@Transactional
	@Override
	public int insertMyPet(MyPet mp) {
		int result = mDAO.insertMyPet(sqlSession, mp);
		result += mDAO.insertMyPetImg(sqlSession, mp);
		return result;
	}

	@Override
	public List<MyPet> selectMyPetList(Member m) {
		return mDAO.selectMyPetList(sqlSession, m);
	}

	@Override
	public MyPet selectMyPet(int petNum) {
		return mDAO.selectMyPet(sqlSession, petNum);
	}

	@Transactional
	@Override
	public int updateMyPet(MyPet mp) {
		int result = mDAO.updateMyPet(sqlSession, mp);
		if(mp.getOriginFileName() != null) {
			result += mDAO.updateMyPetImg(sqlSession, mp);
		}
		return result;
	}

	@Override
	public int deleteMyPet(MyPet mp) {
		return mDAO.deleteMyPet(sqlSession, mp);
	}

	@Override
	public int mergeProfileImg(Member m) {
		return mDAO.mergeProfileImg(sqlSession, m);
	}
	
	@Override
	public int getMyPetListCount(Member m) {
		return mDAO.getMyPetListCount(sqlSession, m);
	}

	@Override
	public List<MyPet> selectMyPetAllList(Member m, PageInfo pi) {
		return mDAO.selectMyPetAllList(sqlSession, m, pi);
	}

	@Override
	public Member findMyId(Member m) {
		return mDAO.findMyId(sqlSession, m);
	}

	@Override
	public Member findMyPwd(Member m) {
		return mDAO.finMyPwd(sqlSession, m);
	}

	@Override
	public int findChangePwd(Member m) {
		return mDAO.findChangePwd(sqlSession, m);
	}
	
	@Override
	public List<License_Quiz> selectTest(String cate) {
		return mDAO.selectTest(sqlSession, cate);
	}

	@Override
	public int checkTest(ArrayList<License_Quiz_Ans> cList) {
		return mDAO.checkTest(sqlSession, cList);
	}

	@Override
	public int chageQuiz_Status(String id) {
		return mDAO.chageQuiz_Status(sqlSession, id);
	}

	@Override
	public List<String> selectPetType(HashMap<String, String> map) {
		return mDAO.selectPetType(sqlSession, map);
	}

	@Override
	public Member selectChatMemberInfo(String memberId) {
		return mDAO.selectChatMemberInfo(sqlSession, memberId);
	}

	@Override
	public int updateStopMember(String id) {
		return mDAO.updateStopMember(sqlSession, id);
	}

	@Override
	public String selectMemberNickname(String id) {
		return mDAO.selectMemberNickname(sqlSession, id);
	}

}
