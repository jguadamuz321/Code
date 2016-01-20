<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
   
    xmlns:wpc="urn:com.workday/paymentconnector" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 

   xmlns:xtt="urn:com.workday/xtt"
    xmlns:etv="urn:com.workday/etv" 
    xmlns:out="http://www.workday.com/integration/output" version="2.0"
    exclude-result-prefixes="xsd xsl  out">

    <!-- **************************************************************************
      Filename:     INT0148       Author:       Jose Guadamuz
      Updated by:   Jose Guadamuz 
       ************************************************************************** -->



    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="counter">0</xsl:variable>
  
    <xsl:template match="/wpc:WorkdayPaymentsConnectorFile">

        
        <File xtt:separator="&#xD;&#xA;">

    <!-- One Detail Entry Per Report Entry -->
            <xsl:for-each select="Payment">
                
                <xsl:if test="CalculatedFieldData/Field_Value[@name='Company'] = 'C10' or CalculatedFieldData/Field_Value[@name='PayGroup'] = 'Monthly Pay Group'
                    or CalculatedFieldData/Field_Value[@name='Onleave'] = 'Y' or CalculatedFieldData/Field_Value[@name='isTerm'] = 'Y'">
         
                <COUNTER xtt:incrementNumber="$counter" xtt:omit="true"/>
                <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
                <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
        <DetailRow>
            
            <Bin-Number-Sort  xtt:fixedLength="26" xtt:paddingCharacter="0"/>
            <MICR  xtt:fixedLength="51"><xsl:value-of select="''"/></MICR>
            <COMPANY_NAME xtt:fixedLength="46"><xsl:value-of select="Payment_Detail[1]/Payment_Info/wpc:PAYMENT_Company"/></COMPANY_NAME>
            <FRACTIONAL_NO xtt:fixedLength="13"><xsl:value-of select="'56-1544/441'"/></FRACTIONAL_NO>
            <BLANK_1 xtt:fixedLength="7"><xsl:value-of select="''"/></BLANK_1>
            <CO_CITY_STATE xtt:fixedLength="24" xtt:align="left"><xsl:value-of select="'Chattanooga, TN'"/></CO_CITY_STATE>
            <BLANK_2 xtt:fixedLength="22"></BLANK_2>
            <CHECK_NO_TEXT xtt:fixedLength="10"><xsl:value-of select="'Check no'"/></CHECK_NO_TEXT>
            <CHECK_NO xtt:fixedLength="10"><xsl:value-of select="Payment_Detail[1]/Payment_Info/wpc:PAYMENT_Check_Number"/></CHECK_NO>
            <DATE_TEXT xtt:fixedLength="7"><xsl:value-of select="'Date:'"/></DATE_TEXT>
            <DATE xtt:fixedLength="12"><xsl:value-of select="format-date(Payment_Detail[1]/Payment_Group/wpc:PAYMENT_GROUP_Payment_Date, '[Y0001]-[M01]-[D01]')"/></DATE>
            <BLANK_3 xtt:fixedLength="63"><xsl:value-of select="''"/></BLANK_3>
            <PAY_LIT xtt:fixedLength="5"><xsl:value-of select="'Pay'"/></PAY_LIT>
            <AMT_SPELLED xtt:fixedLength="96"><xsl:value-of select="Payment_Detail[1]/Payment_Info/wpc:PAYMENT_Amount_as_Text"/></AMT_SPELLED>
            <AMT_LIT xtt:fixedLength="24"><xsl:value-of select="concat('$',format-number(Remittance_Data[1]/Payroll_Remittance_Data[1]/wpc:PAYROLL_Remittance_Net_Pay,'#,###.00'))"/></AMT_LIT>
            <AMT_NUMERIC xtt:fixedLength="13" xtt:align="right"><xsl:value-of select="format-number(Remittance_Data[1]/Payroll_Remittance_Data[1]/wpc:PAYROLL_Remittance_Net_Pay,'####.00')"/></AMT_NUMERIC>
            <TO_THE xtt:fixedLength="7"><xsl:value-of select="'To The'"/></TO_THE>
            <BLANK_4 xtt:fixedLength="26"><xsl:value-of select="''"/></BLANK_4>
            <MAIL_STOP xtt:fixedLength="6"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='MailStop']"/></MAIL_STOP>
            <ORDER xtt:fixedLength="6"><xsl:value-of select="'Order'"/></ORDER>
            <ADDRESS_1 xtt:fixedLength="41"><xsl:value-of select="Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Address_Line_1"/></ADDRESS_1>
            <BLANK_5 xtt:fixedLength="11"><xsl:value-of select="''"/></BLANK_5>
            <O-F xtt:fixedLength="4"><xsl:value-of select="' Of'"/></O-F>
            <BLANK_6 xtt:fixedLength="27"><xsl:value-of select="''"/></BLANK_6>
            <SIGNATURE xtt:fixedLength="8"><xsl:value-of select="'L00075'"/></SIGNATURE>
            <BANK_NAME xtt:fixedLength="39"><xsl:value-of select="Payment_Detail[1]/Originating_Party_And_Bank_Data/wpc:PAYER_Bank_Name"/></BANK_NAME>
            <BANK_CITY_STATE xtt:fixedLength="76"><xsl:value-of select="'COLUMBUS, OHIO 43271'"/></BANK_CITY_STATE>
            <CO_NME xtt:fixedLength="40"><xsl:value-of select="Payment_Detail[1]/Payment_Info/wpc:PAYMENT_Company"/></CO_NME>
            <PAY_GRPLIT xtt:fixedLength="13"><xsl:value-of select="'PAY GROUP'"/></PAY_GRPLIT>
            <PAY_GRP xtt:fixedLength="31"><xsl:value-of select="Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Pay_Group_Detail_Reference"/></PAY_GRP>
            <CO_ADDR1 xtt:fixedLength="40"><xsl:value-of select="'1 Fountain Square'"/></CO_ADDR1>
            <PAY_BEGDTLIT xtt:fixedLength="17"><xsl:value-of select="'PAY BEGIN DATE:'"/></PAY_BEGDTLIT>
            <BEG_DATE xtt:fixedLength="12"><xsl:value-of select="format-date(Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Period_Start_Date, '[M01]/[D01]/[Y0001]')"/></BEG_DATE>
            <CHKNO_LIT xtt:fixedLength="10"><xsl:value-of select="'CHECK #:'"/></CHKNO_LIT>
            <CHKNO xtt:fixedLength="10" xtt:align="left"><xsl:value-of select="Payment_Detail[1]/Payment_Info/wpc:PAYMENT_Check_Number"/></CHKNO>
            <CO_ADDR2 xtt:fixedLength="40"><xsl:value-of select="'Chattanooga, TN 37402'"/></CO_ADDR2>
            <PAY_ENDDTLIT xtt:fixedLength="15"><xsl:value-of select="'PAY END DATE:'"/></PAY_ENDDTLIT>
            <END_DATE xtt:fixedLength="12"><xsl:value-of select="format-date(Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Period_End_Date, '[M01]/[D01]/[Y0001]')"/></END_DATE>
            <CHK_DT_LIT xtt:fixedLength="13"><xsl:value-of select="'CHECK DATE:'"/></CHK_DT_LIT>
            <CHK_DATE xtt:fixedLength="12"><xsl:value-of select="format-date(Payment_Detail[1]/Payment_Group/wpc:PAYMENT_GROUP_Payment_Date, '[M01]/[D01]/[Y0001]')"/></CHK_DATE>
            <LINE_LIT1 xtt:fixedLength="95" xtt:paddingCharacter="_"><xsl:value-of select="''"/></LINE_LIT1>
            <EMPNAME xtt:fixedLength="26"><xsl:value-of select="translate(Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Name,$lowercase,$uppercase)"/></EMPNAME>
            <LIT_1_1 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_1>
            <EMPL_ID_LIT xtt:fixedLength="14"><xsl:value-of select="'EMPLOYEE ID:'"/></EMPL_ID_LIT>
            <EMPL_ID xtt:fixedLength="34" xtt:align="left"><xsl:value-of select="Remittance_Data/Payroll_Worker_Data/wpc:PAYROLL_Worker_Employee_ID"/></EMPL_ID>
            <LIT_1_2 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_2>
            <TAX_DATA_LIT xtt:fixedLength="11"><xsl:value-of select="'TAX DATA:'"/></TAX_DATA_LIT>
            <FEDERAL_LIT xtt:fixedLength="9"><xsl:value-of select="'FEDERAL'"/></FEDERAL_LIT>
            <TAX_ST xtt:fixedLength="4"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='StateTax']"/></TAX_ST>
            <STATE_LIT xtt:fixedLength="7"><xsl:value-of select="'STATE'"/></STATE_LIT>
            <EMPADDR1 xtt:fixedLength="26"><xsl:value-of select="Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Address_Line_1"/></EMPADDR1>
            <LIT_1_3  xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_3>
            <DEPT_LIT xtt:fixedLength="13"><xsl:value-of select="'DEPARTMENT'"/></DEPT_LIT>
            <DEPT_NAME xtt:fixedLength="34"><xsl:value-of select="Remittance_Data/Payroll_Worker_Data/wpc:PAYROLL_Worker_Cost_Center_Reference"/></DEPT_NAME>
            <LIT_1_4  xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_4>
            <MARITAL_LIT xtt:fixedLength="17"><xsl:value-of select="'MARITAL STATUS:'"/></MARITAL_LIT>      
            <FED_MAR_ST xtt:fixedLength="9"><xsl:value-of select="Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Federal_Marital_Status_Reference"/></FED_MAR_ST>     
            <ST_MAR_ST xtt:fixedLength="9"><xsl:value-of select="Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Federal_Marital_Status_Reference"/></ST_MAR_ST>    
            <EMPADDR2 xtt:fixedLength="26"><xsl:value-of select="Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Address_Line_2"/></EMPADDR2>
            <LIT_1_5 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_5>
            <LOC_LIT xtt:fixedLength="11"><xsl:value-of select="'LOCATION:'"/></LOC_LIT>
            <LOC xtt:fixedLength="34"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='LocationID']"/></LOC>
            <LIT_1_6 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_6>
            <ALLOW_LIT xtt:fixedLength="13"><xsl:value-of select="'ALLOWANCES:'"/></ALLOW_LIT>
            <FED_ALLOW xtt:fixedLength="5" xtt:align="left"><xsl:value-of select="Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Federal_Allowance"/></FED_ALLOW>
            <ST_ALL xtt:fixedLength="5" xtt:align="left"><xsl:value-of select="Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Work_State_Allowance"/></ST_ALL>
            <EMPADDR3 xtt:fixedLength="26" ><xsl:value-of select="''"/></EMPADDR3>  
            <LIT_1_7 xtt:fixedLength="3"><xsl:value-of select="''"/></LIT_1_7>  
            <JOB_TITLE_LIT xtt:fixedLength="12"><xsl:value-of select="'JOB TITLE:'"/></JOB_TITLE_LIT>
            <JOB_TITLE xtt:fixedLength="34"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='JobTitle']"/></JOB_TITLE>     
            <LIT_1_8 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_8>      
            <ADDL_PCT_LIT xtt:fixedLength="12"><xsl:value-of select="'ADDL PCT:'"/></ADDL_PCT_LIT>
            <FED_PCT xtt:fixedLength="8"><xsl:value-of select="''"/></FED_PCT>
            <ST_PCT xtt:fixedLength="7"><xsl:value-of select="''"/></ST_PCT>
            <BLANK_SSN xtt:fixedLength="6" ><xsl:value-of select="''"/></BLANK_SSN>  
            <BLANK_7 xtt:fixedLength="14" ><xsl:value-of select="''"/></BLANK_7>      
            <LIT_1_9 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_9>  
            <PAY_RT_LIT xtt:fixedLength="11" ><xsl:value-of select="'PAY RATE:'"/></PAY_RT_LIT>
            <ANN_SAL xtt:fixedLength="34" ><xsl:value-of select="concat('$',format-number(CalculatedFieldData/Field_Value[@name='Salary'],'#,###.00'), ' ANNUAL')"/></ANN_SAL>
            <LIT_1_10 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_10>
            <ADDL_AMT_LIT xtt:fixedLength="12"><xsl:value-of select="'ADDL AMT:'"/></ADDL_AMT_LIT>  
            <FED_ADDL xtt:fixedLength="11"><xsl:value-of select="Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Federal_Additional_Allowance"/></FED_ADDL>
            <ST_ADDL xtt:fixedLength="12"><xsl:value-of select="''"/></ST_ADDL>
            <LINE_LIT2 xtt:fixedLength="95" xtt:paddingCharacter="_"><xsl:value-of select="''"></xsl:value-of></LINE_LIT2>
            <HRS_EARN_LIT xtt:fixedLength="20"><xsl:value-of select="'HOURS AND EARNINGS'"></xsl:value-of></HRS_EARN_LIT>
            <LIT_1_11 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_11>
            <TAXES_LIT xtt:fixedLength="6"><xsl:value-of select="'TAXES'"/></TAXES_LIT>
            <T_CURRENT_LIT xtt:fixedLength="36"><xsl:value-of select="'--------------CURRENT--------------'"/></T_CURRENT_LIT>
            <T_YTD_LIT xtt:fixedLength="24"><xsl:value-of select="'-----------YTD---------'"/></T_YTD_LIT>
            <LIT_1_12 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_12>
            <DESC_LIT1 xtt:fixedLength="23"><xsl:value-of select="'*DESCRIPTION'"/></DESC_LIT1>
            <RT_LIT1 xtt:fixedLength="5"><xsl:value-of select="'RATE'"/></RT_LIT1>
            <HRS_LIT1 xtt:fixedLength="6"><xsl:value-of select="'HOURS'"/></HRS_LIT1>
            <EARNLIT1 xtt:fixedLength="9"><xsl:value-of select="'EARNINGS'"/></EARNLIT1>
            <HRSLIT2 xtt:fixedLength="6"><xsl:value-of select="'HOURS'"/></HRSLIT2>
            <EARNLIT2 xtt:fixedLength="10"><xsl:value-of select="'EARNINGS'"/></EARNLIT2>
            <LIT_1_13 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_13>
            <DESC_LIT2 xtt:fixedLength="14"><xsl:value-of select="'*DESCRIPTION'"/></DESC_LIT2>
            <CURR_LIT1 xtt:fixedLength="9"><xsl:value-of select="'CURRENT'"/></CURR_LIT1>
            <YTDLIT0 xtt:fixedLength="4"><xsl:value-of select="'YTD'"/></YTDLIT0>
            <FILLER1 xtt:fixedLength="23"><xsl:value-of select="''"/></FILLER1>
            
            <EARN_RATE1 xtt:fixedLength="15" xtt:align="right"  xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE1>
            <EARN_HRS1 xtt:fixedLength="9" xtt:align="right"  xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS1>
            <EARN_AMT1 xtt:fixedLength="15" xtt:align="right"  xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT1>
            <EARN_HRSYTD1 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"></EARN_HRSYTD1>
            <EARN_YTD1 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD1>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME1 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[1]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME1>
            <AMT_TAX1 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[1]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX1>
            <YTD_TAX1 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[1]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX1>
            <FILLER2  xtt:fixedLength="23"></FILLER2>
            
            <EARN_RATE2 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE2>
            <EARN_HRS2 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS2>
            <EARN_AMT2 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT2>
            <EARN_HRSYTD2 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"></EARN_HRSYTD2>
            <EARN_YTD2 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD2>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME2 xtt:fixedLength="17" xtt:align="right"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[2]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME2>
            <AMT_TAX2 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[2]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX2>
            <YTD_TAX2 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[2]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX2>
            <FILLER3 xtt:fixedLength="23"/>
            
            <EARN_RATE3 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE3>
            <EARN_HRS3 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS3>
            <EARN_AMT3 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT3>
            <EARN_HRSYTD3 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"></EARN_HRSYTD3>
            <EARN_YTD3 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD3>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME3 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[3]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME3>
            <AMT_TAX3 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[3]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX3>
            <YTD_TAX3 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[3]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX3>
            <FILLER4 xtt:fixedLength="23"/>
            
            <EARN_RATE4 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE4>
            <EARN_HRS4 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS4>
            <EARN_AMT4 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT4>
            <EARN_HRSYTD4 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD4>
            <EARN_YTD4 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD4>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME4 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[4]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME4>
            <AMT_TAX4 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[4]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX4>
            <YTD_TAX4 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[4]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX4>
            <FILLER5 xtt:fixedLength="23"/>
            
            <EARN_RATE5 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE5>
            <EARN_HRS5 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS5>
            <EARN_AMT5 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT5>
            <EARN_HRSYTD5 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD5>
            <EARN_YTD5 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD5>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME5 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[5]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME5>
            <AMT_TAX5 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[5]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX5>
            <YTD_TAX5 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[5]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX5>
            <FILLER6 xtt:fixedLength="23"/>
            
            <EARN_RATE6 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE6>
            <EARN_HRS6 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS6>
            <EARN_AMT6 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT6>
            <EARN_HRSYTD6 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD6>
            <EARN_YTD6 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD6>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME6 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[6]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME6>
            <AMT_TAX6 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[6]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX6>
            <YTD_TAX6 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[6]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX6>
            <FILLER7 xtt:fixedLength="23"/>
            
            
            <EARN_RATE7 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE7>
            <EARN_HRS7 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS7>
            <EARN_AMT7 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT7>
            <EARN_HRSYTD7 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat=" #,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD7>
            <EARN_YTD7 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD7>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME7 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[7]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME7>
            <AMT_TAX7 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[7]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX7>
            <YTD_TAX7 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[7]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX7>
            <FILLER8 xtt:fixedLength="23"/>
            
            
            <EARN_RATE8 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat=" #,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE8>
            <EARN_HRS8 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS8>
            <EARN_AMT8 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT8>
            <EARN_HRSYTD8 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD8>
            <EARN_YTD8 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD8>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME8 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[8]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME8>
            <AMT_TAX8 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[8]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX8>
            <YTD_TAX8 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[8]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX8>
            <FILLER9 xtt:fixedLength="23"/>
            
            <EARN_RATE9 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE9>
            <EARN_HRS9 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat=" #,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS9>
            <EARN_AMT9 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT9>
            <EARN_HRSYTD9 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD9>
            <EARN_YTD9 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD9>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME9 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[9]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME9>
            <AMT_TAX9 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[9]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX9>
            <YTD_TAX9 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[9]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX9>
            <FILLER10 xtt:fixedLength="23"/>
            
            <EARN_RATE10 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE10>
            <EARN_HRS10 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS10>
            <EARN_AMT10 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT10>
            <EARN_HRSYTD10 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD10>
            <EARN_YTD10 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD10>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME10 xtt:fixedLength="17" xtt:align="right"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[10]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME10>
            <AMT_TAX10 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[10]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX10>
            <YTD_TAX10 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[10]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX10>
            <FILLER10 xtt:fixedLength="23"/>
            
            <EARN_RATE11 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE11>
            <EARN_HRS11 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS11>
            <EARN_AMT11 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT11>
            <EARN_HRSYTD11 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD11>
            <EARN_YTD11 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD11>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>          
            <TAX_NAME11 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[11]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME11>
            <AMT_TAX11 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat=" #,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[11]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX11>
            <YTD_TAX11 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[11]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX11>
            <FILLER12 xtt:fixedLength="23"/>
            
            <EARN_RATE12 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE12>
            <EARN_HRS12 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS12>
            <EARN_AMT12 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat=" #,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT12>
            <EARN_HRSYTD12 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD12>
            <EARN_YTD12 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD12>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>   
            <TAX_NAME12 xtt:fixedLength="17" xtt:align="right" ><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[12]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME12>
            <AMT_TAX12 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[12]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX12>
            <YTD_TAX12 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[12]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX12>
            <FILLER13 xtt:fixedLength="23"/>
            
            <EARN_RATE13 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.000000"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]/wpc:PAYROLL_Earnings_Rate"/></xsl:if></EARN_RATE13>
            <EARN_HRS13 xtt:fixedLength="10" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]/wpc:PAYROLL_Earnings_Units_Value"/></xsl:if></EARN_HRS13>
            <EARN_AMT13 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]/wpc:PAYROLL_Earnings_Amount"/></xsl:if></EARN_AMT13>
            <EARN_HRSYTD13 xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]"><xsl:value-of select="''"/></xsl:if></EARN_HRSYTD13>
            <EARN_YTD13 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="##,###,###.00"><xsl:if test="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]/wpc:PAYROLL_Earnings_YTD"/></xsl:if></EARN_YTD13>
            <LIT_1_14 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_14>
            <TAX_NAME13 xtt:fixedLength="17" xtt:align="right"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[13]/wpc:PAYROLL_EmployeeTaxes_Pay_Component"/></xsl:if></TAX_NAME13>
            <AMT_TAX13 xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[13]/wpc:PAYROLL_EmployeeTaxes_Amount"/></xsl:if></AMT_TAX13>
            <YTD_TAX13 xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###,###.00"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[13]/wpc:PAYROLL_EmployeeTaxes_YTD"/></xsl:if></YTD_TAX13>
            
            <TOTAL_LIT1 xtt:fixedLength="23" xtt:align="right"><xsl:value-of select="''"/></TOTAL_LIT1>
            <BLANK_8 xtt:fixedLength="14"><xsl:value-of select="''"/></BLANK_8>
            <EARN_HRS_TOT xtt:fixedLength="10"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Earnings']/wpc:PAYROLL_Earnings_Units_Value"/></EARN_HRS_TOT>
            <EARN_AMT_TOT xtt:fixedLength="14" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Earnings']/wpc:PAYROLL_Total_Current_Period"/></EARN_AMT_TOT>
            <TOT_YTD_HRS xtt:fixedLength="11"><xsl:value-of select="''"/></TOT_YTD_HRS>
            <TOT_YTD_EARNS xtt:fixedLength="17" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Earnings']/wpc:PAYROLL_Total_YTD"/></TOT_YTD_EARNS>
            <LIT_1_27 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_27>
            <TOTAL_LIT2 xtt:fixedLength="17"><xsl:value-of select="'TOTAL:'"/></TOTAL_LIT2>
            <TAX_AMT_TOT xtt:fixedLength="15" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Employee Taxes']/wpc:PAYROLL_Total_Current_Period"/></TAX_AMT_TOT>
            <YTD_TAX_TOT xtt:fixedLength="17" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Employee Taxes']/wpc:PAYROLL_Total_YTD"/></YTD_TAX_TOT>
            <LINELIT3 xtt:fixedLength="95" xtt:paddingCharacter="_"><xsl:value-of select="''"/></LINELIT3>
            <BE_TAX_DED_LIT xtt:fixedLength="22"><xsl:value-of select="'BEFORE TAX DEDUCTIONS'"/></BE_TAX_DED_LIT>
            <LIT_1_28 xtt:fixedLength="4"><xsl:value-of select="' 1'"/></LIT_1_28>
            <AF_TAX_DED_LIT xtt:fixedLength="21"><xsl:value-of select="'AFTER TAX DEDUCTIONS'"/></AF_TAX_DED_LIT>
            <LIT_1_29 xtt:fixedLength="4"><xsl:value-of select="' 1'"/></LIT_1_29>
            <OTHER_ITMS_LIT xtt:fixedLength="13"><xsl:value-of select="'OTHER ITEMS'"/></OTHER_ITMS_LIT>
            <DESCRIPTION_LIT1 xtt:fixedLength="14"><xsl:value-of select="'*DESCRIPTION'"/></DESCRIPTION_LIT1>
            <CURRENT_LIT2 xtt:fixedLength="9"><xsl:value-of select="'CURRENT'"/></CURRENT_LIT2>
            <YTD_LIT1 xtt:fixedLength="4"><xsl:value-of select="'YTD'"/></YTD_LIT1>
            <LIT_1_30 xtt:fixedLength="4"><xsl:value-of select="' 1'"/></LIT_1_30>
            <DESCRIPTION_LIT2 xtt:fixedLength="14"><xsl:value-of select="'*DESCRIPTION'"/></DESCRIPTION_LIT2>
            <CURRENT_LIT3 xtt:fixedLength="9"><xsl:value-of select="'CURRENT'"/></CURRENT_LIT3>
            <YTDLIT2 xtt:fixedLength="4"><xsl:value-of select="'YTD'"/></YTDLIT2>
            <LIT_1_31 xtt:fixedLength="4"><xsl:value-of select="' 1'"/></LIT_1_31>
            <DESC_LIT3 xtt:fixedLength="14"><xsl:value-of select="'*DESCRIPTION'"/></DESC_LIT3>
            <CURRENT_LIT4 xtt:fixedLength="9"><xsl:value-of select="'CURRENT'"/></CURRENT_LIT4>
            <YTDLIT3 xtt:fixedLength="4"><xsl:value-of select="'YTD'"/></YTDLIT3>
            
            
            <PRE_TAX_DEDN_NAME1 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[1]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME1>
            <CUR_PRE_TAX_DEDN_AMT1 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[1]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT1>
            <YTD_PRE_TAX_DEDN_AMT1 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[1]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT1>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME1 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[1]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME1>
            <CUR_AFT_TAX_DEDN_AMT1 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[1]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT1>
            <YTD_PRE_TAX_DEDN_AMT1 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[1]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT1>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_33>
            <OTH_DEDN_NAME1 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[1]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME1>
            <CUR_OTH_DEDN_AMT1 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[1]/wpc:PAYROLL_EmployerPaidBenefits_Amount"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[1]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT1>
            <YTD_OTH_DEDN_AMT1 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[1]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT1>
            
            <PRE_TAX_DEDN_NAME2 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[2]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME2>
            <CUR_PRE_TAX_DEDN_AMT2 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[2]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT2>
            <YTD_PRE_TAX_DEDN_AMT2 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[2]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT2>
            <LIT_1_34 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_34>
            <AFT_TAX_DEDN_NAME2 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[2]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME2>
            <CUR_AFT_TAX_DEDN_AMT2 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[2]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT2>
            <YTD_AFT_TAX_DEDN_AMT2 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[2]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_AFT_TAX_DEDN_AMT2>
            <LIT_1_35 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_35>
          
            <OTH_DEDN_NAME2 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[2]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME2>
            <CUR_OTH_DEDN_AMT2 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[2]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT2>
            <YTD_OTH_DEDN_AMT2 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[2]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[2]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT2>
            
            <PRE_TAX_DEDN_NAME3 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[3]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME3>
            <CUR_PRE_TAX_DEDN_AMT3 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[3]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT3>
            <YTD_PRE_TAX_DEDN_AMT3 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[3]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT3>
            <LIT_1_36 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_36>
            
            <AFT_TAX_DEDN_NAME3 xtt:fixedLength="22" ><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[3]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME3>
            <CUR_AFT_TAX_DEDN_AMT3 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[3]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT3>
            <YTD_PRE_TAX_DEDN_AMT3 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[3]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT3>
            <LIT_1_37 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_37>
            
            <OTH_DEDN_NAME3 xtt:fixedLength="22" ><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[3]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME3>
            <CUR_OTH_DEDN_AMT3 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[3]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT3>
            <YTD_OTH_DEDN_AMT3 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[3]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[3]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT3>
            
            <PRE_TAX_DEDN_NAME4 xtt:fixedLength="22" ><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[4]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME4>
            <CUR_PRE_TAX_DEDN_AMT4 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[4]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT4>
            <YTD_PRE_TAX_DEDN_AMT4 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[4]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT4>
            <LIT_1_38 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_38>
           
            
            <AFT_TAX_DEDN_NAME4 xtt:fixedLength="22" ><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[4]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME4>
            <CUR_AFT_TAX_DEDN_AMT4 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[4]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT4>
            <YTD_AFT_TAX_DEDN_AMT4 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[4]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_AFT_TAX_DEDN_AMT4>
            <LIT_1_39 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_39>
           
            <OTH_DEDN_NAME4 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[4]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME4>
            <CUR_OTH_DEDN_AMT4 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[4]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT4>
            <YTD_OTH_DEDN_AMT4 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[4]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[4]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT4>
            
            <PRE_TAX_DEDN_NAME5 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[5]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME5>
            <CUR_PRE_TAX_DEDN_AMT5 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[5]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT5>
            <YTD_PRE_TAX_DEDN_AMT5 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[5]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT5>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME5 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[5]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME5>
            <CUR_AFT_TAX_DEDN_AMT5 xtt:fixedLength="12"  xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[5]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT5>
            <YTD_PRE_TAX_DEDN_AMT5 xtt:fixedLength="12"  xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[5]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT5>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_33>
            <OTH_DEDN_NAME5 xtt:fixedLength="22"  ><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[5]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME5>
            <CUR_OTH_DEDN_AMT5 xtt:fixedLength="16"  xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[5]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT5>
            <YTD_OTH_DEDN_AMT5 xtt:fixedLength="13"  xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[5]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[5]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT5>
            
            <PRE_TAX_DEDN_NAME6 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[6]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME6>
            <CUR_PRE_TAX_DEDN_AMT6 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[6]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT6>
            <YTD_PRE_TAX_DEDN_AMT6 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[6]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT6>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME6 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[6]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME6>
            <CUR_AFT_TAX_DEDN_AMT6 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[6]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT6>
            <YTD_PRE_TAX_DEDN_AMT6 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[6]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT6>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_33>
            <OTH_DEDN_NAME6 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[6]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME6>
            <CUR_OTH_DEDN_AMT6 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[6]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT6>
           <YTD_OTH_DEDN_AMT6 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[6]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[6]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT6>
            
            <PRE_TAX_DEDN_NAME7 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[7]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME7>
            <CUR_PRE_TAX_DEDN_AMT7 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[7]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT7>
            <YTD_PRE_TAX_DEDN_AMT7 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[7]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT7>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME7 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[7]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME7>
            <CUR_AFT_TAX_DEDN_AMT7 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[7]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT7>
            <YTD_PRE_TAX_DEDN_AMT7 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[7]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT7>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="''"/></LIT_1_33>
            
            <OTH_DEDN_NAME7 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[7]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME7>
            <CUR_OTH_DEDN_AMT7 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[7]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT7>
            <YTD_OTH_DEDN_AMT7 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[7]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[7]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT7>
  
            <PRE_TAX_DEDN_NAME8 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[8]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME8>
            <CUR_PRE_TAX_DEDN_AMT8 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[8]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT8>
            <YTD_PRE_TAX_DEDN_AMT8 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[8]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT8>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME8 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[8]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME8>
            <CUR_AFT_TAX_DEDN_AMT8 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[8]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT8>
            <YTD_PRE_TAX_DEDN_AMT8 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[8]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT8>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_33>
            <OTH_DEDN_NAME8 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[8]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME8>
            <CUR_OTH_DEDN_AMT8 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[8]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT8>
            <YTD_OTH_DEDN_AMT8 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[8]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[8]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT8>
            
            <PRE_TAX_DEDN_NAME9 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[9]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME9>
            <CUR_PRE_TAX_DEDN_AMT9 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[9]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT9>
            <YTD_PRE_TAX_DEDN_AMT9 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[9]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT9>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME9 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[9]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME9>
            <CUR_AFT_TAX_DEDN_AMT9 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[9]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT9>
            <YTD_PRE_TAX_DEDN_AMT9 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[9]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT9>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_33>
            <OTH_DEDN_NAME9 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[9]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME9>
            <CUR_OTH_DEDN_AMT9 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[9]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT9>
            <YTD_OTH_DEDN_AMT9 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[9]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[9]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT9>
            
            <PRE_TAX_DEDN_NAME10 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[10]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME10>
            <CUR_PRE_TAX_DEDN_AMT10 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[10]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT10>
            <YTD_PRE_TAX_DEDN_AMT10 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[10]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT10>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME10 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[10]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME10>
            <CUR_AFT_TAX_DEDN_AMT10 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[10]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT10>
            <YTD_PRE_TAX_DEDN_AMT10 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[10]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT10>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_33>
            <OTH_DEDN_NAME10 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[10]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME10>
            <CUR_OTH_DEDN_AMT10 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[10]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT10>
            <YTD_OTH_DEDN_AMT10 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[10]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[10]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT10>
            
            <PRE_TAX_DEDN_NAME11 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[11]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME11>
            <CUR_PRE_TAX_DEDN_AMT11 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[11]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT11>
            <YTD_PRE_TAX_DEDN_AMT11 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[11]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT11>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME11 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[11]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME11>
            <CUR_AFT_TAX_DEDN_AMT11 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[11]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT11>
            <YTD_PRE_TAX_DEDN_AMT11 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[11]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT11>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_33>
            <OTH_DEDN_NAME11 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[11]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME11>
            <CUR_OTH_DEDN_AMT11 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[11]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT11>
            <YTD_OTH_DEDN_AMT11 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[11]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[11]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT11>
            
            <PRE_TAX_DEDN_NAME12 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[12]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME12>
            <CUR_PRE_TAX_DEDN_AMT12 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[12]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT12>
            <YTD_PRE_TAX_DEDN_AMT12 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[12]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT12>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME12 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[12]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME12>
            <CUR_AFT_TAX_DEDN_AMT12 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[12]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT12>
            <YTD_PRE_TAX_DEDN_AMT12 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[12]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT12>
            <LIT_1_33 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_33>
            <OTH_DEDN_NAME12 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[12]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME12>
            <CUR_OTH_DEDN_AMT12 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[12]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT12>
            <YTD_OTH_DEDN_AMT12 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[12]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[12]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT12>
            
            <PRE_TAX_DEDN_NAME13 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[13]/wpc:PAYROLL_PRETax_Pay_Component"/></xsl:if></PRE_TAX_DEDN_NAME13>
            <CUR_PRE_TAX_DEDN_AMT13 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[13]/wpc:PAYROLL_PRETax_Amount"/></xsl:if></CUR_PRE_TAX_DEDN_AMT13>
            <YTD_PRE_TAX_DEDN_AMT13 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Pre_Tax_Deductions_Data/Pre_Tax_Deductions_Data[13]/wpc:PAYROLL_PRETax_YTD"/></xsl:if></YTD_PRE_TAX_DEDN_AMT13>
            <LIT_1_32 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_32>
            <AFT_TAX_DEDN_NAME13 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[13]/wpc:PAYROLL_POSTTax_Pay_Component"/></xsl:if></AFT_TAX_DEDN_NAME13>
            <CUR_AFT_TAX_DEDN_AMT13 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[13]/wpc:PAYROLL_POSTTax_Amount"/></xsl:if></CUR_AFT_TAX_DEDN_AMT13>
            <YTD_AFT_TAX_DEDN_AMT13 xtt:fixedLength="12" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Post_Tax_Deductions_Data/Post_Tax_Deductions_Data[13]/wpc:PAYROLL_POSTTax_YTD"/></xsl:if></YTD_AFT_TAX_DEDN_AMT13>
            <LIT_1_57  xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_57>
            <OTH_DEDN_NAME13 xtt:fixedLength="22"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[13]/wpc:PAYROLL_EmployerPaidBenefits_Pay_Component"/></xsl:if></OTH_DEDN_NAME13>
            <CUR_OTH_DEDN_AMT13 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[13]/wpc:PAYROLL_EmployerPaidBenefits_Amount"/></xsl:if></CUR_OTH_DEDN_AMT13>
            <YTD_OTH_DEDN_AMT13 xtt:fixedLength="13" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[13]"><xsl:value-of select="Remittance_Data/Payroll_Employer_Paid_Benefits_Data/Employer_Paid_Benefits_Data[13]/wpc:PAYROLL_EmployerPaidBenefits_YTD"/></xsl:if></YTD_OTH_DEDN_AMT13>
            <TOTLIT3 xtt:fixedLength="22"><xsl:value-of select="'Total:'"/></TOTLIT3>
            <!--TOTALS-->
            <CUR_PRE_TAX_DEDNTOT xtt:fixedLength="12" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Pre Tax Deductions']"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Pre Tax Deductions']/wpc:PAYROLL_Total_Current_Period"/></xsl:if></CUR_PRE_TAX_DEDNTOT>
            <YTD_PRE_TAX_DEDNTOT xtt:fixedLength="12" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Pre Tax Deductions']"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Pre Tax Deductions']/wpc:PAYROLL_Total_YTD"/></xsl:if></YTD_PRE_TAX_DEDNTOT>
            <LIT_1_58 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_58>
            <TOTLIT4 xtt:fixedLength="22"><xsl:value-of select="'Total:'"/></TOTLIT4>
            <CUR_AFT_TAX_DEDNTOT xtt:fixedLength="12" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Post Tax Deductions']"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Post Tax Deductions']/wpc:PAYROLL_Total_Current_Period"/></xsl:if></CUR_AFT_TAX_DEDNTOT>
            <YTD_AFT_TAX_DEDNTOT xtt:fixedLength="12" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Post Tax Deductions']"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Post Tax Deductions']/wpc:PAYROLL_Total_YTD"/></xsl:if></YTD_AFT_TAX_DEDNTOT>
            <LIT_1_59 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_59>
            <TAXABLE_LIT1 xtt:fixedLength="22"><xsl:value-of select="'Total:'"/></TAXABLE_LIT1>
            <CUR_OTH_TAX_DEDN_TOT14 xtt:fixedLength="16" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Employer Paid Benefits']"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Employer Paid Benefits']/wpc:PAYROLL_Total_Current_Period"/></xsl:if></CUR_OTH_TAX_DEDN_TOT14>
            <YTD_OTH_TAX_DEDN_AMT14 xtt:fixedLength="14" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Employer Paid Benefits']"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name = 'Employer Paid Benefits']/wpc:PAYROLL_Total_YTD"/></xsl:if></YTD_OTH_TAX_DEDN_AMT14>
            <LINELIT4 xtt:fixedLength="94" xtt:paddingCharacter="_"><xsl:value-of select="''"/></LINELIT4>
            <TOTGROSS xtt:fixedLength="13"/>
            <FED_TAXABLE_GROSS xtt:fixedLength="20"><xsl:value-of select="'FED TAXABLE GROSS'"/></FED_TAXABLE_GROSS>
            <TOTTAXES xtt:fixedLength="13"><xsl:value-of select="'TOTAL TAXES'"/></TOTTAXES>
            <TOTDEDN xtt:fixedLength="18"><xsl:value-of select="'TOTAL DEDUCTIONS'"/></TOTDEDN>
            <NET_PAY xtt:fixedLength="9"><xsl:value-of select="'NET PAY'"/></NET_PAY>   
            <CURRENT_LIT5 xtt:fixedLength="10"><xsl:value-of select="'CURRENT:'"/></CURRENT_LIT5>
            <CURRENT_TOTAL_GROSS xtt:fixedLength="17"><xsl:value-of select="''"/></CURRENT_TOTAL_GROSS>
            <CURRENT_FED_TAX_GROSS xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Gross_And_Net_Data/Gross_And_Net_Data[wpc:PAYROLL_GrossNetType_Reference ='Gross']/wpc:PAYROLL_GrossNetAmount"/></CURRENT_FED_TAX_GROSS>
            <CURRENT_TOTAL_TAXES xtt:fixedLength="16" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:if test="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name ='Employee Taxes']"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name ='Employee Taxes']/wpc:PAYROLL_Total_Current_Period"/></xsl:if></CURRENT_TOTAL_TAXES>
            <CURRENT_TOT_DEDUCTION xtt:fixedLength="16" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name ='Post Tax Deductions']/wpc:PAYROLL_Total_Current_Period + Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name ='Pre Tax Deductions']/wpc:PAYROLL_Total_Current_Period"/></CURRENT_TOT_DEDUCTION>
            <CURRENT_NET_PAY_TOTAL xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Gross_And_Net_Data/Gross_And_Net_Data[wpc:PAYROLL_GrossNetType_Reference ='Net']/wpc:PAYROLL_GrossNetAmount"/></CURRENT_NET_PAY_TOTAL>
            
            <YTDLIT4 xtt:fixedLength="10"><xsl:value-of select="'YTD'"/></YTDLIT4>
            <YTD_TOTGROSS xtt:fixedLength="17"><xsl:value-of select="''"/></YTD_TOTGROSS>
            <YTD_FED_TAX_GROSS xtt:fixedLength="17" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Gross_And_Net_Data/Gross_And_Net_Data[wpc:PAYROLL_GrossNetType_Reference ='Gross']/wpc:PAYROLL_GrossNetYTD"/></YTD_FED_TAX_GROSS>
            <YTD_TOTTAXES xtt:fixedLength="16" xtt:align="right"><xsl:if test="Remittance_Data/Payroll_Employee_Taxes_Data/Employee_Taxes_Data[1]"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name ='Employee Taxes']/wpc:PAYROLL_Total_YTD"/></xsl:if></YTD_TOTTAXES>
            <YTD_TOTDED xtt:fixedLength="16" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name ='Post Tax Deductions']/wpc:PAYROLL_Total_YTD + Remittance_Data/Payroll_Total_Data/Total_Data[wpc:PAYROLL_Total_Label_Name ='Pre Tax Deductions']/wpc:PAYROLL_Total_YTD"/></YTD_TOTDED>
            <YTD_NET_PAY xtt:fixedLength="18" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="Remittance_Data/Payroll_Gross_And_Net_Data/Gross_And_Net_Data[wpc:PAYROLL_GrossNetType_Reference ='Net']/wpc:PAYROLL_GrossNetYTD"/></YTD_NET_PAY>
            
            <LINELIT5 xtt:fixedLength="94" xtt:paddingCharacter="_"><xsl:value-of select="''"/></LINELIT5>
            <PTOHRS_LIT xtt:fixedLength="11"><xsl:value-of select="'PTO HOURS'"/></PTOHRS_LIT>
            <YTDLIT5 xtt:fixedLength="5"><xsl:value-of select="'YTD'"/></YTDLIT5>
            <LIT_1_60 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_60>
            <BLANK_9 xtt:fixedLength="12"><xsl:value-of select="''"/></BLANK_9>
            <BLANK_9A xtt:fixedLength="5"><xsl:value-of select="''"/></BLANK_9A>
            <LIT_1_61 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_61>
            <FLHOLHRS_LIT xtt:fixedLength="24"><xsl:value-of select="'FLOATING HOLIDAY HOURS'"/></FLHOLHRS_LIT>
            <YTDLIT6 xtt:fixedLength="5"><xsl:value-of select="'YTD'"/></YTDLIT6>
            <LIT_1_62 xtt:fixedLength="3"><xsl:value-of select="' 1'"/></LIT_1_62>
            <NET_PAY_DIST_LIT xtt:fixedLength="22"><xsl:value-of select="'NET PAY DISTRIBUTION'"/></NET_PAY_DIST_LIT>
            
            <PRYRLIT xtt:fixedLength="16"><xsl:value-of select="'PRIOR YEAR:'"/></PRYRLIT>
            <PRYRYTD_PTO_HRS xtt:fixedLength="11" xtt:align="right"  xtt:numberFormat="#,###.00"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='PRYRYTD_PTO_HRS']"/></PRYRYTD_PTO_HRS>
            <LIT_1_63 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_63>
            <BLANK_10 xtt:fixedLength="16"><xsl:value-of select="''"/></BLANK_10>
            <BLANK_11 xtt:fixedLength="10"><xsl:value-of select="''"/></BLANK_11>
            <LIT_1_64 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_64>
            <START_BAL_LIT xtt:fixedLength="16"><xsl:value-of select="'START BALANCE:'"/></START_BAL_LIT>
            
            <FLHOL_START_BAL xtt:fixedLength="11" xtt:numberFormat="#,###.00"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='FLHOL_START_BAL']"/></FLHOL_START_BAL>
            <LIT_1_65 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_65>
            <CK_ADV_1 xtt:fixedLength="10"><xsl:value-of select="'CHECK:'"/></CK_ADV_1>
            <CK_ADV_NO_1 xtt:fixedLength="9" xtt:align="left"><xsl:value-of select="''"/></CK_ADV_NO_1>
            <CK_ADV_AMT_1 xtt:fixedLength="16"><xsl:value-of select="'1'"/></CK_ADV_AMT_1>
            <ALLOW_LIT1 xtt:fixedLength="14"><xsl:value-of select="'+ ALLOWANCE:'"/></ALLOW_LIT1>
            
            <PTO_ALLOW xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='PTO_ALLOW']"/></PTO_ALLOW>
            <LIT_1_66 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_66>
            <BLANK_12 xtt:fixedLength="14"><xsl:value-of select="''"/></BLANK_12>
            <BLANK_13 xtt:fixedLength="10"><xsl:value-of select="''"/></BLANK_13>
            <LIT_1_67 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_67>
            <ALLOW_LIT2 xtt:fixedLength="14"><xsl:value-of select="'+ ALLOWANCE:'"/></ALLOW_LIT2>
            
            <FLOAT_HOL_ALLOW xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='FLOAT_HOL_ALLOW']"/></FLOAT_HOL_ALLOW>
            <LIT_1_68 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_68>
            <CK_ADV_NO_2 xtt:fixedLength="10"><xsl:value-of select="'+ ALLOWANCE:'"/></CK_ADV_NO_2>
            <CK_ADV_AMT_2 xtt:fixedLength="15"><xsl:value-of select="'+ ALLOWANCE:'"/></CK_ADV_AMT_2>
            <TAKEN_LITP xtt:fixedLength="9"><xsl:value-of select="'- TAKEN:'"/></TAKEN_LITP>
            
            <PTO_TAKEN xtt:fixedLength="10" xtt:align="right"  xtt:numberFormat="#,###.00"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='PTO_TAKEN']"/></PTO_TAKEN>
            <LIT_1_69 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_69>
            <BLANK_16 xtt:fixedLength="10"><xsl:value-of select="''"/></BLANK_16>
            <BLANK_17 xtt:fixedLength="10"><xsl:value-of select="''"/></BLANK_17>
            <LIT_1_70 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_70>
            <TAKEN_LITF xtt:fixedLength="10"><xsl:value-of select="'- TAKEN:'"/></TAKEN_LITF>
            
            <FLOAT_HOL_TAKEN xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='FLOAT_HOL_TAKEN']"/></FLOAT_HOL_TAKEN>
            <LIT_1_71 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_71>
            <TOTLIT5 xtt:fixedLength="9"><xsl:value-of select="'TOTAL:'"/></TOTLIT5>
            <TOT_NETPAY xtt:fixedLength="15"><xsl:value-of select="'- TAKEN:'"/></TOT_NETPAY>
            <ADJUST_LIT1 xtt:fixedLength="16"><xsl:value-of select="'+ ADJUSTMENTS:'"/></ADJUST_LIT1>
            
            <PTO_ADJUST xtt:fixedLength="11" xtt:align="right"><xsl:value-of select="''"/></PTO_ADJUST>
            <LIT_1_72 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_72>
            <BLANK_18 xtt:fixedLength="16"><xsl:value-of select="''"/></BLANK_18>
            <BLANK_19 xtt:fixedLength="10"><xsl:value-of select="''"/></BLANK_19>
            <LIT_1_73 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_73>
            <ADJUST_LIT2 xtt:fixedLength="16"><xsl:value-of select="'+ ADJUSTMENTS:'"/></ADJUST_LIT2>
            
            <FLOAT_HOL_ADJUST xtt:fixedLength="11" xtt:align="right"><xsl:value-of select="''"/></FLOAT_HOL_ADJUST>
            <LIT_1_74 xtt:fixedLength="1"><xsl:value-of select="'1'"/></LIT_1_74>
            <LINE_LIT6 xtt:fixedLength="31" xtt:paddingCharacter="_"><xsl:value-of select="''"/></LINE_LIT6>
            <END_BALANCE xtt:fixedLength="14"><xsl:value-of select="'END BALANCE:'"/></END_BALANCE>
            
            <PTOENDBAL xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='PTOENDBAL']"/></PTOENDBAL>
            <LIT_1_75 xtt:fixedLength="2"><xsl:value-of select="'1'"/></LIT_1_75>
            <BLANK_20 xtt:fixedLength="14"><xsl:value-of select="'1'"/></BLANK_20>
            <BLANK_21 xtt:fixedLength="10"><xsl:value-of select="'1'"/></BLANK_21>
            <LIT_1_76 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_76>
            <ENDBALLIT xtt:fixedLength="14"><xsl:value-of select="'END BALANCE:'"/></ENDBALLIT>

            <FLOAT_HOL_END_BAL xtt:fixedLength="11" xtt:align="right" xtt:numberFormat="#,###.00"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='FLOAT_HOL_END_BAL']"/></FLOAT_HOL_END_BAL>
            <LIT_1_78 xtt:fixedLength="3"><xsl:value-of select="'1'"/></LIT_1_78>
            <LINE_LIT7 xtt:fixedLength="67" xtt:paddingCharacter="_"><xsl:value-of select="''"/></LINE_LIT7>
            <MSG_LIT xtt:fixedLength="10"><xsl:value-of select="'MESSAGE:'"/></MSG_LIT>
            <MSG_TEXT xtt:fixedLength="100"><xsl:value-of select="''"/></MSG_TEXT>
            <AMT_SPELLED_CONT xtt:fixedLength="52"><xsl:value-of select="''"/></AMT_SPELLED_CONT>
            <RECORD_NO xtt:fixedLength="8"  xtt:number="$counter"></RECORD_NO>
            <CK_ADV_2 xtt:fixedLength="10"><xsl:value-of select="''"/></CK_ADV_2>
            <NAME_90 xtt:fixedLength="275"><xsl:value-of select="translate(Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Name,$lowercase,$uppercase)"/></NAME_90>
            
            <CO_NAME_90 xtt:fixedLength="58"><xsl:value-of select="Payment_Detail[1]/Payment_Info/wpc:PAYMENT_Company"/></CO_NAME_90>
            <EARN_NAME1 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[1]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME1>
            <EARN_NAME2 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[2]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME2>
            <EARN_NAME3 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[3]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME3>
            <EARN_NAME4 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[4]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME4>
            <EARN_NAME5 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[5]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME5>
            <EARN_NAME6 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[6]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME6>
            <EARN_NAME7 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[7]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME7>
            <EARN_NAME8 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[8]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME8>
            <EARN_NAME9 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[9]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME9>
            <EARN_NAME10 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[10]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME10>
            <EARN_NAME11 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[11]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME11>
            <EARN_NAME12 xtt:fixedLength="26"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[12]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME12>
            <EARN_NAME13 xtt:fixedLength="88"><xsl:value-of select="Remittance_Data/Payroll_Earnings_Data/Earnings_Data[13]/wpc:PAYROLL_Earnings_Pay_Component"/></EARN_NAME13>            
            <!-- BANK ACCOUNTS -->
            <ACCOUNT_TYPE_1 xtt:fixedLength="16">
                <xsl:choose>
                    <xsl:when test="Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'SA' ">
                        <xsl:value-of select="'Savings'"/>
                    </xsl:when>
                    <xsl:when test="Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'DDA'">
                        <xsl:value-of select="'Checking'"/>
                    </xsl:when>
                </xsl:choose>
            </ACCOUNT_TYPE_1>
            <ACCT_NUMBER_1 xtt:fixedLength="16"><xsl:value-of select="Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Number"/></ACCT_NUMBER_1>
            <ACCT_AMT_1 xtt:fixedLength="16"  xtt:numberFormat="#,###.00"><xsl:value-of select="Payment_Detail[1]/Payment_Info/wpc:PAYMENT_Payment_Amount"/></ACCT_AMT_1>
            <ACCOUNT_TYPE_2 xtt:fixedLength="16">
                <xsl:choose>
                    <xsl:when test="Payment_Detail[2]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'SA' ">
                        <xsl:value-of select="'Savings'"/>
                    </xsl:when>
                    <xsl:when test="Payment_Detail[2]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'DDA'">
                        <xsl:value-of select="'Checking'"/>
                    </xsl:when>
                </xsl:choose>
            </ACCOUNT_TYPE_2>
            <ACCT_NUMBER_2 xtt:fixedLength="16"><xsl:value-of select="Payment_Detail[2]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Number"/></ACCT_NUMBER_2>
            <ACCT_AMT_2 xtt:fixedLength="16"  xtt:numberFormat="#,###.00"><xsl:value-of select="Payment_Detail[2]/Payment_Info/wpc:PAYMENT_Payment_Amount"/></ACCT_AMT_2>
            <ACCOUNT_TYPE_3 xtt:fixedLength="16">
                <xsl:choose>
                    <xsl:when test="Payment_Detail[3]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'SA' ">
                        <xsl:value-of select="'Savings'"/>
                    </xsl:when>
                    <xsl:when test="Payment_Detail[3]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'DDA'">
                        <xsl:value-of select="'Checking'"/>
                    </xsl:when>
                </xsl:choose>
            </ACCOUNT_TYPE_3>
            <ACCT_NUMBER_3 xtt:fixedLength="16"><xsl:value-of select="Payment_Detail[3]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Number"/></ACCT_NUMBER_3>
            <ACCT_AMT_3 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:value-of select="Payment_Detail[3]/Payment_Info/wpc:PAYMENT_Payment_Amount"/></ACCT_AMT_3>
            <ACCOUNT_TYPE_4 xtt:fixedLength="16">
                    <xsl:choose>
                        <xsl:when test="Payment_Detail[4]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'SA' ">
                            <xsl:value-of select="'Savings'"/>
                        </xsl:when>
                        <xsl:when test="Payment_Detail[4]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'DDA'">
                            <xsl:value-of select="'Checking'"/>
                        </xsl:when>
                    </xsl:choose>
            </ACCOUNT_TYPE_4>
            <ACCT_NUMBER_4 xtt:fixedLength="16"><xsl:value-of select="Payment_Detail[4]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Number"/></ACCT_NUMBER_4>
            <ACCT_AMT_4 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:value-of select="Payment_Detail[4]/Payment_Info/wpc:PAYMENT_Payment_Amount"/></ACCT_AMT_4>
            <ACCOUNT_TYPE_5 xtt:fixedLength="16">
                <xsl:choose>
                    <xsl:when test="Payment_Detail[5]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'SA' ">
                        <xsl:value-of select="'Savings'"/>
                    </xsl:when>
                    <xsl:when test="Payment_Detail[5]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'DDA'">
                        <xsl:value-of select="'Checking'"/>
                    </xsl:when>
                </xsl:choose>
            </ACCOUNT_TYPE_5>
            <ACCT_NUMBER_5 xtt:fixedLength="16"><xsl:value-of select="Payment_Detail[5]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Number"/></ACCT_NUMBER_5>
            <ACCT_AMT_5 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:value-of select="Payment_Detail[5]/Payment_Info/wpc:PAYMENT_Payment_Amount"/></ACCT_AMT_5>
            <ACCOUNT_TYPE_6 xtt:fixedLength="16">
                <xsl:choose>
                    <xsl:when test="Payment_Detail[6]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'SA' ">
                        <xsl:value-of select="'Savings'"/>
                    </xsl:when>
                    <xsl:when test="Payment_Detail[6]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'DDA'">
                        <xsl:value-of select="'Checking'"/>
                    </xsl:when>
                </xsl:choose>
            </ACCOUNT_TYPE_6>
            <ACCT_NUMBER_6 xtt:fixedLength="16"><xsl:value-of select="Payment_Detail[6]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Number"/></ACCT_NUMBER_6>
            <ACCT_AMT_6 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:value-of select="Payment_Detail[6]/Payment_Info/wpc:PAYMENT_Payment_Amount"/></ACCT_AMT_6>
            <ACCOUNT_TYPE_7 xtt:fixedLength="16">
                <xsl:choose>
                    <xsl:when test="Payment_Detail[7]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'SA' ">
                        <xsl:value-of select="'Savings'"/>
                    </xsl:when>
                    <xsl:when test="Payment_Detail[7]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Type = 'DDA'">
                        <xsl:value-of select="'Checking'"/>
                    </xsl:when>
                </xsl:choose>
            </ACCOUNT_TYPE_7>
            <ACCT_NUMBER_7 xtt:fixedLength="16"><xsl:value-of select="Payment_Detail[7]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Account_Number"/></ACCT_NUMBER_7>
            <ACCT_AMT_7 xtt:fixedLength="16" xtt:numberFormat="#,###.00"><xsl:value-of select="Payment_Detail[7]/Payment_Info/wpc:PAYMENT_Payment_Amount"/></ACCT_AMT_7>
            <FILLER xtt:fixedLength="6849"></FILLER>
            
            <!-- END BANK ACCOUNT -->
            <ADDRESS_2 xtt:fixedLength="41"><xsl:value-of select="Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Address_Line_2"/></ADDRESS_2>
            <ADDRESS_3 xtt:fixedLength="41"><xsl:value-of select="concat(Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_City,',',' ',substring-after(Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_State,'-'),' ',Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Zip_Code)"/></ADDRESS_3>
            <ADDRESS_4 xtt:fixedLength="164"><xsl:value-of select="''"/></ADDRESS_4>
            <CO_NAME_95 xtt:fixedLength="100"><xsl:value-of select="Payment_Detail[1]/Payment_Info/wpc:PAYMENT_Company"/></CO_NAME_95>
            <PAY_GROUP xtt:fixedLength="30" xtt:align="right"><xsl:value-of select="Remittance_Data/Payroll_Remittance_Data/wpc:PAYROLL_Remittance_Pay_Group_Detail_Reference"/></PAY_GROUP>
            <EMPLID xtt:fixedLength="33" xtt:align="left"><xsl:value-of select="Remittance_Data/Payroll_Worker_Data/wpc:PAYROLL_Worker_Employee_ID"/></EMPLID>
            <CHK_ADVICE_IND xtt:fixedLength="37"><xsl:value-of select="'A'"/></CHK_ADVICE_IND >
            <POSTAL_NUMBER xtt:fixedLength="100"><xsl:value-of select="CalculatedFieldData/Field_Value[@name='MailStop']"/></POSTAL_NUMBER >
            <NAME_95 xtt:fixedLength="66"><xsl:value-of select="translate(Payment_Detail[1]/Receiving_Party_And_Bank_Data/wpc:PAYEE_Name,$lowercase,$uppercase)"/></NAME_95 >
            <CHK_SORT xtt:fixedLength="3"><xsl:value-of select="'BB'"/></CHK_SORT >
        </DetailRow>
                </xsl:if>    
            </xsl:for-each>
</File>      
    </xsl:template>
</xsl:stylesheet>