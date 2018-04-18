view: casualty_type {
  sql_table_name: UK_Car_Crashes.Casualty_Type ;;

  dimension: code {
    type: number
    hidden: yes
    sql: ${TABLE}.code ;;
  }

  dimension: Casualty_type {
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
