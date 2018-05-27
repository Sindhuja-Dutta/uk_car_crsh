view: accident_costs {
  sql_table_name: UK_Car_Crashes.Accident_Costs ;;

  dimension: accident_casualty_type {
    primary_key: yes
    type: string
    sql: ${TABLE}.Accident_casualty_type ;;
  }

  dimension: cost_per_accident {
    type: number
    sql: ${TABLE}.Cost_per_accident ;;
  }

  dimension: cost_per_casualty {
    type: number
    sql: ${TABLE}.Cost_per_casualty ;;
  }

  measure: casualty_cost_sum1 {
    type: sum
    sql: ${cost_per_casualty} ;;
    drill_fields: []
  }
}
