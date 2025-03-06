CLASS /vpcoe/cl_adjust_api_sfm_exmpl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES /vpcoe/if_adj_data_retrieval .
    INTERFACES if_badi_interface .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS /VPCOE/CL_ADJUST_API_SFM_EXMPL IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method /VPCOE/CL_ADJUST_API_SFM_EXMPL->/VPCOE/IF_ADJ_DATA_RETRIEVAL~ADJUST_BUILD_WHERE_FOR_VARIANT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SRV_GRP                     TYPE        /VPCOE/DE_SERVICE_GROUP
* | [--->] IV_SRV_ID                      TYPE        /VPCOE/DE_SERVICE_ID
* | [--->] IV_API_TYPE                    TYPE        /VPCOE/DE_API_TYPE
* | [--->] IV_MODE                        TYPE        /VPCOE/DE_MODE
* | [--->] IO_LOG                         TYPE REF TO /VPCOE/CL_LOG_SFM
* | [<-->] CV_WHERE                       TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD /vpcoe/if_adj_data_retrieval~adjust_build_where_for_variant.

    IF    iv_api_type = /vpcoe/cl_sfm_helper=>sc_api_type-sfm
      AND iv_srv_grp  = /vpcoe/cl_sfm_helper=>sc_grp_id-material_doc
      AND iv_srv_id   = /vpcoe/cl_sfm_helper=>sc_service_id-material_doc.

      CASE iv_srv_id.
        WHEN /vpcoe/cl_sfm_helper=>sc_service_id-issue_for_customer.
          REPLACE `mseg~shkzg = 'H'` IN cv_where WITH `mseg~shkzg = 'S'`.

        WHEN /vpcoe/cl_sfm_helper=>sc_service_id-receipt_from_supplier.
          REPLACE `mseg~lifnr NE ''` IN cv_where WITH `mseg~lifnr = ''`.

      ENDCASE.
    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method /VPCOE/CL_ADJUST_API_SFM_EXMPL->/VPCOE/IF_ADJ_DATA_RETRIEVAL~ADJUST_DATA_RETRIEVAL
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SRV_GRP                     TYPE        /VPCOE/DE_SERVICE_GROUP
* | [--->] IV_SRV_ID                      TYPE        /VPCOE/DE_SERVICE_ID
* | [--->] IV_API_TYPE                    TYPE        /VPCOE/DE_API_TYPE
* | [--->] IS_SEL_OPT                     TYPE        DATA(optional)
* | [--->] IV_LEVEL                       TYPE        /VPCOE/LEVEL(optional)
* | [--->] IV_MODE                        TYPE        /VPCOE/DE_MODE(optional)
* | [--->] IV_SESSION_ID                  TYPE        RAW16(optional)
* | [--->] IV_RUN_ID                      TYPE        /VPCOE/DE_RUN_ID(optional)
* | [--->] IO_LOG                         TYPE REF TO /VPCOE/CL_LOG_SFM(optional)
* | [<-->] CT_DATA                        TYPE        DATA
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD /vpcoe/if_adj_data_retrieval~adjust_data_retrieval.

    DATA: lt_data TYPE /vpcoe/cl_supplier_data_sfm=>gty_t_supplier.

    IF    iv_api_type = /vpcoe/cl_sfm_helper=>sc_api_type-sfm
      AND iv_srv_grp  = /vpcoe/cl_sfm_helper=>sc_grp_id-supplier
      AND iv_srv_id   = /vpcoe/cl_sfm_helper=>sc_service_id-supplier.

      lt_data =  ct_data.
      LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls_data>).
        IF <ls_data>-name = 'test'."'SAP'.
          <ls_data>-name =  <ls_data>-name && '/VPCoE'.
        ENDIF.
      ENDLOOP.
      ct_data = lt_data.
    ENDIF.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method /VPCOE/CL_ADJUST_API_SFM_EXMPL->/VPCOE/IF_ADJ_DATA_RETRIEVAL~ADJUST_JSON
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SRV_GRP                     TYPE        /VPCOE/DE_SERVICE_GROUP
* | [--->] IV_SRV_ID                      TYPE        /VPCOE/DE_SERVICE_ID
* | [--->] IV_API_TYPE                    TYPE        /VPCOE/DE_API_TYPE
* | [--->] IV_RUN_ID                      TYPE        /VPCOE/DE_RUN_ID(optional)
* | [--->] IO_LOG                         TYPE REF TO /VPCOE/CL_LOG_SFM(optional)
* | [<-->] CT_JSON                        TYPE        /VPCOE/CL_HTTP_COMMUNICAT_SFM=>GTY_T_JSON
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD /vpcoe/if_adj_data_retrieval~adjust_json.
    IF    iv_api_type = /vpcoe/cl_sfm_helper=>sc_api_type-sfm
      AND iv_srv_grp  = /vpcoe/cl_sfm_helper=>sc_grp_id-product
      AND iv_srv_id   = /vpcoe/cl_sfm_helper=>sc_service_id-product.

      LOOP AT ct_json ASSIGNING FIELD-SYMBOL(<ls_json>).
        REPLACE ALL OCCURRENCES OF ':""' IN <ls_json>-elements WITH ': null'.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method /VPCOE/CL_ADJUST_API_SFM_EXMPL->/VPCOE/IF_ADJ_DATA_RETRIEVAL~ADJUST_MAPPING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SRV_GRP                     TYPE        /VPCOE/DE_SERVICE_GROUP
