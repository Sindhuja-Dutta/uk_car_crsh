view: sex_of_driver {
  sql_table_name: UK_Car_Crashes.Sex_of_Driver ;;

  dimension: code {
    hidden: yes
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: sex_of_driver_label {
    label: "Sex of person"
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
