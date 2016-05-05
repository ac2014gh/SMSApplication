/*
* Load the configuration settings from the SMS Application Setting custom metadata setting
* Author: Anil Lobo [www.cloudkaam.com]
* License: The MIT License (MIT)
* Copyright (c) 2016 Anil Lobo
*/
public with sharing class SMSConfig {
   	public static String baseURI;
	public static String username;
	public static String apiToken;
	
	public static void getConfig() {
		
		Map<String, String> configMap = new Map<String, String>();
		for (SMS_Application_Setting__mdt eachConfig : [select DeveloperName, Value__c from SMS_Application_Setting__mdt]){
			configMap.put(eachConfig.DeveloperName, eachConfig.Value__c);
		}

		baseURI = configMap.get('Base_URL');
		username = configMap.get('Username');
		apiToken = configMap.get('API_Key');
		
		checkConfig();
	}
	
	public static void checkConfig() {
		if (baseURI==null) {
			throw new SMSException('SMS Application Setting custom metadata Base_URL not found');
		}
		if (username==null) {
			throw new SMSException('SMS Application Setting custom metadata Username not found');
		}
		if (apiToken==null) {
			throw new SMSException('SMS Application Setting custom metadata API_Key not found');
		}
	}
	
	 
}