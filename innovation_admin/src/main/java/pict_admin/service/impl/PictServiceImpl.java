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
	public List<?> board_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.board_list(pictVO);
	}

	@Override
	public PictVO board_list_one(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.board_list_one(pictVO);
	}

	@Override
	public void board_update(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.board_update(pictVO);
	}

	@Override
	public void board_insert(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.board_insert(pictVO);
	}

	@Override
	public void board_delete(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.board_delete(pictVO);
	}

	@Override
	public void board_file_delete(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.board_file_delete(pictVO);
	}

	@Override
	public List<?> popup_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.popup_list(pictVO);
	}

	@Override
	public PictVO popup_list_one(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.popup_list_one(pictVO);
	}

	@Override
	public void popup_update(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.popup_update(pictVO);
	}

	@Override
	public void popup_insert(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.popup_insert(pictVO);
	}

	@Override
	public void popup_delete(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.popup_delete(pictVO);
	}

	@Override
	public List<?> program_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.program_list(pictVO);
	}

	@Override
	public PictVO program_list_one(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.program_list_one(pictVO);
	}

	@Override
	public void program_update(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.program_update(pictVO);
	}

	@Override
	public void program_insert(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.program_insert(pictVO);
	}

	@Override
	public void program_delete(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.program_delete(pictVO);
	}

	@Override
	public List<?> event_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.event_list(pictVO);
	}

	@Override
	public PictVO event_list_one(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.event_list_one(pictVO);
	}

	@Override
	public void event_update(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.event_update(pictVO);
	}

	@Override
	public void event_insert(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.event_insert(pictVO);
	}

	@Override
	public void event_delete(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.event_delete(pictVO);
	}

	@Override
	public List<?> data_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.data_list(pictVO);
	}

	@Override
	public PictVO data_list_one(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.data_list_one(pictVO);
	}

	@Override
	public List<?> data_type_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.data_type_list(pictVO);
	}

	@Override
	public void data_update(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.data_update(pictVO);
	}

	@Override
	public void data_insert(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.data_insert(pictVO);
	}

	@Override
	public void data_delete(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.data_delete(pictVO);
	}

	@Override
	public PictVO data_type_list_one(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.data_type_list_one(pictVO);
	}

	@Override
	public void data_type_update(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.data_type_update(pictVO);
	}

	@Override
	public void data_type_insert(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.data_type_insert(pictVO);
	}

	@Override
	public void data_type_delete(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.data_type_delete(pictVO);
	}

	@Override
	public void data_file_delete(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.data_file_delete(pictVO);
	}

	
	
}
