package com.infotop.controller;

import com.infotop.service.CircleService;
import com.infotop.utils.Result;
import com.infotop.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Dengjb
 * @since 2019-03-12
 */
@RestController
@CrossOrigin
@RequestMapping("/circle")
public class CircleController {

	@Autowired
	private CircleService circleService;


	@RequestMapping(path = "/getMyCreateCircle")
//	@RequiresRoles("admin")
	public Result getMyCreateCircle() {
		return ResultUtil.success(circleService.selectList(null));
	}
}
