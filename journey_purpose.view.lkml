view: journey_purpose {
  sql_table_name: UK_Car_Crashes.Journey_Purpose ;;
  view_label: "Vehicles"

  dimension: code {
    hidden: yes
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: journey_purpose_label {
    label: "Purpose of Journey"
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
