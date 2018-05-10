view: vehicle_manoeuvre {
  sql_table_name: UK_Car_Crashes.Vehicle_Manoeuvre ;;

  dimension: code {
    hidden: yes
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: Vehicle_Manoeuvre_label {
    label: "Vehicle Manoeuvre"
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
