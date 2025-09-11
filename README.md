[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/sap-sfm-integration-accelerator)](https://api.reuse.software/info/github.com/SAP-samples/sap-sfm-integration-accelerator)

# SAP SFM Integration Accelerator


## Description

The SAP Sustainability Footprint Management (SFM) Integration Accelerator is an ABAP package designed to streamline the integration of SAP SFM with backend ECC systems or older S/4HANA systems. The package includes prebuilt integration content that allows for selection, extraction, and replication of relevant data into the cloud-based SFM solution via standard SFM push APIs.

The code in the ABAP package can be used as it is published in this repository, or you can use it as a sample reference for your own implementation. However, if you require support, you must use it as it is and enhance it if needed via BAdI implementation.

## Requirements

- SAP ERP ECC 6.0 EHP7 SP16 (or later)/EHP8 or S/4HANA 1909/2021.
- Minimum SAP\_BASIS 740 (Package Level 0019 or higher).
- Access to SAP Business Technology Platform (BTP) for creating SFM replication services.
  - More details on [BTP configurations](https://help.sap.com/docs/sustainability-footprint-management/sap-sustainability-footprint-management-b3e39aed098c41a2b0d49db0caf80711/initial-setup).

## Features

- Preconfigured ABAP reports for data replication.
- Compatibility with master data and transactional data.
- Support for both initial and delta data loads as well as single entity reload.
- Error handling and logging capabilities, including reprocessing failed payloads.
- Extensibility for customer-specific adaptations and sample BAdI implementation

### **Sample Implementation**
A sample implementation of this BAdI is provided in the repository **[`sample_badi_implementation.abap`](sfm-integration-enhancements-samples/sample%20badi%20implementation.abap)**. This file serves as a reference for customers looking to create their own implementations.
)

## Download and Installation

To install/update the SFM Integration Accelerator package:

1. Upload the provided transport files using transaction **CG3Z** or any relevant function modules/tcodes in your system.
2. Import transport requests in the specified sequence (see [installation steps](sfm-abap-technical-objects/readme.md) ).
3. Perform the configuration steps described in the [SFM Integration Accelerator Guide](Documentation/SAP_VP_SFM_Integration%20Accelerator_ConfigGuide_v2_1.pdf).
   - Ensure all prerequisites for initial setup on BTP account and subaccount are fulfilled (More details on [BTP configurations](https://help.sap.com/docs/sustainability-footprint-management/sap-sustainability-footprint-management-b3e39aed098c41a2b0d49db0caf80711/initial-setup) ).
   - Configure RFC destinations (**SM59**) for HTTPS communication with the SFM API.
   - Maintain service path prefixes (optional).
   - Create and activate change pointers (optional).
   - Add maximum limit on data replication (optional).
   

## Usage

The integration package provides several reports for required data replication, including:

### **Master Data**

- Supplier data
- Business Partner 
- Product data
- Custom Temperature Conditions
- Organizational Data (Company, Plant, Valuation Area, Controlling Area, Cost Center, Activity, Project, Production Document, Resource)
- Configuration Data (Unit of Measure, Unit of Measure Dimension, Country, Region, Product Group, Product Type, Currency)

### **Periodicity Master Data**

- Period Variant
- Fiscal Period
- Ledger
- Currency Conversion (Exchange Rate Data, Exchange Rate Factors, Exchange Rate Quotation, Exchange Rate Type)

### **Transactional Data**

- Goods receipts and returns
- Goods movements for production, cost centers, and projects
- Internal service confirmations
- Opening stock

For a complete list of reports and instructions on how to load the data, refer to the [SFM Integration Accelerator Guide](Documentation/SAP_VP_SFM_Integration%20Accelerator_ConfigGuide_v2_1.pdf).

## BAdI Technical Documentation

For extending data retrieval and mapping functionality, the **BAdI `/VPCOE/ADJUST_DATA_RETRIEVAL`** can be implemented. More details about this BAdI and its usage can be found in the **[BAdI Technical Documentation](sfm-integration-enhancements-samples/badi-documentation)** and in the [SFM Integration Accelerator Guide](Documentation/SAP_VP_SFM_Integration%20Accelerator_ConfigGuide_v2_1.pdf).

## Security

All replication endpoints are secured using TLS (HTTPS) to ensure encryption of customer data during transmission.
SSL certificates and the TLS handshake process establish trust between the communicating systems.

Access to the API is secured using authorization mechanisms based on the XSUAA (SAP Authorization and Trust Management) component, leveraging the OAuth 2.0 client credentials grant.
XSUAA serves as the central identity provider on SAP BTP, managing authentication and authorization.

Through the SFM service broker, customers create a service instance, allowing them to obtain an access token for replication.

## Known Issues

- Only English and Japanese languages are supported as of now.

## Contributing

This project is maintained and updated exclusively by SAP employees. External contributions, such as pull requests, are not accepted. However, we encourage users to submit bug reports and feature requests via SAP Support.


## How to Obtain Support

If you encounter issues or have questions, you can submit a support ticket via SAP ONE Support Launchpad: [SAP ONE Support Launchpad](https://support.sap.com/en/index.html):

- **Ticket Component:** SV-COE-VPT-PFM

  **Important Note:** Support on any standard code issues on integration accelerator is only offered for the latest code available in this repository. Customers must ensure that the latest transport requests (TRs) are installed on their system before reporting any issues. If an issue persists after updating to the latest version/latest TR available, a support ticket should be raised. Support is not provided for older versions where the latest updates have not been applied.

## Importance of Regular Updates for Integration Accelerator

Due to the rapid evolution of SFM, it is highly recommended that customers update their Integration Accelerator package regularly. Regular updates ensure compatibility with the latest features and enhancements in SFM.

## License

Copyright (c) 2025 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.

