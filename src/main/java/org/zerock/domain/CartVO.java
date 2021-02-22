package org.zerock.domain;

import lombok.Data;

@Data
public class CartVO {
	private int cart_id;
    private String userid;
    private String name;
    private int product_id;
    private String product_name;
    private int price;
    private int sum;
    private int amount;
}