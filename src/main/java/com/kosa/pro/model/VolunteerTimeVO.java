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
public class VolunteerTimeVO implements GeneralModel {
	
	private static final long serialVersionUID = -4784847271330187132L;
	
	private int memSeq;
	private double volunHeat; // 오늘의 봉사 온도
	private int volunAddtime;
	private int volunNoshow;
	private float tomorrowHeat; // 내일의 봉사 온도(계산 결과 컬럼, 가상 컬럼)
	

}
