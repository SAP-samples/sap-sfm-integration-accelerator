# SAP SFM Integration Accelerator - Fixes

This document provides details on the fixes available in the **Fixes** folder. All customers must ensure they install the latest fixes to maintain compatibility and resolve known issues.

## **Available Fixes**

### **Fix: TR 901375 ( as a replacement for older TR 900101.PCF and TR 910061.EC6) - custom code for handling JSON objects**
#### **Issue Addressed**
- Resolved an issue where **/UI2/CL_JSON** standard class is not available or is an old version in the system. 
- this is relevant ONLY for NW version 7.4 SP15 or lower

### **Fix: TR 901361.BP7 - Improvements for Re-Processing Failed Payloads report, Periodic data Report, and Goods Transfer entity**
#### **Issue Addressed**
- **Re-Process Failed Payloads Report adjustments**
  - Resolved an issue where customers faced **timeout dumps** when executing the **Re-Process Report for Periodic Data**.
  - Now, all methods within the report execute in the **background**, preventing timeouts and improving performance.

- **Duplicate Issue in Periodic Report**
  - Fixed an issue causing **duplicate records** in the **Periodic Report**, which might led to canceling a replication.

- **Goods Transfer Issue**
  - Fixed incorrect processing of **negative values** in goods transfer transactions.
  - Addressed **source and target plant mismatches** that caused replication errors.
  - Ensured that the system properly maps **source-to-target plants** for goods transfers.

### **Fix: TR 901363.BP7 - Custom Data Retrieval in BAdI**
#### **Issue Addressed**
- This improvement enhances flexibility, especially for scenarios where the standard retrieval does not align with customer-specific requirements. It allows customers to completely skip the standard data retrieval process and execute only custom data retrieval logic implemented in provided BAdI

### **Fix: TR 901366.BP7 - Negative values Handling & Logging Enhancements**
#### **Issue Addressed**
- Fixed incorrect processing of **negative values** in following transactions: Goods Issue for Production, Goods Issue for Customer, Goods Issue Without Reference, Goods Return to Supplier
- Adds Correlation ID to the log output for failed replications. This identifier allows easier investigation and tracing of failed payloads on the SFM side.

### **Update: V2.1 – September 11th 2025**: 

      ### **TR 901392.BP7** 

      ### ✨ Features added
      
	* New Entities Added to Support Transportation Management in SFM:
		- Business Partner (BP) Entity including address and gelocation data 
		- Custom Temperature Condition Entity
		- Temperature Condition Entity (for handling the mapping to SFM temperature codes)
	* Enhancements to Existing Entities:
		- Product Entity extended with Custom Temperature Condition ID
		- Plant Entity extended with Address Details and geolocation data

	
      ### 📘 Documentation
      
      * New version for User guide has been updated with details on the features introduced

### **Fix: TR 901396.BP7 - Handling HTTP Response 426 - Upgrade Required**
#### **Issue Addressed**
- Fixed the outdated HTTP protocol version used when calling SFM APIs during data replication.
- The protocol version is now taken from the RFC connection configuration: Special Option → HTTP Settings.
 
### **Fix: TR 901402.BP7 - **
#### **Issue Addressed**
- Resolved an issue where processing large data sets in the periodic data replication report could result in a runtime dump **SAPSQL_SQLS_INVALID_CURSOR**.

 ❗**Users needs to ensure that the HTTP version for RFC connections used to call the SFM API is set to HTTP 1.1.**

### **Fix: TR 901413.BP7 - HTTP 400 Header Error & Missing Material Document Transactions**
#### **Issue Addressed**
- Resolved an issue where data replication failed with **HTTP Code 400 – incorrect header check**.  
  If you encounter this error during replication, it is mandatory to import this transport request.

- Fixed an issue where in some specific cases, not all business transactions based on Material Documents were transmitted to SFM due to incorrect handling in function module `/VPCOE/STORE_MATERIAL_DATA`.  

### Fix: TR 901418.BP7 – German Translation, and Material Replication Correction

#### Issue Addressed
- **Missing German Translations:**  
  Added missing German-language text elements.

- **Material Replication per Plant:**  
  Corrected logic so material replication is processed independently for each plant.  
  Selection structure (*LS_SEL_OPT-PROD*) is now cleared after each plant iteration to prevent materials from previous plants being incorrectly reused.

