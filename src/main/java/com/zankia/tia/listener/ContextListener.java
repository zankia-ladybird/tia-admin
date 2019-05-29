package com.zankia.tia.listener;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ContextListener implements ServletContextListener {

    final ScheduledExecutorService scheduExec = Executors.newScheduledThreadPool(2);
    private static final Logger LOGGER = LoggerFactory.getLogger(ContextListener.class);

    public void contextInitialized(ServletContextEvent se) {
        LOGGER.info("webapp server is started!");
    }

    public void contextDestroyed(ServletContextEvent sce) {
    }

}
