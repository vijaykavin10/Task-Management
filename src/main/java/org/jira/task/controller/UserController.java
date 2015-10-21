package org.jira.task.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jira.task.config.constants;
import org.jira.task.service.UserService;
import org.jira.task.table.User;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import flexjson.JSONSerializer;

@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;

	public final String EXCLUDE[] = { "*.class" };

	/*
	 * @RequestMapping(value = "/get", method = RequestMethod.GET) public
	 * ModelAndView getUser(HttpServletRequest request,
	 * @RequestParam(value="userName", required=true) String userName,
	 * HttpServletResponse response) throws JSONException { ModelAndView model =
	 * new ModelAndView("model"); User user = userService.getUser(userName);
	 * JSONSerializer ser = new JSONSerializer(); ser.exclude(EXCLUDE);
	 * model.addObject("model",ser.serialize(user)); return model; }
	 */

	@RequestMapping(value = "{userName}/get", method = RequestMethod.GET)
	public ModelAndView getUser(HttpServletRequest request, @PathVariable("userName") String userName, HttpServletResponse response) throws JSONException {
		ModelAndView model = new ModelAndView("model");
		User user = userService.getUser(userName);
		JSONSerializer ser = new JSONSerializer();
		ser.exclude(EXCLUDE);
		model.addObject("model", ser.serialize(user));
		return model;
	}

	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, @RequestParam(value = "userName", required = true) String userName, @RequestParam(value = "password", required = true) String password,
			HttpServletResponse response) {
		if (!userService.validateUser(userName, password)) {
			return prepareLoginPageModel(constants.INVALID_MESSAGE);
		}
		return prepareHomePageModel(userName);
	}

	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public ModelAndView registerPage(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView model = new ModelAndView("register");
		return model;
	}

	@RequestMapping(value = "/{userName}/create", method = RequestMethod.POST)
	public ModelAndView registerUser(
			HttpServletRequest request,
			@PathVariable(value="userName") String currentUserName,
			@RequestParam(value = "firstName", required = true) String firstName,
			@RequestParam(value = "lastName", required = true) String lastName,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "userName", required = true) String userName,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "userType", required = true) String userType,
			HttpServletResponse response) {
		userService.insertUser(createUserModel(firstName, lastName, email, userName, password, userType));
		return prepareUserView(currentUserName);
	}

	@RequestMapping(value = "{userName}/test", method = RequestMethod.POST)
	public ModelAndView test(HttpServletRequest request, @PathVariable("userName") String userName, @RequestParam int selectedString, HttpServletResponse response) {
		System.out.println("=====>>>selectedString ====>>>" + selectedString);
		return prepareHomePageModel(userName);
	}
	
	@RequestMapping(value = "{userName}/getToHome", method = RequestMethod.GET)
	public ModelAndView showHomePage(HttpServletRequest request, @PathVariable("userName") String userName, HttpServletResponse response) {
		return prepareHomePageModel(userName);
	}
	
	@RequestMapping(value = "{userName}/{key}/getToTaskPage", method = RequestMethod.GET)
	public ModelAndView getAllTask(HttpServletRequest request, @PathVariable("key") String key, @PathVariable("userName") String userName, HttpServletResponse response) {
		return prepareTaskPageModel(userName, key);
	}
	
	@RequestMapping(value="/{userName}/getView")
	public ModelAndView getToUserPage(HttpServletRequest request, @PathVariable(value = "userName") String userName, HttpServletResponse response) {
		return prepareUserView(userName);
	}
	
	@RequestMapping(value="/{userName}/view")
	public ModelAndView getView(HttpServletRequest request, @PathVariable(value = "userName") String userName, HttpServletResponse response) {
		return prepareUserView(userName);
	}
	
}