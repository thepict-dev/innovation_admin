/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package pict_admin.service;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class PictVO extends PictDefaultVO {

	private static final long serialVersionUID = 1L;

	private int idx;
	private boolean api;
	private String saveType;
	private int order_val;
	private String user_id;
	private String max_idx;
	private String target_table;
	private String reg_date;
	private String key_id;
	private String title;
	private String content;
	private String coin_text;
	private String type;
	private String password;
	private String name;
	private String position_x;
	private String position_y;
	private String position_z;
	private String rotation_x;
	private String rotation_y;
	private String rotation_z;
	private String cloth_id;
	private String face_id;
	private String hair_id;
	private String shoes_id;
	private String body;
	
	private String cloth;
	private String face;
	private String hair;
	private String shoes;
	
	private String use_at;
	private String link_url;
	private String professor;
	private String reg_id;
	private String std_num;
	private String lecture_id;
	
	private String in_date;
	private String out_date;
	private String in_out;
	private String timediff;
	private String category;
	private String category_id;
	private String category_cnt;
	private String week;
	private String id;
	private String email;
	private String nick_name;
	private String mobile;
	private String search_category;
	private String search_name;
	private String search_title;
	
	
	private String search_id;
	private String search_nickname;
	private String search_mobile;
	private String search_email;

	private String whole_timediff;
	private String search_text;
	private String order_by;
	private String active_ty;
	private String campus;
	private String text;
	private String professor_id;
	private String campus_id;
	private String week_cha;
	private String week_count;
	private String zoom_no;
	private String zoom_pw;
	private String time;
	private String url;
	private String file;
	private String video_type;
	private String img_url;
	private String depart;
	private String img_url2;
	private String wish_id;
	private String reply;
	private String title1;
	private String title2;
	private String img_url1;
	private String link_url1;
	private String link_url2;
	private String client;
	private String img_thumb;
	private String img_url3;
	private String img_url4;
	private String img_url5;
	private String team;
	private String position;
	private String name_en;
	private String moto;
	private String year;
	private String del_img_url;
	private String press;
	private String sub_category;
	private String person;
	private String vote;
	private String cnt;
	private String file_url;
	private String brand_title1;
	private String brand_title2;
	private String brand_title3;
	private String brand_title4;
	private String brand_title5;
	private String brand_title6;
	private String brand_link1;
	private String brand_link2;
	private String brand_link3;
	private String brand_link4;
	private String brand_link5;
	private String brand_link6;
	private String ext;
	private String en_title;
	
	
	
	public String getEn_title() {
		return en_title;
	}
	public void setEn_title(String en_title) {
		this.en_title = en_title;
	}
	public String getBrand_title6() {
		return brand_title6;
	}
	public void setBrand_title6(String brand_title6) {
		this.brand_title6 = brand_title6;
	}
	public String getBrand_link6() {
		return brand_link6;
	}
	public void setBrand_link6(String brand_link6) {
		this.brand_link6 = brand_link6;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getBrand_title1() {
		return brand_title1;
	}
	public void setBrand_title1(String brand_title1) {
		this.brand_title1 = brand_title1;
	}
	public String getBrand_title2() {
		return brand_title2;
	}
	public void setBrand_title2(String brand_title2) {
		this.brand_title2 = brand_title2;
	}
	public String getBrand_title3() {
		return brand_title3;
	}
	public void setBrand_title3(String brand_title3) {
		this.brand_title3 = brand_title3;
	}
	public String getBrand_title4() {
		return brand_title4;
	}
	public void setBrand_title4(String brand_title4) {
		this.brand_title4 = brand_title4;
	}
	public String getBrand_title5() {
		return brand_title5;
	}
	public void setBrand_title5(String brand_title5) {
		this.brand_title5 = brand_title5;
	}
	public String getBrand_link1() {
		return brand_link1;
	}
	public void setBrand_link1(String brand_link1) {
		this.brand_link1 = brand_link1;
	}
	public String getBrand_link2() {
		return brand_link2;
	}
	public void setBrand_link2(String brand_link2) {
		this.brand_link2 = brand_link2;
	}
	public String getBrand_link3() {
		return brand_link3;
	}
	public void setBrand_link3(String brand_link3) {
		this.brand_link3 = brand_link3;
	}
	public String getBrand_link4() {
		return brand_link4;
	}
	public void setBrand_link4(String brand_link4) {
		this.brand_link4 = brand_link4;
	}
	public String getBrand_link5() {
		return brand_link5;
	}
	public void setBrand_link5(String brand_link5) {
		this.brand_link5 = brand_link5;
	}
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getVote() {
		return vote;
	}
	public void setVote(String vote) {
		this.vote = vote;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getDel_img_url() {
		return del_img_url;
	}
	public void setDel_img_url(String del_img_url) {
		this.del_img_url = del_img_url;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getImg_thumb() {
		return img_thumb;
	}
	public void setImg_thumb(String img_thumb) {
		this.img_thumb = img_thumb;
	}
	public String getImg_url3() {
		return img_url3;
	}
	public void setImg_url3(String img_url3) {
		this.img_url3 = img_url3;
	}
	public String getImg_url4() {
		return img_url4;
	}
	public void setImg_url4(String img_url4) {
		this.img_url4 = img_url4;
	}
	public String getImg_url5() {
		return img_url5;
	}
	public void setImg_url5(String img_url5) {
		this.img_url5 = img_url5;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}
	public String getMoto() {
		return moto;
	}
	public void setMoto(String moto) {
		this.moto = moto;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getLink_url1() {
		return link_url1;
	}
	public void setLink_url1(String link_url1) {
		this.link_url1 = link_url1;
	}
	public String getLink_url2() {
		return link_url2;
	}
	public void setLink_url2(String link_url2) {
		this.link_url2 = link_url2;
	}
	public String getTitle1() {
		return title1;
	}
	public void setTitle1(String title1) {
		this.title1 = title1;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	public String getImg_url1() {
		return img_url1;
	}
	public void setImg_url1(String img_url1) {
		this.img_url1 = img_url1;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	public String getImg_url2() {
		return img_url2;
	}
	public void setImg_url2(String img_url2) {
		this.img_url2 = img_url2;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getVideo_type() {
		return video_type;
	}
	public void setVideo_type(String video_type) {
		this.video_type = video_type;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getZoom_no() {
		return zoom_no;
	}
	public void setZoom_no(String zoom_no) {
		this.zoom_no = zoom_no;
	}
	public String getZoom_pw() {
		return zoom_pw;
	}
	public void setZoom_pw(String zoom_pw) {
		this.zoom_pw = zoom_pw;
	}
	public String getWeek_cha() {
		return week_cha;
	}
	public void setWeek_cha(String week_cha) {
		this.week_cha = week_cha;
	}
	public String getWeek_count() {
		return week_count;
	}
	public void setWeek_count(String week_count) {
		this.week_count = week_count;
	}
	public String getCampus_id() {
		return campus_id;
	}
	public void setCampus_id(String campus_id) {
		this.campus_id = campus_id;
	}
	public String getProfessor_id() {
		return professor_id;
	}
	public void setProfessor_id(String professor_id) {
		this.professor_id = professor_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
	}
	public String getActive_ty() {
		return active_ty;
	}
	public void setActive_ty(String active_ty) {
		this.active_ty = active_ty;
	}
	public String getOrder_by() {
		return order_by;
	}
	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}
	public String getSearch_text() {
		return search_text;
	}
	public void setSearch_text(String search_text) {
		this.search_text = search_text;
	}
	public String getWhole_timediff() {
		return whole_timediff;
	}
	public void setWhole_timediff(String whole_timediff) {
		this.whole_timediff = whole_timediff;
	}
	public String getSearch_id() {
		return search_id;
	}
	public void setSearch_id(String search_id) {
		this.search_id = search_id;
	}
	public String getSearch_nickname() {
		return search_nickname;
	}
	public void setSearch_nickname(String search_nickname) {
		this.search_nickname = search_nickname;
	}
	public String getSearch_mobile() {
		return search_mobile;
	}
	public void setSearch_mobile(String search_mobile) {
		this.search_mobile = search_mobile;
	}
	public String getSearch_email() {
		return search_email;
	}
	public void setSearch_email(String search_email) {
		this.search_email = search_email;
	}
	public String getSearch_category() {
		return search_category;
	}
	public void setSearch_category(String search_category) {
		this.search_category = search_category;
	}
	public String getSearch_name() {
		return search_name;
	}
	public void setSearch_name(String search_name) {
		this.search_name = search_name;
	}
	public String getSearch_title() {
		return search_title;
	}
	public void setSearch_title(String search_title) {
		this.search_title = search_title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getCategory_cnt() {
		return category_cnt;
	}
	public void setCategory_cnt(String category_cnt) {
		this.category_cnt = category_cnt;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTimediff() {
		return timediff;
	}
	public void setTimediff(String timediff) {
		this.timediff = timediff;
	}
	public String getIn_out() {
		return in_out;
	}
	public void setIn_out(String in_out) {
		this.in_out = in_out;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public String getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(String lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getStd_num() {
		return std_num;
	}
	public void setStd_num(String std_num) {
		this.std_num = std_num;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getUse_at() {
		return use_at;
	}
	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}
	public String getLink_url() {
		return link_url;
	}
	public void setLink_url(String link_url) {
		this.link_url = link_url;
	}
	public String getCloth() {
		return cloth;
	}
	public void setCloth(String cloth) {
		this.cloth = cloth;
	}
	public String getFace() {
		return face;
	}
	public void setFace(String face) {
		this.face = face;
	}
	public String getHair() {
		return hair;
	}
	public void setHair(String hair) {
		this.hair = hair;
	}
	public String getShoes() {
		return shoes;
	}
	public void setShoes(String shoes) {
		this.shoes = shoes;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition_x() {
		return position_x;
	}
	public void setPosition_x(String position_x) {
		this.position_x = position_x;
	}
	public String getPosition_y() {
		return position_y;
	}
	public void setPosition_y(String position_y) {
		this.position_y = position_y;
	}
	public String getPosition_z() {
		return position_z;
	}
	public void setPosition_z(String position_z) {
		this.position_z = position_z;
	}
	public String getRotation_x() {
		return rotation_x;
	}
	public void setRotation_x(String rotation_x) {
		this.rotation_x = rotation_x;
	}
	public String getRotation_y() {
		return rotation_y;
	}
	public void setRotation_y(String rotation_y) {
		this.rotation_y = rotation_y;
	}
	public String getRotation_z() {
		return rotation_z;
	}
	public void setRotation_z(String rotation_z) {
		this.rotation_z = rotation_z;
	}
	public String getCloth_id() {
		return cloth_id;
	}
	public void setCloth_id(String cloth_id) {
		this.cloth_id = cloth_id;
	}
	public String getFace_id() {
		return face_id;
	}
	public void setFace_id(String face_id) {
		this.face_id = face_id;
	}
	public String getHair_id() {
		return hair_id;
	}
	public void setHair_id(String hair_id) {
		this.hair_id = hair_id;
	}
	public String getShoes_id() {
		return shoes_id;
	}
	public void setShoes_id(String shoes_id) {
		this.shoes_id = shoes_id;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getKey_id() {
		return key_id;
	}
	public void setKey_id(String key_id) {
		this.key_id = key_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCoin_text() {
		return coin_text;
	}
	public void setCoin_text(String coin_text) {
		this.coin_text = coin_text;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getTarget_table() {
		return target_table;
	}
	public void setTarget_table(String target_table) {
		this.target_table = target_table;
	}
	public String getMax_idx() {
		return max_idx;
	}
	public void setMax_idx(String max_idx) {
		this.max_idx = max_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getOrder_val() {
		return order_val;
	}
	public void setOrder_val(int order_val) {
		this.order_val = order_val;
	}
	public String getSaveType() {
		return saveType;
	}
	public void setSaveType(String saveType) {
		this.saveType = saveType;
	}
	public boolean isApi() {
		return api;
	}
	public boolean api() {
		return api;
	}
	public void setApi(boolean api) {
		this.api = api;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
	
	
}
