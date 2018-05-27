view: vehicle_make_model {
  label: "Vehicles"
  sql_table_name: UK_Car_Crashes.Vehicle_Make_Model ;;

  dimension: make_model_key {
    primary_key: yes
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

  dimension: vehicle_image {
    group_label: "Images"
    sql: ${TABLE}.Vehicle_Model ;;
    html: <img src="http://feeling-lucky-looker.herokuapp.com/api.php?q={{value | url_param_escape }}%20road"  style="max-height: 200px; max-width: 200px; border-radius: 10px; margin-bottom: 10px;" />
      ;;
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
