view: ped_movement {
  sql_table_name: UK_Car_Crashes.Ped_Movement ;;

  dimension: code {
    hidden: yes
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: Pedestrian_Movement {
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
