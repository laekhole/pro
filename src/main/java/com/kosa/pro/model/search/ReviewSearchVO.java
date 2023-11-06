package com.kosa.pro.model.search;



import com.kosa.pro.model.common.SearchVO;

import lombok.Data;

/**
 * 후기 게시판 파라미터 모델
 */

@Data
public class ReviewSearchVO extends SearchVO {
	private static final long serialVersionUID = 8860661778683988628L;
	
	private String codeNumber;
	private int reviewSeq;
	
}
