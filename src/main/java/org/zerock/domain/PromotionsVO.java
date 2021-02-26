package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PromotionsVO {
	private Long id;
	private String title;
	private String body;
	private int  countryid;
	private int categoriesid;
	private Date createdate;
	private int price;
	private int likes;
	private int scores;
	private String photourl;
	private String continent;
}
