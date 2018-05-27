
view: district_comparison {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:SELECT
  district.code as district_code
  ,districts_defined.district
  ,districts_defined2.district as district2_code

  -- districts_defined2.district
FROM UK_Car_Crashes.Accidents  AS accidents
LEFT JOIN `UK_Car_Crashes.Local_Authority_District` AS district ON accidents.Local_Authority__District_ = district.code
LEFT JOIN ${districts_defined.SQL_TABLE_NAME} AS districts_defined ON districts_defined.district = district.label
LEFT JOIN  ${districts_defined.SQL_TABLE_NAME} AS districts_defined2 ON districts_defined.density = districts_defined2.density and districts_defined.district != districts_defined2.district

limit 100


      ;;
  }



  # Define your dimensions and measures here, like this:
  dimension: district_code {

    type: number
    sql: ${TABLE}.district_code ;;
  }

  dimension: district_one {

    type: number
    sql: ${TABLE}.district ;;
  }

  dimension: district_two {

    type: number
    sql: ${TABLE}.district2_code ;;
  }
  }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
