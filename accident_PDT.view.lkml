view: accident_pdt {

  derived_table: {
    sql: SELECT Accidents.Accident_Index, Accidents.Longitude, Accidents.Latitude, Police_Force.label as Police_Label, Accident_Severity.label
    as Accident_Label, Accidents.Number_of_Vehicles, Accidents.Number_of_Casualties, Accidents.date, Road_Class.label as Road_Class, (SELECT CAST(CONCAT(CAST(date AS STRING), " ", time, ":00") AS TIMESTAMP)) as time
       FROM Accidents, Police_Force, Accident_Severity
      WHERE Accidents.Police_Force = Police_Force.code
      AND Accidents.Accident_Severity = Accident_Severity.code
      AND Accidents._1st_Road_Class = Road_Class.code
       ;;

}
dimension: accident_index {
description: "Unique ID for each accident"
type: string
sql: ${TABLE}.accident_index ;;
}

dimension: location {
description: "Accident Location"
type: location
sql_latitude: Longitude ;;
sql_longitude:Latitude ;;
}

dimension: police_force {
description: "Police Force"
type: string
sql:  Police_label;;
}

dimension: accident_severity {
  description: "Accident Severity"
  type: string
  sql:  Accident_Label ;;
}
  dimension: Number_of_Casualties{
    description: "Number of Casualties"
    type: number
    sql: Number_of_Casualties ;;
  }

dimension: Number_of_Vehicles{
  description: "Number of Vehicles"
  type: number
  sql: Number_of_Vehicles ;;
}
#dimension_group: Date {
#  description: "Accident Date"
#  type: time
#  timeframes: [date, week, month, year, day_of_week, hour_of_day, month_name, week_of_year]
#  sql: date ;;
#}
dimension_group: Time {
  description: "Time of Accident"
  type: time
  timeframes: [date, week, month, year, day_of_week, hour_of_day, month_name, week_of_year]
  sql:  time;;
}
dimension: 1st_Road_Class {
  description: "1st Road Class"
  type: string
  sql: 1st_Road_Class_Label;;
}
}

# view: accident_pdt {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
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
