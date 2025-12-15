package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.GetMapping;
import com.framework.annotation.HandlePath;
import com.framework.annotation.HttpMethodType;
import com.framework.annotation.PostMapping;
import com.framework.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

/**
 * Sprint 7: Demonstrates HTTP verb aware routing.
 */
@Controller
public class Sprint7Controller {

    @HandlePath("/sprint7/ping")
    @GetMapping
    public String pingGet() {
        return "Sprint 7 :: GET ping";
    }

    @HandlePath("/sprint7/ping")
    @PostMapping
    public String pingPost() {
        return "Sprint 7 :: POST ping";
    }

    @GetMapping("/sprint7/get-only")
    public String getOnly() {
        return "Sprint 7 :: GET only";
    }

    @PostMapping("/sprint7/post-only")
    public String postOnly() {
        return "Sprint 7 :: POST only";
    }

    @RequestMapping(value = "/sprint7/both", method = {HttpMethodType.GET, HttpMethodType.POST})
    public String bothVerbs() {
        return "Sprint 7 :: GET or POST";
    }

    @HandlePath("/sprint7/any")
    public String fallbackAny(HttpServletRequest request) {
        return "Sprint 7 :: ANY " + request.getMethod();
    }
}
