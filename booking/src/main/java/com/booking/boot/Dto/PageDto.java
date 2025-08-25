package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDto {

    private int pageNo;      // 현재 페이지 번호
    private int amount;        // 페이지당 항목 수
    private int totalItems;  // 전체 데이터 수
    private int totalPages;  // 전체 페이지 수

    private int startNo;     // 페이지 블럭 시작 번호
    private int endNo;       // 페이지 블럭 끝 번호
    private boolean isPrev;  // 이전 블럭 존재 여부
    private boolean isNext;  // 다음 블럭 존재 여부

    /*
     * 페이지번호, 페이지당 게시물수, 총게시물의수, [블럭당페이지의수] 
     * 		=> 페이지 블럭
     * 		=> 블럭의 시작번호, 블럭의 끝번호, 앞으로가기, 뒤로가기
     */
    public PageDto(SearchDto searchDto, int totalItems) {
        this.pageNo = searchDto.getPageNo();
        this.amount = searchDto.getAmount();
        this.totalItems = totalItems;

        this.totalPages = (int) Math.ceil((double) totalItems / amount);

        int blockSize = 5; // 페이지 블럭 크기
        this.startNo = ((pageNo - 1) / blockSize) * blockSize + 1;
        this.endNo = Math.min(startNo + blockSize - 1, totalPages);

        this.isPrev = startNo > 1;
        this.isNext = endNo < totalPages;
    }
}

