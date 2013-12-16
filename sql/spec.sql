select cs_histogram(Close, 0, 100, 10) from Quote_get('IBM');
select cs_cross(Open-Close, 0) from Quote_get('IBM');
select cs_extrema(cs_parse('{1,2,3,2,1,0,0,1,1,2,4,0}','int4'), 0);
select cs_extrema(cs_parse('{1,2,3,2,1,0,0,1,1,2,4,0}','int4'), 1);
select cs_extrema(cs_parse('{1,2,3,2,1,0,0,1,1,2,4,0}','int4'), -1);
select cs_stretch(cs_parse('{1,2,3,4,5}','int4'), cs_parse('{2,4}','int4'), cs_parse('{1.1,2.2}','float8'), 1.0);
select cs_stretch0(cs_parse('{1,2,3,5}','int8'), cs_parse('{2,3,4}','int8'), cs_parse('{1.1,1.2,1.3}','float4'), 0.0);
select cs_asof_join(cs_parse('{4,9}','int4'), cs_parse('{1,3,6,10}','int4'), cs_parse('{0.1,0.3,0.6,1.0}','float8'));
select cs_asof_join_pos('int8:{4,9}', 'int8:{1,3,6,10}');
select (Quote_project(q.*,'date:{31-Oct-2013,03-Nov-2013}'->Day)).* from Quote_get('IBM') q;
select (Quote_project(q.*,'date:{1-Nov-2013,2-Nov-2013,03-Nov-2013,04-Nov-2013}'<->Day)).* from Quote_get('IBM') q;
select cs_join('date:{1-Nov-2013,2-Nov-2013,03-Nov-2013,04-Nov-2013}', Day, Close) from Quote_get('IBM');