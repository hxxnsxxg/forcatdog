package com.kh.forcatdog.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.member.model.vo.License_Quiz;
import com.kh.forcatdog.member.model.vo.License_Quiz_Ans;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.member.model.vo.MyPet;

public interface MemberService {

	List<Map<Integer, String>> selectPWHint();

	List<String> selectSido();

	List<String> selectSiGunGu(HashMap<String, String> map);

	List<String> selectDong(HashMap<String, String> map);

	int selectId(HashMap<String, String> map);

	int selectNickname(HashMap<String, String> map);

	int insertMember(Member m);

	Member selectMember(Member m);

	int updateMember(Member m);

	int updatePw(Member m);

	int insertMyPet(MyPet mp);

	List<MyPet> selectMyPetList(Member m);

	MyPet selectMyPet(int petNum);

	int updateMyPet(MyPet mp);

	int deleteMyPet(MyPet mp);

	int mergeProfileImg(Member m);

	List<MyPet> selectMyPetAllList(Member m, PageInfo pi);

	int getMyPetListCount(Member m);
	
	Member findMyId(Member m);

	Member findMyPwd(Member m);

	int findChangePwd(Member m);
	
	List<License_Quiz> selectTest(String cate);

	int checkTest(ArrayList<License_Quiz_Ans> cList);

	int chageQuiz_Status(String id);

	List<String> selectPetType(HashMap<String, String> map);

	Member selectChatMemberInfo(String memberId);

	int updateStopMember(String id);

	String selectMemberNickname(String id);
}
