package com.vvs.shop.cart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CartController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired CartService cartService;
}
