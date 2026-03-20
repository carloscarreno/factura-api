package com.igp.factura.config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class CorsConfig {

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        //.allowedOrigins(
                        //        "http://localhost:5173",
                        //        "http://localhost:3000"
                        // )
                        .allowedMethods("*")
                        .allowedHeaders("*");
            }
        };
    }
}