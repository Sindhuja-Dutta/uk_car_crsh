view: point_of_impact {
  sql_table_name: UK_Car_Crashes.Point_of_Impact ;;

  dimension: code {
    hidden: yes
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: point_of_impact_label {
    label: "First Point of Impact"
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
