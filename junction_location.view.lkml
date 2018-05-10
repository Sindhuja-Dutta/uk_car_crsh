view: junction_location {
  sql_table_name: UK_Car_Crashes.Junction_Location ;;

  dimension: code {
    hidden: yes
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: label {
    label: "Junction Location"
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
