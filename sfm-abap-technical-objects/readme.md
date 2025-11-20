# SAP SFM Integration Accelerator - Installation Guide

## Fresh Installation of SFM Integration Package V2

If you do **not** have an existing version of the SFM Integration Accelerator installed **and** you do **not** have any version of the RDP Integration Accelerator installed in your system, follow these steps:

### **Step 1: Install Technical Objects**
1. Install **SFM ABAP Technical Objects**: 
   - **TR 901356.BP7** (This transport request includes all customizing objects).
2. **Note:**
   - If you are on a lower SAP SP level, you may encounter errors related to the `/UI2/CL_JSON` standard class.
   - You have **two options** to resolve this:
     1. Install SAP Note **2526405 - /UI2/CL_JSON Corrections** via [SAP for Me](https://me.sap.com/notes/2526405) to apply the necessary corrections.
     2. If installing the SAP Note is not possible, you may **ignore** the errors in this transport request (TR) and proceed with the remaining TRs. In this case, the TRs in Step 2 become **mandatory**.

### **Step 2: Apply Fixes (ONLY for NW version 7.4 SP15 or lower)**
- Install the following transport requests:
  - **Fixes -> TR 901375.BP7**
     *(Replaces older TRs 910061.EC6 and 900101.PCF)*
  

## Upgrading from SFM Integration Accelerator V1 to V2

If you already have **SFM Integration Accelerator V1** installed and want to upgrade to **V2**, follow these steps:

### **Step 1: Install Delta Technical Objects**
- Install **SFM ABAP Technical Objects**:
  - **TR 901357.BP7** (This transport request includes delta customizing objects).

### **Step 2: Apply Fixes (ONLY for NW version 7.4 SP15 or lower)**
- Install the following transport requests:
  - **Fixes -> TR 901375.BP7**
---
### Apply Fixes (Mandatory for All Installations)

Regardless of whether you are performing a fresh installation or an update, it is essential to install any available fixes to ensure stability and compatibility.
Details on addressed issues or features can be verified [here](Fixes).  
Install all available fixes and updates/transport requests from [Fixes](Fixes) folder in the specified sequence below:

1. **Fixes -> TR 901361.BP7**
2. **Fixes -> TR 901363.BP7**
3. **Fixes -> TR 901366.BP7**
4. **Update to Version 2.1** (Details on changes introduced in V2.1 are available in the [Fixes](Fixes) folder)<br>
   4.1 **TR 901392.BP7** – General update.<br>

5. **Fixes -> TR 901396.BP7**
	**Note:**
   	- If you are on a lower SAP SP level, you may encounter errors related to the `/UI2/CL_JSON` standard class.
   	In this case, install the following transport requests:
	Fixes -> TR 901375.BP7 (ONLY for NW version 7.4 SP15 or lower)

6. **Fixes -> TR 901402.BP7 ** 

7. **Fixes -> TR 901413.BP7 **

Note: Additional fixes may be provided in the future. Customers should always check for the latest available fixes/updates and ensure they are installed.

---

## Additional Languages Installation (Optional, Can Be Installed After Completing Either Upgrade or Fresh Installation)

* **Japanese Language:**

  * Install **SFM ABAP Technical Objects -> Additional languages -> Japanese -> TR 900310.BP7**

* **German Language:**

  * Install **SFM ABAP Technical Objects -> Additional languages -> German -> TR 901371.BP7**

---


## Notes
- Ensure all transport requests are imported **in the specified sequence**.
- If you encounter issues, open a support ticket via **SAP ONE Support Launchpad**: [SAP ONE Support](https://support.sap.com/en/index.html) using Ticket Component: SV-COE-VPT-PFM.

---
© 2025 SAP SE or an SAP affiliate company. All rights reserved.

