view: casualty_severity {
  sql_table_name: UK_Car_Crashes.Casualty_Severity ;;

  dimension: code {
    type: number
    hidden: yes
    sql: ${TABLE}.code ;;
  }

  dimension: casualty_severity {
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
