
view: first_point_of_impact_pdt {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:SELECT Vehicles.First_Point_of_Impact, CAST(Vehicles.Driver_IMD_Decile as int64) as Driver_IMD_Decile,
              COUNT(Vehicles.First_Point_of_Impact) AS value_occurrence
     FROM     Vehicles
     WHERE CAST(Vehicles.Driver_IMD_Decile as int64) > -1 AND CAST(Vehicles.First_Point_of_Impact as int64) > -1
     GROUP BY 1,2
     ORDER BY 3 DESC
      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: Mode_First_Point_of_Impact {
    description: "Most common first point of impact"
    type: string
    sql: ${TABLE}.First_Point_of_Impact ;;
  }
  dimension: IMD_Decile {
    description: "IMD Decile"
    type: string
    sql: ${TABLE}.Driver_IMD_Decile ;;
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
