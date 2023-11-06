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
public class VolunteeringVO implements GeneralModel {
	
	private static final long serialVersionUID = 5995424501649148152L;
	
	private int recruitSeq;			// 봉사신청글 번호
	private int groupMemSeq;		// 단체회원번호
	private String groupName;		// 단체 이름
	private String volunRegion1;	// 봉사 지역
	private String volunRegion2;	// 봉사 지역
	private String volunAddr;		// 봉사 장소
	private String volunStartDate;	// 봉사 시작일
	private String volunEndDate;	// 봉사 종료일
	private int volunTime;			// 봉사 시간
	private int memCount;			// 모집 인원
	private String volunTarget;		// 봉사 대상(신청 가능 대상..? 그런거같음 다시보니)
	private String recruitTitle;	// 글 제목

	private String name;			// 참여자 이름
	private int memSeq;				// 참여자수
	private String timein;			// 출석여부

}
