package com.infotop.controller;

import com.infotop.service.CircleService;
import com.infotop.utils.Result;
import com.infotop.utils.ResultUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
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
@Api(tags="兴趣圈API")
public class CircleController {

	@Autowired
	private CircleService circleService;

	@ApiOperation(value="获取用户创建的圈子", notes="根据传递参数获取")
	@ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "string", paramType = "query")

	@PostMapping(path = "/getMyCreateCircle")
//	@RequiresRoles("admin")
	public Result getMyCreateCircle() {
		return ResultUtil.success(circleService.selectList(null));
	}
}
