<process name="testing_LJDBC">
 <sequence name="Sequence Start">

 <operation name="Timestamp Utility">
  <participant name="TimestampUtilService"/>
  <output message="TimestampUtilServiceTypeInputMessage">
    <assign to="action">add</assign>
    <assign to="baseTime">now</assign>
    <assign to="baseTimeFormat">yyyy-MM-dd HH:mm:ss</assign>
    <assign to="format">yyyy-MM-dd HH:mm:ss</assign>
    <assign to="offsetTime">-1</assign>  
    <assign to="scale">day</assign>      
    <assign to="." from="*"/>
  </output>
  <input message="inmsg">
    <assign to="/ProcessData/calculated" from="*" append="true"/>
  </input>
</operation>

<assign to="Time" from="/ProcessData/calculated/time"/>

<assign to="/ProcessData/dynamicFilter1" from="concat('sfg_logs_', substring-before(/ProcessData/Time/time, ' '), ' 00:00:00')"/>
<assign to="/ProcessData/dynamicFilter2" from="concat('sfg_logs_', substring-before(/ProcessData/Time/time, ' '), ' 24:00:00')"/>

<operation name="LightweightJDBCAdapterType">
      <participant name="LightweightJDBCAdapterQuery"/>
      <output message="LightweightJDBCAdapterTypeInputMessage">
	  <assign to="." from="*"></assign>       
        <assign to="param1" from="/ProcessData/dynamicFilter1"></assign>       
        <assign to="paramtype1">String</assign>
        <assign to="param2" from="/ProcessData/dynamicFilter2"></assign>        
        <assign to="paramtype2">String</assign>
        <assign to="pool">oraclePool</assign>
        <assign to="query_type">ACTION</assign>
        <assign to="sql">DELETE FROM FILENAMES WHERE CURRENT_DATE BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS')</assign>
        <assign to="." from="*"></assign>
      </output>
      <input message="inmsg">
        <assign to="." from="DocToDOM(PrimaryDocument)"></assign>
      </input>
    </operation>
  </sequence>
 </process>