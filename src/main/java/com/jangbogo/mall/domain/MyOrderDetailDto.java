package com.jangbogo.mall.domain;

import java.util.Date;

public class MyOrderDetailDto {
    // PRODUCT(상품)
    private String upload_path; // 이미지파일경로 upload_path

    // ORD_DTL(주문상세)
    private Integer ord_dtl_idx; // 주문상세번호 ord_dtl_idx
    private String prod_nm;     // 상품이름 prod_nm
    private Integer prod_idx;   // 상품번호 prod_idx
    private Integer prod_prc;   // 상품가격 prod_prc
    private Integer prod_qty;   // 상품수량 prod_qty
    private Integer rtng_qty;   // 반품상품수량 rtng_qty
    private Integer prod_tot_amt; // 상품총금액 prod_tot_amt
    private Integer ord_state_cd; // 주문상태코드 ord_state_cd
    private Integer prod_late_state_cd; // 후기작성상태코드 prod_late_state_cd
    private Integer cncl_posbl_state_cd; // 주문취소가능상태코드 cncl_posbl_state_cd

    // SETL(결제)
    private Integer ord_tot_amt; // 주문총금액(상품금액) ord_tot_amt
    private Integer amt;         // 실결제금액(결제금액) amt
    private Integer mn_cd;       // 결제수단코드(카카오페이) mn_cd


    // ORD(주문)
    private Integer idx;         // 주문번호 idx
    private String ordr_nm;      // 주문자이름(보내시는 분) ordr_nm
    private Date ord_tm;         // 주문날짜(결제일시) ord_tm

    // DLVRY(배송)
    private String rcpr_nm;      // 받는분이름(받는 분) rcpr_nm
    private String rcpr_mpno;    // 받는분휴대폰번호(핸드폰) rcpr_mpno
    private String rcpr_addr_base; // 받는분기본주소(주소) rcpr_addr_base
    private String rcpr_addr_dtl;  // 받는분상세주소(주소) rcpr_addr_dtl
    private String plrcv;          // 받으실장소 plrcv
    private Integer gate_pwd;      // 공동현관비밀번호 gate_pwd
    private Integer sfkp_mtd_cd;   // 배송유형코드(냉동) sfkp_mtd_cd
    private Integer pack_mtd_cd;   // 배송포장코드(포장방법) pack_mtd_cd


//    private Integer idx;
//    private Integer ord_idx;
//    private Integer prod_idx;
//    private Integer prod_opt_idx;
//    private String prod_nm;
//    private Integer prod_prc;
//    private Integer prod_qty;
//    private Integer rtng_qty;
//    private Integer prod_tot_amt;
//    private Integer prod_sfkp_type_cd;
//    private Integer setl_mn_cd;
//    private Integer ord_state_cd;
//    private Integer prod_late_state_cd;
//    private Integer cncl_posbl_state_cd;
//    private Date ord_tm;
//    private Date setl_cmpl_tm;
//    private Date setl_cncl_tm;
//    private Date dlvry_start_tm;
//    private Date dlvry_cmpl_tm;
//    private Date rtng_rqst_tm;
//    private Date rtng_cmpl_tm;
//    private Date excng_rqst_tm;
//    private Date excng_cmpl_tm;
//    private Date excng_rcpt_tm;
//    private Date rfnd_cmpl_tm;
//    private Date crt_tm;
//    private Integer crt_idx;
//    private Date upt_tm;
//    private Integer upt_idx;

    // Constructor
    public MyOrderDetailDto(){}


    // Getter and Setter


    public String getUpload_path() {
        return upload_path;
    }

    public void setUpload_path(String upload_path) {
        this.upload_path = upload_path;
    }

    public Integer getOrd_dtl_idx() {
        return ord_dtl_idx;
    }

    public void setOrd_dtl_idx(Integer ord_dtl_idx) {
        this.ord_dtl_idx = ord_dtl_idx;
    }

    public String getProd_nm() {
        return prod_nm;
    }

    public void setProd_nm(String prod_nm) {
        this.prod_nm = prod_nm;
    }

    public Integer getProd_idx() {
        return prod_idx;
    }

    public void setProd_idx(Integer prod_idx) {
        this.prod_idx = prod_idx;
    }

    public Integer getProd_prc() {
        return prod_prc;
    }

    public void setProd_prc(Integer prod_prc) {
        this.prod_prc = prod_prc;
    }

    public Integer getProd_qty() {
        return prod_qty;
    }

    public void setProd_qty(Integer prod_qty) {
        this.prod_qty = prod_qty;
    }

    public Integer getRtng_qty() {
        return rtng_qty;
    }

    public void setRtng_qty(Integer rtng_qty) {
        this.rtng_qty = rtng_qty;
    }

    public Integer getProd_tot_amt() {
        return prod_tot_amt;
    }

