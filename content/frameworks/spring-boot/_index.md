---
title: "Spring Boot"
date: 2021-02-13T14:47:51-05:00
draft: false
---

## Spring Boot and Flyway caveats

When attempting to set up the initial application properties file, make sure to **NOT** specify the following

{{<highlight yaml>}}
flyway.url
flyway.user
flyway.password
{{</highlight>}}

IF you already have:

{{<highlight yaml>}}
spring.datasource.url
spring.datasource.username
{{</highlight>}}

If you do, it will create two data sources and will cause confusion! Only specify `spring.datasource.*`

## Logging

### Turn off debug logs in Spring Boot testing

{{<highlight xml>}}
<?xml version="1.0" encoding="UTF-8"?>
<configuration debug="false">
    <statusListener class="ch.qos.logback.core.status.NopStatusListener" />

    ...
</configuration>
{{</highlight>}}

When a spring boot integration test runs, there are debug level logs that pop up
before the Spring Boot banner, here's a way to turn the DEBUG level logs off.

Add `src/main/resources/logback.xml` with the code on the right.

### Logback template

{{<highlight xml>}}
<?xml version="1.0" encoding="UTF-8"?>
<configuration debug="false">
    <!-- optional Nop status listener -->
    <statusListener class="ch.qos.logback.core.status.NopStatusListener" />

    <!-- console and file appenders -->
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <layout class="ch.qos.logback.classic.PatternLayout">
            <Pattern>%d{HH:mm:ss} [%thread] %-5level %logger{36} - %msg%n</Pattern>
        </layout>
    </appender>
    <appender name="FILE_APPENDER" class="ch.qos.logback.core.FileAppender">
        <file>logs/fs.log</file>
        <layout class="ch.qos.logback.classic.PatternLayout">
            <Pattern>%d{HH:mm:ss} [%thread] %-5level %logger{36} - %msg%n</Pattern>
        </layout>
    </appender>

    <!-- logger definitions -->
    <logger name="[package-path]" level="INFO">
        <appender-ref ref="STDOUT" />
        <appender-ref ref="FILE_APPENDER" />
    </logger>

    <!-- root level logger -->
    <root level="ERROR">
        <appender-ref ref="STDOUT" />
    </root>
</configuration>
{{</highlight>}}

Location of placement: `src/main/resources/` and `src/test/resources`

## Load DispatcherServlet on App Start

DispatcherServlet is defined as:

> Central dispatcher for HTTP request handlers/controllers, e.g. for web UI controllers or HTTP-based
> remote service exporters. Dispatches to registered handlers for processing a web request, providing
> convenient mapping and exception handling facilities.

By default, Spring Boot lazily loads the dispatcher servlet on the first HTTP request.

In some cases, the lazy loading can affect user experience and even integration tests.

To switch to eager loading, add this to your Configuration class:

{{<highlight java>}}
@Bean
public static BeanFactoryPostProcessor beanFactoryPostProcessor() {  
    return new BeanFactoryPostProcessor() {
        @Override
        public void postProcessBeanFactory(
                ConfigurableListableBeanFactory beanFactory) throws BeansException {
            BeanDefinition bean = beanFactory.getBeanDefinition(
                    DispatcherServletAutoConfiguration.DEFAULT_DISPATCHER_SERVLET_REGISTRATION_BEAN_NAME);

            bean.getPropertyValues().add("loadOnStartup", 1);
        }
    };
}
{{</highlight>}}
