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
public class RecruitBoardVO implements GeneralModel {
	
	private static final long serialVersionUID = 5995424501649148152L;
	
	private int recruitSeq;			// 봉사신청글 번호
	private int groupMemSeq;		// 단체회원번호
	private String groupName;		// 단체 이름
	private String volunRegion1;	// 봉사 지역
	private String volunRegion2;	// 봉사 지역
	private String volunStartDate;	// 봉사 시작일
	private String volunEndDate;	// 봉사 종료일
	private String recruitState;	// 모집 현황(모집중/모집종료/종료)
	private String volunCode;		// 봉사 분야
	private int volunTime;			// 봉사 시간
	private String recruitStartDate;// 모집 시작일
	private String recruitEndDate;	// 모집 종료일
	private int memCount;			// 모집 인원
	private String volunTarget;		// 봉사 대상
	private String recruitTitle;	// 글 제목
	private String recruitContent;	// 글 내용
	private int viewCount;			// 조회수
	private String regDate;			// 작성일
	private String modDate;			// 수정일
	private String delYn;			// 삭제여부
	private String manager;			// 담당자
	private String email;			// 담당자 이메일
	private String phone;			// 담당자 연락처
	

}
