package com.kosa.pro.model.search;

import com.kosa.pro.model.common.SearchVO;

public class MemberSearchVO extends SearchVO{
	
	
    private String memberUseYn; 

    /**
     * 회원 관리 사용 여부 값
     * 이 메소드는 사용 여부에 대한 설정을 반환합니다.
     * @return 사용 여부 설정 값
     */
    public String getMemberUseYn() {
        return memberUseYn;
    }

    public void setMemberUseYn(String memberUseYn) {
        this.memberUseYn = memberUseYn;
    }

}
