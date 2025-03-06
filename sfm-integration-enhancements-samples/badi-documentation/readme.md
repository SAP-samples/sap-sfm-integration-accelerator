# BAdI Technical Documentation

## **/VPCOE/ADJUST_DATA_RETRIEVAL**

### **Use**
The Business Add-In (BAdI) `/VPCOE/ADJUST_DATA_RETRIEVAL`, assigned to Enhancement Spot `/VPCOE/ADJUST_API_TO_CLOUD`, is used to adjust the data during the upload of data from source to the API of SAP Sustainability Footprint Management (SFM). Its main task is to provide an extensibility mechanism to integrate customer-specific implementations, allowing for:
- Custom data retrieval from different sources.
- Mapping of data attributes to interface attributes.
- Mapping of values to the required format for replication.

This BAdI is useful if you prefer different source data for entity selection or need to add custom attributes.

### **Reports Using This BAdI**
This BAdI is used in the following reports:
- `/vpcoe/sfm_configuration_data` - Send Configuration Data to SFM
- `/vpcoe/sfm_organization_data` - Send Organization Data to SFM
- `/vpcoe/sfm_periodic_doc` - Send Periodic Data to SFM
- `/vpcoe/sfm_product` - Send Product Data to SFM
- `/vpcoe/sfm_supplier` - Send Supplier Data to SFM

When one of these reports is executed, the BAdI is triggered, allowing a customer-specific implementation to fetch data, adjust attribute mapping, and modify value mapping.

### **Requirement**
For more information about the standard settings for this BAdI, such as filters, single or multiple uses, see the **Spot Element Definitions** tab in the BAdI Builder (`SE18` transaction).

### **BAdI Methods**
The BAdI is active in the **Integration Accelerator Package** and includes the following methods from interface `/VPCOE/IF_ADJ_DATA_RETRIEVAL`:

- **`SKIP_SELECTION`**
  - Allows skipping VPCOE data selection. In this case, data selection must be handled by customer logic in the `ADJUST_DATA_RETRIEVAL` method.

- **`ADJUST_DATA_RETRIEVAL`**
  - Enables customer-specific data selection or adjustments to selected raw data.

- **`ADJUST_JSON`**
  - Allows modification of the JSON payload according to customer-specific requirements.

- **`ADJUST_MAPPING`**
  - Allows changing or overwriting the VPCOE mapping from data source to JSON structure.

- **`GET_EXT_DATA`**
  - Not required for SFM.

- **`ADJUST_TEXT_MAPPING`**
  - Enables modification of the mapping from data source to JSON structure for the `TEXT` sub-node.

- **`ADJUST_BUILD_WHERE_FOR_VARIANT`**
  - Allows customization of the WHERE clause as per specific requirements.

### **BAdI Implementations**
The BAdI implementation must be defined by the user and is **not** provided by SAP. As an example, see class `/VPCOE/CL_ADJUST_API_SFM_EXMPL`.

---
© 2024 SAP SE or an SAP affiliate company. All rights reserved.