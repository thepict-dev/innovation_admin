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

import java.util.ArrayList;
import java.util.List;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface PictService {
	List<?> reference_list(PictVO pictVO) throws Exception;

	PictVO reference_list_one(PictVO pictVO) throws Exception;

	void reference_update(PictVO pictVO) throws Exception;

	void reference_insert(PictVO pictVO) throws Exception;

	void reference_delete(PictVO pictVO) throws Exception;

	void reference_file_delete(PictVO pictVO) throws Exception;

	List<?> news_list(PictVO pictVO) throws Exception;

	PictVO news_list_one(PictVO pictVO) throws Exception;

	void news_update(PictVO pictVO) throws Exception;

	void news_insert(PictVO pictVO) throws Exception; 

	void news_delete(PictVO pictVO) throws Exception;

	List<?> history_list(PictVO pictVO) throws Exception;

	PictVO history_list_one(PictVO pictVO) throws Exception;

	void history_update(PictVO pictVO) throws Exception;

	void history_insert(PictVO pictVO) throws Exception;

	void history_delete(PictVO pictVO) throws Exception;

	List<?> user_list(PictVO pictVO) throws Exception;

	PictVO user_list_one(PictVO pictVO) throws Exception;

	void user_update(PictVO pictVO) throws Exception;

	void user_insert(PictVO pictVO) throws Exception;

	void user_delete(PictVO pictVO) throws Exception;

	void user_file_delete(PictVO pictVO) throws Exception;

	void history_file_delete(PictVO pictVO) throws Exception;

	//컨텐츠관리 - 띠배너
	List<?> board_list(PictVO pictVO) throws Exception;

	PictVO board_list_one(PictVO pictVO) throws Exception;

	void board_update(PictVO pictVO) throws Exception;

	void board_insert(PictVO pictVO) throws Exception;

	void board_delete(PictVO pictVO) throws Exception;

	void board_cng(PictVO pictVO) throws Exception;

	PictVO video_list_one(PictVO pictVO) throws Exception;

	void video_update(PictVO pictVO) throws Exception;

	List<?> patrol_list(PictVO pictVO) throws Exception;

	PictVO user_duple(PictVO pictVO) throws Exception;

	List<?> superstar_list(PictVO pictVO) throws Exception;

	List<?> superstar_vote(PictVO pictVO) throws Exception;

	void superstar_cng_yton(PictVO pictVO) throws Exception;
	
	void superstar_cng_ntoy(PictVO pictVO) throws Exception;

	void superstar_delete(PictVO pictVO) throws Exception;

	PictVO superstar_list_one(PictVO pictVO) throws Exception;

	List<?> finish_list(PictVO pictVO) throws Exception;

	void finish_cng_yton(PictVO pictVO) throws Exception;

	void finish_cng_ntoy(PictVO pictVO) throws Exception;

	void user_reset(PictVO pictVO) throws Exception;

	List<?> bwf_list(PictVO pictVO) throws Exception;

	List<?> wesp_list(PictVO pictVO) throws Exception;

	List<?> best_list(PictVO pictVO) throws Exception;

	PictVO brand_list_one(PictVO pictVO) throws Exception;

	void brand_update(PictVO pictVO) throws Exception;

	List<PictVO> get_user_list(PictVO pictVO) throws Exception;

	void test_time(PictVO pictVO) throws Exception;


}
