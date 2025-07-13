package com.cognizant.main;

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

        // Load the Spring XML configuration
        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");

        // Get the list of countries
        @SuppressWarnings("unchecked")
        List<Country> countryList = (List<Country>) context.getBean("countryList");

        // Display countries using INFO instead of DEBUG so it appears in console
        for (Country country : countryList) {
            LOGGER.info(country.toString());
        }

        LOGGER.info("END: displayCountries");
    }
}
