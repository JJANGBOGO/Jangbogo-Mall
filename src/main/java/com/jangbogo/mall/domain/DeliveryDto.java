package com.jangbogo.mall.domain;

import java.util.Date;

public class DeliveryDto {
    // iv
    private Integer idx;                                                                                                // 배송번호 IDX - PK Not Null
    private Integer ord_idx;                                                                                            // 주문번호 ORD_IDX - FK
    private Integer dlvry_mthd_idx;                                                                                     // 배송방식번호 DLVRY_MTHD_IDX - FK
    private Integer wybl_no;                                                                                            // 운송장번호 WYBL_NO
    private Integer sfkp_mtd_cd;                                                                                        // 배송유형코드 SFKP_MTD_CD
    private Integer dlvry_mtd_cd;                                                                                       // 배송방법코드 DLVRY_MTD_CD
    private Integer pack_mtd_cd;                                                                                        // 배송포장코드 PACK_MTD_CD
    private String rcpr_nm;                                                                                             // 받는분이름 RCPR_NM - Not Null
    private String rcpr_mpno;                                                                                           // 받는분휴대폰번호 RCPR_MPNO - Not Null
    private String rcpr_addr_base;                                                                                      // 받는분기본주소 RCPR_ADDR_BASE - Not Null
    private String rcpr_addr_dtl;                                                                                       // 받는분상세주소 RCPR_ADDR_DTL - Not Null
    private String plrcv;                                                                                               // 받으실장소 PLRCV
    private Date wybl_input_tm;                                                                                         // 송장입력일자 WYBL_INPUT_TM
    private Date dlvry_cmpl_tml;                                                                                        // 배송완료일자 DLVRY_CMPL_TM
    private Date crt_tm;                                                                                                // 최초등록일자 CRT_TM
    private Integer crt_idx;                                                                                            // 최초등록자식별번호 CRT_IDX
    private Date upt_tm;                                                                                                // 최종수정일자 UPT_TM
    private Integer upt_idx;                                                                                            // 최종수정자식별번호 UPT_IDX

    // constructor
    public DeliveryDto() {}                                                                                             // 기본생성자

    // getter and setter
    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Integer getOrd_idx() {
        return ord_idx;
    }

    public void setOrd_idx(Integer ord_idx) {
        this.ord_idx = ord_idx;
    }

    public Integer getDlvry_mthd_idx() {
        return dlvry_mthd_idx;
    }

    public void setDlvry_mthd_idx(Integer dlvry_mthd_idx) {
        this.dlvry_mthd_idx = dlvry_mthd_idx;
    }

    public Integer getWybl_no() {
        return wybl_no;
    }

    public void setWybl_no(Integer wybl_no) {
        this.wybl_no = wybl_no;
    }

    public Integer getSfkp_mtd_cd() {
        return sfkp_mtd_cd;
    }

    public void setSfkp_mtd_cd(Integer sfkp_mtd_cd) {
        this.sfkp_mtd_cd = sfkp_mtd_cd;
    }

    public Integer getDlvry_mtd_cd() {
        return dlvry_mtd_cd;
    }

    public void setDlvry_mtd_cd(Integer dlvry_mtd_cd) {
        this.dlvry_mtd_cd = dlvry_mtd_cd;
    }

    public Integer getPack_mtd_cd() {
        return pack_mtd_cd;
    }

    public void setPack_mtd_cd(Integer pack_mtd_cd) {
        this.pack_mtd_cd = pack_mtd_cd;
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

    public Date getWybl_input_tm() {
        return wybl_input_tm;
    }

    public void setWybl_input_tm(Date wybl_input_tm) {
        this.wybl_input_tm = wybl_input_tm;
    }

    public Date getDlvry_cmpl_tml() {
        return dlvry_cmpl_tml;
    }

    public void setDlvry_cmpl_tml(Date dlvry_cmpl_tml) {
        this.dlvry_cmpl_tml = dlvry_cmpl_tml;
    }

    public Date getCrt_tm() {
        return crt_tm;
    }

    public void setCrt_tm(Date crt_tm) {
        this.crt_tm = crt_tm;
    }

    public Integer getCrt_idx() {
        return crt_idx;
    }

    public void setCrt_idx(Integer crt_idx) {
        this.crt_idx = crt_idx;
    }

    public Date getUpt_tm() {
        return upt_tm;
    }

    public void setUpt_tm(Date upt_tm) {
        this.upt_tm = upt_tm;
    }

    public Integer getUpt_idx() {
        return upt_idx;
    }

    public void setUpt_idx(Integer upt_idx) {
        this.upt_idx = upt_idx;
    }

    // toString

    @Override
    public String toString() {
        return "{" +
                "idx=" + idx +
                ", ord_idx=" + ord_idx +
                ", dlvry_mthd_idx=" + dlvry_mthd_idx +
                ", wybl_no=" + wybl_no +
                ", sfkp_mtd_cd=" + sfkp_mtd_cd +
                ", dlvry_mtd_cd=" + dlvry_mtd_cd +
                ", pack_mtd_cd=" + pack_mtd_cd +
                ", rcpr_nm='" + rcpr_nm + '\'' +
                ", rcpr_mpno='" + rcpr_mpno + '\'' +
                ", rcpr_addr_base='" + rcpr_addr_base + '\'' +
                ", rcpr_addr_dtl='" + rcpr_addr_dtl + '\'' +
                ", plrcv='" + plrcv + '\'' +
                ", wybl_input_tm=" + wybl_input_tm +
                ", dlvry_cmpl_tml=" + dlvry_cmpl_tml +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                '}';
    }
}
