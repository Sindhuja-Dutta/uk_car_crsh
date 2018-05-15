view: vehicle_make_model {
  label: "Vehicles"
  sql_table_name: UK_Car_Crashes.Vehicle_Make_Model ;;

  dimension: make_model_key {
     hidden: yes
    type: string
    sql:  CONCAT(${TABLE}.Accident_Index, ${TABLE}.Vehicle_Reference) ;;
  }

  dimension: accident_index {
    hidden: yes
    type: string
    sql: ${TABLE}.Accident_Index ;;
  }

  dimension: vehicle_brand {
    type: string
    sql: ${TABLE}.Vehicle_Brand ;;
  }

  dimension: vehicle_model {
    type: string
    sql: ${TABLE}.Vehicle_Model ;;
  }

  dimension: vehicle_reference {
    hidden: yes
    type: string
    sql: ${TABLE}.Vehicle_Reference ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
