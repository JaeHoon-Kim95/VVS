
package com.vvs.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Arrays;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.vvs.shop.cmn.Message;
import com.vvs.shop.orders.OrdersService;
import com.vvs.shop.orders.OrdersVO;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)

@WebAppConfiguration

@RunWith(SpringJUnit4ClassRunner.class) // 스프랭 테스트 컨텍스트 프레임워크의 JUnit기능 확장

@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class TestOrdersController {
	final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	WebApplicationContext webApplicationContext;

	@Autowired
	OrdersService ordersService;

	List<OrdersVO> orders;

	// Mock
	MockMvc mockMvc;

	@Before
	public void setUp() throws Exception {
		orders = Arrays.asList(new OrdersVO(4, "jhs", 2, 1, "",""), new OrdersVO(5, "jhs1", 3, 1, "",""));
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		LOG.debug("=mockMvc=" + mockMvc);
		assertThat(mockMvc, is(notNullValue()));
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void doInsert() throws Exception {
		OrdersVO ordersVO = orders.get(0);
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/orders/doInsert.do")
				.param("orderNum", ordersVO.getOrderNum() + "")
				.param("memberId", ordersVO.getMemberId())
				.param("productNum", ordersVO.getProductNum() + "")
				.param("qty", ordersVO.getQty() + "");
		ResultActions resultActions = mockMvc.perform(createMessage).andExpect(status().is2xxSuccessful());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		Gson gson = new Gson();

		Message message = gson.fromJson(result, Message.class);
		LOG.debug("=orders doInsert message=" + message);
	}

	@Test

	@Ignore // 성공
	public void doDelete() throws Exception {
		OrdersVO ordersVO = orders.get(0);
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/orders/doDelete.do")
				.param("orderNum", ordersVO.getOrderNum() + "");
		ResultActions resultActions = mockMvc.perform(createMessage).andExpect(status().is2xxSuccessful());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		Gson gson = new Gson();

		Message message = gson.fromJson(result, Message.class);
		LOG.debug("=orders doDelete message=" + message);
	}

	@Test

	@Ignore // 성공
	public void doUpdate() throws Exception {
		OrdersVO ordersVO = orders.get(0);
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/orders/doUpdate.do")
				.param("orderNum", ordersVO.getOrderNum() + "").param("memberId", ordersVO.getMemberId())
				.param("productNum", ordersVO.getProductNum() + "").param("qty", ordersVO.getQty() + "");
		ResultActions resultActions = mockMvc.perform(createMessage).andExpect(status().is2xxSuccessful());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		Gson gson = new Gson();

		Message message = gson.fromJson(result, Message.class);
		LOG.debug("=orders doDelete message=" + message);
	}

	@Test
	@Ignore
	// 성공
	public void doSelectOne() throws Exception {
		OrdersVO ordersVO = orders.get(0);
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.get("/orders/doSelectOne.do")
				.param("orderNum", ordersVO.getOrderNum() + "");
		ResultActions resultActions = mockMvc.perform(createMessage).andExpect(status().is2xxSuccessful());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		Gson gson = new Gson();

		Message message = gson.fromJson(result, Message.class);
		LOG.debug("=orders doDelete message=" + message);
	}

	@Test // 성공
	public void doSelectList2() throws Exception {
		OrdersVO ordersVO = orders.get(0);
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.get("/orders/doSelectList2.do")
				.param("memberId", ordersVO.getMemberId());
		ResultActions resultActions = mockMvc.perform(createMessage).andExpect(status().is2xxSuccessful());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();

		LOG.debug("=orders doSelectList message=" + result);
	}
}
