package com.spring.scheduler.user.dto;

public class UserDTO {
	String uid;
	String pwd;
	String name; 
	String phone1;
	String phone2;
	String phone3;
	String email1;
	String email2;
	String googleid;
	String naverid;
	String emailauthentication;
	
	
	
	
	
	
	@Override
	public String toString() {
		return "UserDTO [uid=" + uid + ", pwd=" + pwd + ", name=" + name + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", email1=" + email1 + ", email2=" + email2 + ", googleid=" + googleid
				+ ", naverid=" + naverid + ", emailauthentication=" + emailauthentication + "]";
	}


	public String getEmailauthentication() {
		return emailauthentication;
	}


	public void setEmailauthentication(String emailauthentication) {
		this.emailauthentication = emailauthentication;
	}


	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getGoogleid() {
		return googleid;
	}
	public void setGoogleid(String googleid) {
		this.googleid = googleid;
	}
	public String getNaverid() {
		return naverid;
	}
	public void setNaverid(String naverid) {
		this.naverid = naverid;
	}
	
	
	
}

