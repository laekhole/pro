package com.kosa.pro.model.search;
import org.springframework.web.multipart.MultipartFile;
import com.kosa.pro.model.common.SearchVO;
import lombok.Data;

/**
봉사활동 신청 모집 목록 검색
**/

@Data
public class RecruitSearchVO extends SearchVO {
	
	private static final long serialVersionUID = -6342602198186321293L;
	
	private String state;
}
