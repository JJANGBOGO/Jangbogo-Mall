package com.jangbogo.mall.domain;

public class ProdInqryPageHandler {

    private Integer totalCnt;
    private Integer pageSize;
    private Integer naviSize = 10;
    private Integer totalPage;
    private Integer page;
    private Integer beginPage;
    private Integer endPage;
    private boolean showPage;
    private boolean showNext;

    public ProdInqryPageHandler(Integer totalCnt, Integer page) {
        this(totalCnt, page, 10);
    }
    public ProdInqryPageHandler(Integer totalCnt, Integer page, Integer pageSize) {
        this.totalCnt = totalCnt;
        this.page = page;
        this.pageSize = pageSize;
    }
}
