package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SearchDto {
	
	// 페이징 처리를 위해 필요한 정보 
	// 리스트 페이지를 조회 하기 위해 쿼리 실행시 필요한 정보
	private int pageNo = 1; 	// 요청 페이지 번호
	private int amount = 5; 	// 페이지당 게시물 수
	
	// 검색에 필요한 정보
	private String searchField = "";	// 검색필드
	private String searchWord = "";	// 검색어
	
	private int categoryId;
	public SearchDto(String pageNo, String amount){
		
		try {
			
			if (pageNo != null)
				this.pageNo = Integer.parseInt(pageNo);
			if(amount != null)
				this.amount = Integer.parseInt(amount);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error ==== 페이지번호, 페이지당 게시물수를 세팅중 예외가 발생 하였습니다. [형변환 오류]");
		}
	}

	/*
	 * 초기화!!
	 */
	public SearchDto(String pageNo, String amount, String searchField, String searchWord) {
		// 생성자 호출
		this(pageNo, amount);
		this.searchField = searchField;
		this.searchWord = searchWord;
	}
	
	/*
	 * 검색필드와 검색어가 비어 있지 않으면
	 * 조건절을 만들어서 반환
	 */
	public String getWhere() {
		String where = "";
		if(searchField != null && searchWord != null &&
				!"".equals(searchField) && !"".equals(searchWord)  ) {
			// searchField에 여러개의 컬럼이 있는경우
			// split : 문자열을 /기호로 끊어서 문자배열로 반환 하는 메서드
			// id/name  -> ['id', 'name']
			String[] searchFieldArr = searchField.split("/");
			for(int i=0; i<searchFieldArr.length; i++) {
				where += searchFieldArr[i] + " like '%" + searchWord + "%' " ;
				if(i != searchFieldArr.length-1) {
					where += " or ";
				}
			}
			where = " and (" + where + ") ";
		}
		
		return where;
	}
	public int getOffset() {
        return (pageNo - 1) * amount;
    }
	
}
