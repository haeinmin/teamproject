package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String id;
	private int replyCnt;
	private String nickname;
}
