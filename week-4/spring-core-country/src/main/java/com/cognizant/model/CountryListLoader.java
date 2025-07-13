package com.cognizant.model;

import java.util.List;

import com.cognizant.model.Country;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CountryListLoader {

    private static final Logger LOGGER = LoggerFactory.getLogger(CountryListLoader.class);

    public static void main(String[] args) {
        LOGGER.info("START: displayCountries");

        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");

        @SuppressWarnings("unchecked")
        List<Country> countryList = (List<Country>) context.getBean("countryList");

        for (Country country : countryList) {
            LOGGER.debug(country.toString());
        }

        LOGGER.info("END: displayCountries");
    }
}
