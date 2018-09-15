package com.comvision.artBridge.admin.model.vo;

import java.sql.Date;

public class Notice {
	//Board - 공지사항 게시판 글 객체
	private int nNo;			//게시글번호
	private int nType;			//게시글유형
	private String nTitle;		//게시글제목
	private String nContent;	//게시글내용
	private Date nDate;			//등록일자
	private int memberNo;		//작가번호
	private Date modifyDate;	//수정일
	private int nStatus;		//게시글상태
	
	public Notice(){}

	public Notice(int nNo, int nType, String nTitle, String nContent, Date nDate, int memberNo, Date modifyDate,
			int nStatus) {
		super();
		this.nNo = nNo;
		this.nType = nType;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nDate = nDate;
		this.memberNo = memberNo;
		this.modifyDate = modifyDate;
		this.nStatus = nStatus;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public int getnType() {
		return nType;
	}

	public void setnType(int nType) {
		this.nType = nType;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getnStatus() {
		return nStatus;
	}

	public void setnStatus(int nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nType=" + nType + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nDate="
				+ nDate + ", memberNo=" + memberNo + ", modifyDate=" + modifyDate + ", nStatus=" + nStatus + "]";
	}

}