### **Update: V2.2 – February 12th 2026**: 

      ### **TR 901419.BP7** 

      ### ✨ Features added
      
	
	# 1. Customer-Level Granularity for Periodic Data

		The following goods movement entities now support optional **Customer-level aggregation**:

		- Goods Issue to Customer  
		- Customer Return  

	# 2. Customer Support in Business Partner Replication

		The Business Partner report now supports replication of **Customers (Role: FLCU01)**.

		- Customer replication is handled exclusively via the Business Partner report.
		- No separate Customer report or API was introduced.
		- No Customer ID selection filter was added.

	# 3. Address Retrieval Enhancement for Supplier and Customer entities (CVI & Non-CVI Support)

		Introduced fallback logic to ensure address compatibility across:

		- ECC with CVI  
		- ECC without CVI or partially rolled out  
		- lower S/4HANA  versions

	
      ### 📘 Documentation
      
      * New version for User guide has been updated with details on the features introduced

### **Update: V2.3 – April 24th 2026**: 

      ### **TR 901457.BP7** 

      ### ✨ Features added

	# 1. Goods Return to Supplier – "Amount" Attribute with its "currencyCode"

	  - Added support for **amount** attribute with its currency in Goods Return to Supplier replication.
		
	# 2. Carbon & Moisture Content Support

	  - Enhanced periodic data replication to support:
 	     - `moistureContent`
 	     - `carbonContentPerUnit`
	  - Applicable for:
  	    - Goods Issue for Production  
 	    - Goods Receipt from Production  

	  - Extended `/VPCOE` structures to allow customer-specific mapping via BAdI `/VPCOE/ADJUST_DATA_RETRIEVAL`.
      - Updated sample BAdI implementation accordingly.
	
	# 3. Performance Improvements for Periodic Data Replication

	  - Resolved memory overflow issues during high-volume data processing (e.g. Goods Issue to Production).
	  - Optimized internal table handling to prevent excessive memory consumption.
		
	# 4. Yearly Replication & Aggregation Fix

	  - Fixed issues in yearly aggregation logic for transactional data.
	  - Ensures correct aggregation results across full-year scenarios.

	# 5. Fiscal Year Interval Correction

	  - Fixed issue for fiscal year variants (e.g. W4 – April to March).
	  - Corrected handling of date intervals spanning across calendar years.

	# 6. Commodity Code Validity Fix

	  - Corrected selection logic for commodity code validity dates.
	  - Ensures correct start/end dates are transferred to SFM.

### **Fix V2.3.1: TR 901469.BP7 – Fiscal Period Correction & Inventory Replication Stability**

#### **Issue Addressed**

- **Fiscal vs Calendar Period Handling Correction**
  - Fixed an issue in periodic data replication where fiscal periods and calendar periods were not handled correctly in certain scenarios.
  - Improved period validation for fiscal year variants that differ from calendar periods.

- **Background Processing Stability Improvement**
  - Improved reliability of temporary data persistence during long-running background jobs.
  - Resolved scenarios where replication jobs completed without transferring expected data in background execution mode.

### **Update V2.3.2: June 30th 2026 
	### **TR 901482.BP7**

	### ✨ Features added
  
* Added the ability to add or remove leading zeros for key identifier fields in Master Data and Transactional Data reports.
  Supported entities:
	- Product
	- Supplier
	- Production Document
	- Project
	- Cost Center
	- Business Partner
  
New Configuration added:
  A new Leading Zeros field has been introduced in the view cluster, allowing users to control the conversion behavior per entity.
This setting allows users to control the conversion behavior individually for each supported entity.

Available options:
- **Keep as Is** – Replicate values without any conversion
- **Add Leading Zeros** – Pad identifiers with leading zeros according to standard formatting
- **Remove Leading Zeros** – Strip leading zeros before replication

### Impact

- Improves flexibility for customer-specific identifier formats
- Reduces the need for custom enhancement implementations for zero-padding logic
- Ensures better consistency between backend ERP data and SFM replicated data

  ### 📘 Documentation
  
  * New version for User guide has been updated with details on the features introduced

---
### **Installation Instructions for fixes**
To apply available fixes:
1. Ensure that the base **SFM Integration Accelerator** package is installed.
2. Import all available TRs in [the specified order](/sfm-abap-technical-objects#apply-fixes-mandatory-for-all-installations) using your transport management system.


_Note: Additional fixes and new features will be added in the future. Customers should always check for the latest available fixes/features and ensure they are installed._

---