* | [--->] IV_SRV_ID                      TYPE        /VPCOE/DE_SERVICE_ID
* | [--->] IS_DATA                        TYPE        DATA
* | [--->] IV_API_TYPE                    TYPE        /VPCOE/DE_API_TYPE
* | [--->] IO_LOG                         TYPE REF TO /VPCOE/CL_LOG_SFM(optional)
* | [<-->] CS_DATA                        TYPE        DATA
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD /vpcoe/if_adj_data_retrieval~adjust_mapping.

    IF    iv_api_type = /vpcoe/cl_sfm_helper=>sc_api_type-sfm
      AND iv_srv_grp  = /vpcoe/cl_sfm_helper=>sc_grp_id-configuration
      AND iv_srv_id   = /vpcoe/cl_sfm_helper=>sc_service_id-uom.

      ASSIGN COMPONENT 'DIMENSION_CODE' OF STRUCTURE is_data TO FIELD-SYMBOL(<lv_src_value>).
      IF <lv_src_value> IS ASSIGNED.

        ASSIGN COMPONENT 'DIMENSION_ID' OF STRUCTURE cs_data TO FIELD-SYMBOL(<lv_trg_value>).
        IF <lv_trg_value> IS ASSIGNED.
          <lv_trg_value> = <lv_src_value>.
        ENDIF.

      ENDIF.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method /VPCOE/CL_ADJUST_API_SFM_EXMPL->/VPCOE/IF_ADJ_DATA_RETRIEVAL~ADJUST_TEXT_MAPPING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SRV_GRP                     TYPE        /VPCOE/DE_SERVICE_GROUP
* | [--->] IV_SRV_ID                      TYPE        /VPCOE/DE_SERVICE_ID
* | [--->] IT_DATA                        TYPE        DATA
* | [--->] IV_API_TYPE                    TYPE        /VPCOE/DE_API_TYPE
* | [--->] IO_LOG                         TYPE REF TO /VPCOE/CL_LOG_SFM(optional)
* | [<-->] CT_DATA                        TYPE        TABLE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD /vpcoe/if_adj_data_retrieval~adjust_text_mapping.
    DATA: lt_target_data TYPE /vpcoe/tt_uom_t.

    IF    iv_api_type = /vpcoe/cl_sfm_helper=>sc_api_type-sfm
      AND iv_srv_grp  = /vpcoe/cl_sfm_helper=>sc_grp_id-configuration
      AND iv_srv_id   = /vpcoe/cl_sfm_helper=>sc_service_id-uom.

      lt_target_data = ct_data.
      LOOP AT lt_target_data ASSIGNING FIELD-SYMBOL(<ls_trg_data>).
        <ls_trg_data>-technical_name = <ls_trg_data>-technical_name && '/VPCoe'.
      ENDLOOP.
    ENDIF.

    ct_data = lt_target_data.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method /VPCOE/CL_ADJUST_API_SFM_EXMPL->/VPCOE/IF_ADJ_DATA_RETRIEVAL~GET_EXT_DATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_API_TYPE                    TYPE        /VPCOE/DE_API_TYPE
* | [--->] IV_SRV_GRP                     TYPE        /VPCOE/DE_SERVICE_GROUP
* | [--->] IV_SRV_ID                      TYPE        /VPCOE/DE_SERVICE_ID
* | [--->] IS_SEL_OPT                     TYPE        DATA
* | [--->] IT_DATA                        TYPE        DATA(optional)
* | [--->] IV_MODE                        TYPE        /VPCOE/DE_MODE(optional)
* | [--->] IO_LOG                         TYPE REF TO /VPCOE/CL_LOG_SFM(optional)
* | [<-->] CT_EXT_DATA                    TYPE        DATA
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD /vpcoe/if_adj_data_retrieval~get_ext_data.
    " This method is not required for SFM
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method /VPCOE/CL_ADJUST_API_SFM_EXMPL->/VPCOE/IF_ADJ_DATA_RETRIEVAL~SKIP_SELECTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SRV_GRP                     TYPE        /VPCOE/DE_SERVICE_GROUP
* | [--->] IV_SRV_ID                      TYPE        /VPCOE/DE_SERVICE_ID
* | [--->] IV_API_TYPE                    TYPE        /VPCOE/DE_API_TYPE
* | [--->] IV_LEVEL                       TYPE        /VPCOE/LEVEL(optional)
* | [--->] IS_SEL_OPT                     TYPE        DATA(optional)
* | [--->] IV_MODE                        TYPE        /VPCOE/DE_MODE(optional)
* | [--->] IO_LOG                         TYPE REF TO /VPCOE/CL_LOG_SFM(optional)
* | [<-->] CV_SKIP                        TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD /vpcoe/if_adj_data_retrieval~skip_selection.
    DATA: ls_sel_opt TYPE /vpcoe/s_selopt_supplier.

    IF    iv_api_type = /vpcoe/cl_sfm_helper=>sc_api_type-sfm
      AND iv_srv_grp  = /vpcoe/cl_sfm_helper=>sc_grp_id-supplier
      AND iv_srv_id   = /vpcoe/cl_sfm_helper=>sc_service_id-supplier.

      ls_sel_opt = is_sel_opt.

      IF line_exists( ls_sel_opt-country[ low = 'DE' ] ).
        cv_skip = abap_true.
      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.