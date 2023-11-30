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
public class VolunteerRecordVO implements GeneralModel {
	
	private static final long serialVersionUID = -337865601444804002L;
	
	private int volunSeq;
	private int memSeq;
	private int groupMemSeq;
	private int recruitSeq;
	private String timein;
	private String timeout;
	
	
//	[별이] 11/05 추가
	private String name;
//  [민기] 11/07 추가
	private String state;

}
