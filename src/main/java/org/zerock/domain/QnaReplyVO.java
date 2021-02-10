package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaReplyVO {
	private int replyNo;
	private int qnaNo;
	
	private String reply;
	private String replier;
	private Date replyDate;
}
