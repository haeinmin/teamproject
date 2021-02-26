package org.zerock.domain;

import lombok.Data;

@Data
public class SearchVO {
	private Long id;
	private String title;
	private String body;
	private String countryid;
	private String categoriesid;
	private String largeCountry;
	private String smallCountry;
	private String categoriesName;
	private String photourl;
	private String name;
	private int likes;
	private int price;
}
