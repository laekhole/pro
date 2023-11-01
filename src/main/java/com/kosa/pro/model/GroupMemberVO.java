package com.kosa.pro.model;

import com.kosa.pro.model.general.GeneralModel;

import lombok.Data;

@Data
public class GroupMemberVO implements GeneralModel {

	private static final long serialVersionUID = -6872886920468343674L;
	
	private int groupMemSeq;
	private String groupMemId;
	private String groupName;
	private String groupPwd;
	private String groupNumber;
	private String groupPhone;
	private String groupAuth;
	private String groupDelYn;
	private String groupJoinDate;
	

}
