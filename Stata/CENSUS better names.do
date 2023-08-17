/* This is for make simpler and manageable names for the census dataset */

/* this is only to track the old and long names */
rename city_or_subdistrict loc_name
rename adult_can_read_and_write literacy
rename young_can_read_and_write yliteracy
rename men_no_education uneducated_men
rename women_no_education uneducated_w
rename men_primary primary_men
rename women_primary primary_w
rename men_high_school high_sch_men
rename women_high_school high_sch_w
rename men_undergraduted underg_men
rename women_undergraduted underg_w
rename men_unknow_education unknow_ed_men
rename women_unknow_education unknow_ed_w
rename men_deceased deceased_men
rename women_deceased deceased_w
rename child_deceased deceased_c
rename avg_dormitories avg_dorm
rename water_outside_house exterior_water
rename water_in_the_house indoor_water
rename sewage_sceptic_tank sewage_tank
rename sewage_rud_sceptic_tank RUD_sewage_tank
rename sewage_network sewage_net
rename xwomen_for100men_above15 women_per_100_men
rename xmen_for100women_above60 men_per100w_a60
rename pct_works_in_municipality pct_works_in_mun
rename pct_works_in_another_municipalit pct_works_in_a_mun
rename pct_works_in_foreign_country pct_w_in_f_country
rename pct_commute_hw_5min pct_com_hw_5min
rename pct_commute_hw_b_6min_and_half_h pct_c_hw_6m_half_h
rename pct_commute_hw_b_half_h_and_1h pct_c_hw_bhalfh_1h
rename pct_commute_hw_b_1h_and_2h pct_c_hw_b1h2h
rename pct_commute_hw_more_than_2h pct_c_hw_m2h
rename pct_return_from_work_everyday pct_rfrom_w_eday

/* These labels  */

label variable loc_name "City/Subdistrict Designation"
label variable literacy "Number of adults that can read and write"
label variable yliteracy "Number of youngs that can read and write"
label variable uneducated_men "Men with no education"
label variable uneducated_w "Women with no education"
label variable primary_men "Men with primary school"
label variable primary_w "Women with primary school"
label variable high_sch_men "Men with high school"
label variable high_sch_w "Women with high school"
label variable underg_men "Men undergraduted"
label variable underg_w "Women undergraduted"
label variable unknow_ed_men "Men with unknown education"
label variable unknow_ed_w "Women with unknown education"
label variable deceased_men "Men deceased"
label variable deceased_w "Women deceased"
label variable deceased_c "Child deceased"
label variable avg_dorm "Average dormitories per housing"
label variable exterior_water "Water  outside house"
label variable no_water "No water"
label variable indoor_water "Water in the house"
label variable sewage_ditch "Sewage ditch"
label variable sewage_tank "Sewage sceptic tank"
label variable RUD_sewage_tank "Sewage rud sceptic tank"
label variable sewage_river_etc "Sewage river etc"
label variable sewage_net "Sewage network"
label variable population "Population counting"
label variable pct_male "pct Male"
label variable pct_female "pct Female"
label variable women_per_100_men "XWomen for 100 men above 15"
label variable pct_pop_above_15 "pct population above 15"
label variable men_per100w_a60 "XMen for 100 Women above 60"
label variable pct_pop_above_60 "pct population above 60"
label variable pct_white "pct White"
label variable pct_black "pct Black"
label variable pct_asian "pct Asian"
label variable pct_brownbrazil "pct Brown (Brazil)"
label variable pct_indigenous "pct Indigenous"
label variable pct_works_in_home "pct population that works at home"
label variable pct_works_in_mun "pct population that works in the municipality"
label variable pct_works_in_a_mun "pct works in another municipality"
label variable pct_w_in_f_country "pct works in foreign country"
label variable pct_com_hw_5min "pct commute Home Work in 5min"
label variable pct_c_hw_6m_half_h "pct commute Home Work beteween 6min and half hour"
label variable pct_c_hw_bhalfh_1h "pct commute Home Work between half hour and 1h"
label variable pct_c_hw_b1h2h "pct commute Home Work between 1h and 2h"
label variable pct_c_hw_m2h "pct commute Home Work in more than 2h"
label variable pct_rfrom_w_eday "pct return from work everyday"