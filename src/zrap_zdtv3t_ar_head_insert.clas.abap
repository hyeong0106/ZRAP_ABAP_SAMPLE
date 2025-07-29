CLASS zrap_zdtv3t_ar_head_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrap_zdtv3t_ar_head_insert IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: Lv_uuid TYPE sysuuid_x16.

    TRY.
        lv_uuid = cl_system_uuid=>create_uuid_x16_static( ).
        out->write( |생성된 UUID: { lv_uuid }| ).

      CATCH cx_uuid_error INTO DATA(lx_uuid).
        out->write( |UUID 생성 중 오류 발생: { lx_uuid->get_text( ) }| ).
    ENDTRY.

    INSERT zdtv3t_ar_head
    FROM @( VALUE #( mandt = sy-mandt
                     bukrs = '4100'
                     issue_date = '20250725'
                     bupla = '1000'
                     inv_seq = substring( val = CONV string( lv_uuid ) off =  7 len =  24 )
                     inter_no = '000000000000000000001112'
                     inv_sign = ''
                     asp_code = '42000172'
                     type_code = '0101'
                     purp_code = '01'
                     amend_code = ''
                     issue_id_old = ''
                     desc_text1 = '비고1'
                     desc_text2 = '비고2'
                     desc_text3 = '비고3'
                     su_id = '1234567890'
                     su_min = '0'
                     su_name = '공급자사업자번호'
                     su_repres = '공급자 대표자명'
                     su_addr = '공급자 주소'
                     su_bustype = '공급자 업종'
                     su_indtype = '공급자 업태'
                     su_deptname = '공급자 담당부서'
                     su_persname = '공급자 담당자'
                     su_telno = '02-1111-1111'
                     su_hpno = '010-1111-1111'
                     su_email = 'test@naver.com'
                     ip_typecode = '01'
                     ip_id = '1111111119'
                     ip_min = ''
                     ip_name = '공급받는자 사업자명'
                     ip_repres = '공급받는자 대표자명'
                     ip_addr = '공급받는자 주소'
                     ip_bustype = '공급받는자 업종'
                     ip_indtype = '공급받는자 업태'
                     ip_deptname1 = '공급받는자 1st 담당부서'
                     ip_persname1 = '공급받는자 1st 담당자'
                     ip_telno1 = '02-2222-2222'
                     ip_hpno1 = '010-2222-2222'
                     ip_email1 = 'test2@naver.com'
                     ip_deptname2 = '공급받는자 2nd 담당부서'
                     ip_persname2 = '공급받는자 2nd 담당자'
                     ip_telno2 = '02-3333-3333'
                     ip_hpno2 = '010-3333-3333'
                     ip_email2 = 'test3@naver.com'
                     bp_id = ''
                     bp_min = ''
                     bp_name = ''
                     bp_repres = ''
                     bp_addr = ''
                     bp_bustype = ''
                     bp_indtype = ''
                     bp_deptname = ''
                     bp_persname = ''
                     bp_telno = ''
                     bp_hpno = ''
                     bp_email = ''
                     chargetotal = '100'
                     taxtotal = '10'
                     grandtotal = '110'
                     issue_dt = ''
                     issue_id = ''
                     status = '0000'
                     proc_step = '00'
                     aspid = ''
                     asppw = ''
                     nts_send_flag = '00'
                     open_flag = ''
                     interface_no = ''
                     aedat = '20250725'
                     aezei = '130000'
                     aeusn = 'taskkk'
                     erdat = '20250725'
                     erzet = '130000'
                     ernam = 'hyeongmin'
                   ) ).
    COMMIT WORK.

    out->write( |생성 완료| ).
  ENDMETHOD.
ENDCLASS.
