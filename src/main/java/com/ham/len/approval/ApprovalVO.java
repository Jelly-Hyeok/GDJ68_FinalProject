package com.ham.len.approval;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalVO {
	
	private Long approvalNo;
	private String employeeId;
	private String approvalTitle;
	private String approvalContents;
	private String approvalStatusCd;
	private Date approvalStartDate;
	private Date approvalEndDate;
    private String drafter;
    private String midApprover;
    private String addApprover;
    private String lastApprover;
    private String admonition;
    private String regId;
    private Date regDate;
    private String regMenu;
    private String modId;
    private Date modDate;
    private String modMenu;
}
