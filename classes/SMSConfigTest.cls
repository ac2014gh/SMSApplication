/*
* Tests for the SMSConfig class
* Author: Anil Lobo [www.cloudkaam.com]
* License: The MIT License (MIT)
* Copyright (c) 2016 Anil Lobo
*/
@isTest
private class SMSConfigTest {

    static testMethod void testGetConfig() {
        SMSConfig.getConfig();
        System.assert(String.isNotBlank(SMSConfig.baseURI));
        System.assert(String.isNotBlank(SMSConfig.username));
        System.assert(String.isNotBlank(SMSConfig.apiToken));
        
    }
}