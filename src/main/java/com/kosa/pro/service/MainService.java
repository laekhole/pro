package com.kosa.pro.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosa.pro.model.NoticeVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.service.common.BaseService;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class MainService extends BaseService {
	
	@Autowired
	CacheManager cacheManager;
	
	@Transactional(readOnly = true)
	@Cacheable(value = "noticeListCache", key = "#search.cash")
	public Map<String, Object> mainList(SearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("listTop3", (List<ReviewBoardVO>) getDAO().selectList("review.selectMainReviewTop3", null));
		//map.put("recruitList", (List<RecruitBoardVO>) getDAO().selectList("recruit.selectMainRecruit", null));
		map.put("noticeList", (List<NoticeVO>) getDAO().selectList("notice.selectMainNotice", null));
		
		return map;
	}
	
	public List<RecruitBoardVO> recruitList() {
		
		return (List<RecruitBoardVO>) getDAO().selectList("recruit.selectMainRecruit", null);
	}

	
	public List<NoticeVO> noticeList(SearchVO search) {
		search.setRecordCount(5);
		return (List<NoticeVO>) getDAO().selectBySearch("notice.noticeList", search, "totalCount");
	}

}
