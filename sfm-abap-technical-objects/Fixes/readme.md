# SAP SFM Integration Accelerator - Fixes

This document provides details on the fixes available in the **Fixes** folder. All customers must ensure they install the latest fixes to maintain compatibility and resolve known issues.

## **Available Fixes**

### **Fix: TR 900101.PCF and TR 910061.PCF - custom code for handling JSON objects**
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

 
---
### **Installation Instructions for fixes**
To apply available fixes:
1. Ensure that the base **SFM Integration Accelerator** package is installed.
2. Import all available TRs in [the specified order](/sfm-abap-technical-objects#apply-fixes-mandatory-for-all-installations) using your transport management system.


_Note: Additional fixes and new features will be added in the future. Customers should always check for the latest available fixes/features and ensure they are installed._

---


