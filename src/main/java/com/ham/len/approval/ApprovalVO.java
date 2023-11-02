package com.ham.len.approval;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.ham.len.admin.CodeVO;
import com.ham.len.admin.document.ApprovalTypeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalVO extends CodeVO{
	
	private Long approvalNo;
	private String employeeId;
	private Long approvalTypeNo;
	private String approvalTitle;
	private String approvalContents;
	private String approvalStatusCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date approvalStartDate;
	private Date approvalEndDate;
    private String drafter;
    private String midApprover;
    private String addApprover;
    private String lastApprover;
    private String admonition;
    private ApprovalTypeVO approvalTypeVO;
    
}