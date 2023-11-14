package com.kosa.pro.model;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class VolunteerProceedVO implements GeneralModel {
	
	private static final long serialVersionUID = -2858513294136857815L;
	

	private int volunProceedSeq;	// 신청내역 봉사번호
	private int recruitSeq;			// 해당 봉사신청 게시판 글번호
	private int memSeq;				// 개인회원 번호
	private int groupMemSeq;		// 단체회원 번호
	private String state;			// 상태(신청중/승인/거절)
	private String rejectMessage;	// 거절 메시지
	private String attendance;		// 출석여부
	private String name;
    private String gender;
	
    // [user] 마이페이지 메인 조인 용도 필드
	private String latitude;     	// 위도
	private String longitude;    	// 경도

}
