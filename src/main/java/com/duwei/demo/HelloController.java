package com.duwei.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${spring.application.name}")
    private String appName;

    @Value("${server.port}")
    private String port;

    @Value("${project.ip}")
    private String ip;
    @GetMapping("/")
    public String hello(){
        return appName+":"+port+":IP:"+ip;
    }
}
