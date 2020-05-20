package com.project_Ma.home.DAO;

public interface CommandMemberShipService {
	//회원가입(유저)
	public int userInsert(int user_no);
	//회원가입(기업)
	public int coporateInsert(int user_no);
	
}
	