package com.kosa.pro.model;

import java.sql.Clob;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO implements GeneralModel {
	
	private static final long serialVersionUID = 9196710504900818451L;
	
	private int noticeSeq;
	private String writeId;
	private String title;
	private String content;
	private String regDate;
	private String modDate;
	private int viewCount;
	private String pixedYn; // db에는 fix인데 여기는 pix임
	private String delYn;

}
