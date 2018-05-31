view: local_authority_data {
  sql_table_name: UK_Car_Crashes.Local_Authority_Data ;;

  dimension: total_population {
    type: number
    sql: ${TABLE}.`All` ;;
  }

  dimension: area_ {
    type: number
    sql: ${TABLE}.Area_ ;;
  }

  dimension: area_code {
    type: string
    sql: ${TABLE}.AreaCode ;;
  }

  dimension: communal {
    type: number
    sql: ${TABLE}.Communal ;;
  }

  dimension: density {
    type: number
    sql: ${TABLE}.Density ;;
  }
  dimension: population_density_tier {
    type: tier
    tiers: [25,50,75,100]
    style: interval
    sql: ${TABLE}.Density ;;
  }

  dimension: district {
    primary_key: yes
    type: string
    sql: ${TABLE}.District ;;
  }

  dimension: density_peer1{
    type: string
    sql: (SELECT
  districts_defined.district
FROM UK_Car_Crashes.Accidents  AS accidents
LEFT JOIN `UK_Car_Crashes.Local_Authority_District` AS district ON accidents.Local_Authority__District_ = district.code LEFT JOIN `indigo-bazaar-192612.Looker_Scratch.LR_5BX85TOSPVP2XXGDZ10WE_districts_defined` AS districts_defined ON districts_defined.district = district.label
WHERE districts_defined.density = (SELECT
  districts_defined.density
FROM UK_Car_Crashes.Accidents  AS accidents
LEFT JOIN `UK_Car_Crashes.Local_Authority_District` AS district ON accidents.Local_Authority__District_ = district.code LEFT JOIN `indigo-bazaar-192612.Looker_Scratch.LR_5BX85TOSPVP2XXGDZ10WE_districts_defined` AS districts_defined ON districts_defined.district = district.label
WHERE districts_defined.density > (SELECT
  distinct(districts_defined.density)
FROM UK_Car_Crashes.Accidents  AS accidents
LEFT JOIN `UK_Car_Crashes.Local_Authority_District` AS district ON accidents.Local_Authority__District_ = district.code LEFT JOIN `indigo-bazaar-192612.Looker_Scratch.LR_5BX85TOSPVP2XXGDZ10WE_districts_defined` AS districts_defined ON districts_defined.district = district.label
WHERE districts_defined.district = ${TABLE}.District
limit 1)
order by 1 asc
limit 1)
order by 1 asc
limit 1)    ;;
}

  dimension: females {
    type: number
    sql: ${TABLE}.Females ;;
  }

  dimension: household {
    type: number
    sql: ${TABLE}.household ;;
  }

  dimension: males {
    type: number
    sql: ${TABLE}.Males ;;
  }

  dimension: school_boarder {
    type: number
    sql: ${TABLE}.SchoolBoarder ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
