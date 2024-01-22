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
package pict_admin.service.impl;

import java.util.List;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import pict_admin.service.AdminVO;
import pict_admin.service.PictDefaultVO;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("pictService")
public class PictServiceImpl extends EgovAbstractServiceImpl implements PictService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PictServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
//	@Resource(name = "pictDAO")
//	private PictDAO pictDAO;
	// TODO mybatis 사용
    @Resource(name="pictMapper")
	private PictMapper pictMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<?> reference_list(PictVO pictVO) throws Exception {
		return pictMapper.reference_list(pictVO);
	}

	@Override
	public PictVO reference_list_one(PictVO pictVO) throws Exception {
		return pictMapper.reference_list_one(pictVO);
	}

	@Override
	public void reference_update(PictVO pictVO) throws Exception {
		pictMapper.reference_update(pictVO);
		
	}

	@Override
	public void reference_insert(PictVO pictVO) throws Exception {
		pictMapper.reference_insert(pictVO);
	}

	@Override
	public void reference_delete(PictVO pictVO) throws Exception {
		pictMapper.reference_delete(pictVO);
	}

	@Override
	public void reference_file_delete(PictVO pictVO) throws Exception {
		pictMapper.reference_file_delete(pictVO);
	}

	@Override
	public List<?> news_list(PictVO pictVO) throws Exception {
		return pictMapper.news_list(pictVO);
	}

	@Override
	public PictVO news_list_one(PictVO pictVO) throws Exception {
		return pictMapper.news_list_one(pictVO);
	}

	@Override
	public void news_update(PictVO pictVO) throws Exception {
		pictMapper.news_update(pictVO);
		
	}

	@Override
	public void news_insert(PictVO pictVO) throws Exception {
		pictMapper.news_insert(pictVO);
		
	}

	@Override
	public void news_delete(PictVO pictVO) throws Exception {
		pictMapper.news_delete(pictVO);
		
	}

	@Override
	public List<?> history_list(PictVO pictVO) throws Exception {
		return pictMapper.history_list(pictVO);
	}

	@Override
	public PictVO history_list_one(PictVO pictVO) throws Exception {
		return pictMapper.history_list_one(pictVO);
	}

	@Override
	public void history_update(PictVO pictVO) throws Exception {
		pictMapper.history_update(pictVO);
	}

	@Override
	public void history_insert(PictVO pictVO) throws Exception {
		pictMapper.history_insert(pictVO);
	}

	@Override
	public void history_delete(PictVO pictVO) throws Exception {
		pictMapper.history_delete(pictVO);
	}

	@Override
	public List<?> user_list(PictVO pictVO) throws Exception {
		return pictMapper.user_list(pictVO);
	}

	@Override
	public PictVO user_list_one(PictVO pictVO) throws Exception {
		return pictMapper.user_list_one(pictVO);
	}

	@Override
	public void user_update(PictVO pictVO) throws Exception {
		pictMapper.user_update(pictVO);
		
	}

	@Override
	public void user_insert(PictVO pictVO) throws Exception {
		pictMapper.user_insert(pictVO);
		
	}

	@Override
	public void user_delete(PictVO pictVO) throws Exception {
		pictMapper.user_delete(pictVO);
		
	}

	@Override
	public void user_file_delete(PictVO pictVO) throws Exception {
		pictMapper.user_file_delete(pictVO);
		
	}

	@Override
	public void history_file_delete(PictVO pictVO) throws Exception {
		pictMapper.history_file_delete(pictVO);
		
	}

	//컨텐츠관리 - 띠배너
	@Override
	public List<?> board_list(PictVO pictVO) throws Exception {
		return pictMapper.board_list(pictVO);
	}

	@Override
	public PictVO board_list_one(PictVO pictVO) throws Exception {
		return pictMapper.board_list_one(pictVO);
	}

	@Override
	public void board_update(PictVO pictVO) throws Exception {
		pictMapper.board_update(pictVO);
		
	}

	@Override
	public void board_insert(PictVO pictVO) throws Exception {
		pictMapper.board_insert(pictVO);
		
	}

	@Override
	public void board_delete(PictVO pictVO) throws Exception {
		pictMapper.board_delete(pictVO);
		
	}

	@Override
	public void board_cng(PictVO pictVO) throws Exception {
		pictMapper.board_cng(pictVO);
		
	}

	@Override
	public PictVO video_list_one(PictVO pictVO) throws Exception {
		return pictMapper.video_list_one(pictVO);

	}

	@Override
	public void video_update(PictVO pictVO) throws Exception {
		pictMapper.video_update(pictVO);
	}
	
	
	@Override
	public List<?> patrol_list(PictVO pictVO) throws Exception {
		return pictMapper.patrol_list(pictVO);
	}

	@Override
	public PictVO user_duple(PictVO pictVO) throws Exception {
		return pictMapper.user_duple(pictVO);
	}

	@Override
	public List<?> superstar_list(PictVO pictVO) throws Exception {
		return pictMapper.superstar_list(pictVO);
	}

	@Override
	public List<?> superstar_vote(PictVO pictVO) throws Exception {
		return pictMapper.superstar_vote(pictVO);
	}

	@Override
	public void superstar_cng_yton(PictVO pictVO) throws Exception{
		pictMapper.superstar_cng_yton(pictVO);
		
	}
	
	@Override
	public void superstar_cng_ntoy(PictVO pictVO) throws Exception{
		pictMapper.superstar_cng_ntoy(pictVO);
		
	}

	@Override
	public void superstar_delete(PictVO pictVO) throws Exception{
		pictMapper.superstar_delete(pictVO);
		
	}
	
	@Override
	public PictVO superstar_list_one(PictVO pictVO) throws Exception{
		return pictMapper.superstar_list_one(pictVO);
		
	}

	@Override
	public List<?> finish_list(PictVO pictVO) throws Exception {
		return pictMapper.finish_list(pictVO);
	}

	@Override
	public void finish_cng_yton(PictVO pictVO) throws Exception {
		pictMapper.finish_cng_yton(pictVO);
		
	}

	@Override
	public void finish_cng_ntoy(PictVO pictVO) throws Exception {
		pictMapper.finish_cng_ntoy(pictVO);
		
	}

	@Override
	public void user_reset(PictVO pictVO) throws Exception {
		pictMapper.user_reset(pictVO);
	}

	@Override
	public List<?> bwf_list(PictVO pictVO) throws Exception {
		return pictMapper.bwf_list(pictVO);
	}

	@Override
	public List<?> wesp_list(PictVO pictVO) throws Exception {
		return pictMapper.wesp_list(pictVO);
	}
	
	@Override
	public List<?> best_list(PictVO pictVO) throws Exception {
		return pictMapper.best_list(pictVO);
	}

	@Override
	public PictVO brand_list_one(PictVO pictVO) throws Exception {
		return pictMapper.brand_list_one(pictVO);
	}

	@Override
	public void brand_update(PictVO pictVO) throws Exception {
		pictMapper.brand_update(pictVO);
	}

	@Override
	public List<PictVO> get_user_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.get_user_list(pictVO);
	}

	@Override
	public void test_time(PictVO pictVO) throws Exception {
		pictMapper.test_time(pictVO);
	}
	
	
}