package com.example.baseball;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@Transactional
@SpringBootTest
class BaseballApplicationTests {


	private Logger logger = LoggerFactory.getLogger(BaseballApplicationTests.class);
	@Autowired
	private ApplicationContext ctx;

	@Test
	@DisplayName("IoC컨테이너 정상 동작 확인")
	void contextLoads() {
		assertThat(logger).isNotNull();
		assertThat(ctx).isNotNull();
	}

}