    public void setProd_tot_amt(Integer prod_tot_amt) {
        this.prod_tot_amt = prod_tot_amt;
    }

    public Integer getOrd_state_cd() {
        return ord_state_cd;
    }

    public void setOrd_state_cd(Integer ord_state_cd) {
        this.ord_state_cd = ord_state_cd;
    }

    public Integer getProd_late_state_cd() {
        return prod_late_state_cd;
    }

    public void setProd_late_state_cd(Integer prod_late_state_cd) {
        this.prod_late_state_cd = prod_late_state_cd;
    }

    public Integer getCncl_posbl_state_cd() {
        return cncl_posbl_state_cd;
    }

    public void setCncl_posbl_state_cd(Integer cncl_posbl_state_cd) {
        this.cncl_posbl_state_cd = cncl_posbl_state_cd;
    }

    public Integer getOrd_tot_amt() {
        return ord_tot_amt;
    }

    public void setOrd_tot_amt(Integer ord_tot_amt) {
        this.ord_tot_amt = ord_tot_amt;
    }

    public Integer getAmt() {
        return amt;
    }

    public void setAmt(Integer amt) {
        this.amt = amt;
    }

    public Integer getMn_cd() {
        return mn_cd;
    }

    public void setMn_cd(Integer mn_cd) {
        this.mn_cd = mn_cd;
    }

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public String getOrdr_nm() {
        return ordr_nm;
    }

    public void setOrdr_nm(String ordr_nm) {
        this.ordr_nm = ordr_nm;
    }

    public Date getOrd_tm() {
        return ord_tm;
    }

    public void setOrd_tm(Date ord_tm) {
        this.ord_tm = ord_tm;
    }

    public String getRcpr_nm() {
        return rcpr_nm;
    }

    public void setRcpr_nm(String rcpr_nm) {
        this.rcpr_nm = rcpr_nm;
    }

    public String getRcpr_mpno() {
        return rcpr_mpno;
    }

    public void setRcpr_mpno(String rcpr_mpno) {
        this.rcpr_mpno = rcpr_mpno;
    }

    public String getRcpr_addr_base() {
        return rcpr_addr_base;
    }

    public void setRcpr_addr_base(String rcpr_addr_base) {
        this.rcpr_addr_base = rcpr_addr_base;
    }

    public String getRcpr_addr_dtl() {
        return rcpr_addr_dtl;
    }

    public void setRcpr_addr_dtl(String rcpr_addr_dtl) {
        this.rcpr_addr_dtl = rcpr_addr_dtl;
    }

    public String getPlrcv() {
        return plrcv;
    }

    public void setPlrcv(String plrcv) {
        this.plrcv = plrcv;
    }

    public Integer getGate_pwd() {
        return gate_pwd;
    }

    public void setGate_pwd(Integer gate_pwd) {
        this.gate_pwd = gate_pwd;
    }

    public Integer getSfkp_mtd_cd() {
        return sfkp_mtd_cd;
    }

    public void setSfkp_mtd_cd(Integer sfkp_mtd_cd) {
        this.sfkp_mtd_cd = sfkp_mtd_cd;
    }

    public Integer getPack_mtd_cd() {
        return pack_mtd_cd;
    }

    public void setPack_mtd_cd(Integer pack_mtd_cd) {
        this.pack_mtd_cd = pack_mtd_cd;
    }

    // toString()
    @Override
    public String toString() {
        return "MyOrderDetailDto{" +
                "upload_path='" + upload_path + '\'' +
                ", ord_dtl_idx=" + ord_dtl_idx +
                ", prod_nm='" + prod_nm + '\'' +
                ", prod_idx=" + prod_idx +
                ", prod_prc=" + prod_prc +
                ", prod_qty=" + prod_qty +
                ", rtng_qty=" + rtng_qty +
                ", prod_tot_amt=" + prod_tot_amt +
                ", ord_state_cd=" + ord_state_cd +
                ", prod_late_state_cd=" + prod_late_state_cd +
                ", cncl_posbl_state_cd=" + cncl_posbl_state_cd +
                ", ord_tot_amt=" + ord_tot_amt +
                ", amt=" + amt +
                ", mn_cd=" + mn_cd +
                ", idx=" + idx +
                ", ordr_nm='" + ordr_nm + '\'' +
                ", ord_tm=" + ord_tm +
                ", rcpr_nm='" + rcpr_nm + '\'' +
                ", rcpr_mpno='" + rcpr_mpno + '\'' +
                ", rcpr_addr_base='" + rcpr_addr_base + '\'' +
                ", rcpr_addr_dtl='" + rcpr_addr_dtl + '\'' +
                ", plrcv='" + plrcv + '\'' +
                ", gate_pwd=" + gate_pwd +
                ", sfkp_mtd_cd=" + sfkp_mtd_cd +
                ", pack_mtd_cd=" + pack_mtd_cd +
                '}';
    }
}

