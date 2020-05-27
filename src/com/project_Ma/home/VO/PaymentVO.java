
package com.project_Ma.home.VO;

public class PaymentVO {
	private int payment_no;
	private String user_id;
	private String user_name;
	private int cam_no;
	private int reward_no;
	private int funding_price;
	private int add_price;
	private int price_anonymous=0;//0:공개 1:비공개
	private int name_anonymous=0;//0:공개 1:비공개
	private int mileage;
	private int total_price;
	private String donate_date;
	
	private String reward_addr_num;//우편번호
	private String reward_addr_main;//주소
	private String reward_addr_sub;//상세주소
	
	private String reward_email;
	private String id;
	private String domain;
	
	private String reward_phone;
	private String reward_phone1;
	private String reward_phone2;
	
	private String reward_tel;
	private String reward_tel1;
	private String reward_tel2;
	private String reward_tel3;
	
	private String payment_status;//결제상태
	private String delivery_date;//배송날짜
	private int delivery_no;//운송장번호
	private String delivery_memo;//배송메모
	private String delivery_date_detail;
	private String reciever;//수취인
	private int delivery_price;
	private int payment_card_num;//결제카드 끝에 4자리 번호
	
	public PaymentVO() {
	}
	
	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getCam_no() {
		return cam_no;
	}

	public void setCam_no(int cam_no) {
		this.cam_no = cam_no;
	}

	public int getReward_no() {
		return reward_no;
	}

	public void setReward_no(int reward_no) {
		this.reward_no = reward_no;
	}
	public int getFunding_price() {
		return funding_price;
	}

	public void setFunding_price(int funding_price) {
		this.funding_price = funding_price;
	}

	public int getAdd_price() {
		return add_price;
	}

	public void setAdd_price(int add_price) {
		this.add_price = add_price;
		total_price = add_price + funding_price;
	}

	public int getPrice_anonymous() {
		return price_anonymous;
	}

	public void setPrice_anonymous(int price_anonymous) {
		this.price_anonymous = price_anonymous;
	}

	public int getName_anonymous() {
		return name_anonymous;
	}

	public void setName_anonymous(int name_anonymous) {
		this.name_anonymous = name_anonymous;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getDonate_date() {
		return donate_date;
	}

	public void setDonate_date(String donate_date) {
		this.donate_date = donate_date;
	}

	public String getReward_addr_num() {
		return reward_addr_num;
	}

	public void setReward_addr_num(String reward_addr_num) {
		this.reward_addr_num = reward_addr_num;
	}

	public String getReward_addr_main() {
		return reward_addr_main;
	}

	public void setReward_addr_main(String reward_addr_main) {
		this.reward_addr_main = reward_addr_main;
	}

	public String getReward_addr_sub() {
		return reward_addr_sub;
	}

	public void setReward_addr_sub(String reward_addr_sub) {
		this.reward_addr_sub = reward_addr_sub;
	}
	
	
	public String getReward_email() {
		return id+"@"+domain;
	}

	public void setReward_email(String reward_email) {
		this.reward_email = reward_email;
		int idx = reward_email.indexOf("@");
		id = reward_email.substring(0, idx);
		domain = reward_email.substring(idx+1);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getReward_phone() {
		return "010"+"-"+reward_phone1+"-"+reward_phone2;
	}

	public void setReward_phone(String reward_phone) {
		this.reward_phone = reward_phone;
		String phone[] = reward_phone.split("-");
		reward_phone1 = phone[1];
		reward_phone2 = phone[2];
	}
	public String getReward_phone1() {
		return reward_phone1;
	}

	public void setReward_phone1(String reward_phone1) {
		this.reward_phone1 = reward_phone1;
	}

	public String getReward_phone2() {
		return reward_phone2;
	}

	public void setReward_phone2(String reward_phone2) {
		this.reward_phone2 = reward_phone2;
	}

	public String getReward_tel() {
		if((reward_tel2 == null || reward_tel2=="") || (reward_tel3==null || reward_tel3=="")) {
			reward_tel ="";
			return reward_tel;
		}else {
			return reward_tel1+"-"+reward_tel2+"-"+reward_tel3;
		}
	}

	public void setReward_tel(String reward_tel) {
		this.reward_tel = reward_tel;
		String tel[] = reward_tel.split("-");
		reward_tel1 = tel[0];
		reward_tel2 = tel[1];
		reward_tel3 = tel[2];
	}
	
	public String getReward_tel1() {
		return reward_tel1;
	}

	public void setReward_tel1(String reward_tel1) {
		this.reward_tel1 = reward_tel1;
	}

	public String getReward_tel2() {
		return reward_tel2;
	}

	public void setReward_tel2(String reward_tel2) {
		this.reward_tel2 = reward_tel2;
	}

	public String getReward_tel3() {
		return reward_tel3;
	}

	public void setReward_tel3(String reward_tel3) {
		this.reward_tel3 = reward_tel3;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public String getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}

	public int getDelivery_no() {
		return delivery_no;
	}

	public void setDelivery_no(int delivery_no) {
		this.delivery_no = delivery_no;
	}

	public String getDelivery_memo() {
		return delivery_memo;
	}

	public void setDelivery_memo(String delivery_memo) {
		this.delivery_memo = delivery_memo;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public String getDelivery_date_detail() {
		return delivery_date_detail;
	}

	public void setDelivery_date_detail(String delivery_date_detail) {
		this.delivery_date_detail = delivery_date_detail;
	}

	public int getDelivery_price() {
		return delivery_price;
	}

	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
	}

	public int getPayment_card_num() {
		return payment_card_num;
	}

	public void setPayment_card_num(int payment_card_num) {
		this.payment_card_num = payment_card_num;
	}
	
	
}
