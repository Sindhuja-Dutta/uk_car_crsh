view: ped_location {
  sql_table_name: UK_Car_Crashes.Ped_Location ;;

   dimension: code {
     hidden: yes
     type: number
     sql: ${TABLE}.code ;;
   }

  dimension: pedestrian_location {
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
