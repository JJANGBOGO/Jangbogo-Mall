package com.jangbogo.mall.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class ProductDtl {

    public ProductDtl () {}

    private Integer prod_idx;
}
