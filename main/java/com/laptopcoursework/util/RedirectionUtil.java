package com.laptopcoursework.util;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class RedirectionUtil {

	private static final String baseUrl = "/";
	public static final String registerUrl = baseUrl + "register";
	public static final String loginUrl = baseUrl + "login";
	public static final String homeUrl = baseUrl + "home";

	public void setMsgAttribute(HttpServletRequest req, String msgType, String msg) {
		req.setAttribute(msgType, msg);
	}

	public void redirectToPage(HttpServletRequest req, HttpServletResponse resp, String page)
			throws ServletException, IOException {
		req.getRequestDispatcher(page).forward(req, resp);
	}

	public void setMsgAndRedirect(HttpServletRequest req, HttpServletResponse resp, String msgType, String msg,
			String page) throws ServletException, IOException {
		setMsgAttribute(req, msgType, msg);
		redirectToPage(req, resp, page);
	}

}