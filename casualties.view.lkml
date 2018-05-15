view: casualties {
  sql_table_name: UK_Car_Crashes.Casualties ;;

  dimension: casualty_primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${TABLE}.Accident_Index, ${TABLE}.casualty_reference) ;;
  }

  dimension: accident_index {
    # hidden: yes
    type: string
    sql: ${TABLE}.Accident_Index ;;
  }

  dimension: age_band_of_casualty {
    hidden: yes
    type: string
    sql: ${TABLE}.Age_Band_of_Casualty ;;
  }

  dimension: age_of_casualty {
    type: number
    sql: NULLIF(CAST(${TABLE}.Age_of_Casualty as int64), -1) ;;
  }

  dimension: bus_or_coach_passenger {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.bus_or_coach_passenger as int64) = 0 ;;
        label: "Not a bus passenger"
      }
      when: {
        sql: cast(${TABLE}.bus_or_coach_passenger as int64) = 1 ;;
        label: "Boarding"
      }
      when: {
        sql: cast(${TABLE}.bus_or_coach_passenger as int64) = 2 ;;
        label: "Alighting"
      }
      when: {
        sql: cast(${TABLE}.bus_or_coach_passenger as int64) = 3 ;;
        label: "Standing Passenger"
      }
      when: {
        sql: cast(${TABLE}.bus_or_coach_passenger as int64) = 4 ;;
        label: "Seated Passenger"
      }
      when: {
        sql: cast(${TABLE}.bus_or_coach_passenger as int64) = -1 ;;
        label: "Unknown"
      }
    }
  }

  dimension: car_passenger {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.car_passenger as int64) = 0 ;;
        label: "Not car passenger"
      }
      when: {
        sql: cast(${TABLE}.car_passenger as int64) = 1 ;;
        label: "Front seat passenger"
      }
      when: {
        sql: cast(${TABLE}.car_passenger as int64) = 2 ;;
        label: "Rear seat passenger"
      }
      when: {
        sql: cast(${TABLE}.car_passenger as int64) = -1 ;;
        label: "Unknown"
      }
    }
  }

  dimension: casualty_class {
    hidden: yes
    type: string
    sql: ${TABLE}.Casualty_Class ;;
  }

  dimension: casualty_home_area_type {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.casualty_home_area_type as int64) = 1 ;;
        label: "Urban area"
      }
      when: {
        sql: cast(${TABLE}.casualty_home_area_type as int64) = 2 ;;
        label: "Small town"
      }
      when: {
        sql: cast(${TABLE}.casualty_home_area_type as int64) = 3 ;;
        label: "Rural area"
      }
      # Possibly more when statements
      else: "Unknown"
    }
    }

  dimension: casualty_reference {
    type: string
    sql: ${TABLE}.Casualty_Reference ;;
  }

  dimension: casualty_severity {
#     hidden: yes
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.casualty_severity as int64) = 1 ;;
        label: "Fatal"
      }
      when: {
        sql: cast(${TABLE}.casualty_severity as int64) = 2 ;;
        label: "Serious"
      }
      when: {
        sql: cast(${TABLE}.casualty_severity as int64) = 3 ;;
        label: "Slight"
      }
    }
  }

  dimension: casualty_type {
    hidden: yes
    type: string
    sql: ${TABLE}.Casualty_Type ;;
  }

  dimension: pedestrian_location {
    hidden: yes
    type: string
    sql: ${TABLE}.Pedestrian_Location ;;
  }

  dimension: pedestrian_movement {
    hidden: yes
    type: string
    sql: ${TABLE}.Pedestrian_Movement ;;
  }

  dimension: pedestrian_road_maintenance_worker {
    type: string
    case: {
      when: {
        sql:CAST(${TABLE}.Pedestrian_Road_Maintenance_Worker as int64) = 0;;
        label: "No/Not Applicable"
        }
      when: {
        sql:CAST(${TABLE}.Pedestrian_Road_Maintenance_Worker as int64) = 1;;
        label: "Yes"
        }
      else: "Unknown/Not Applicable"
    }
  }

  dimension: sex_of_casualty {
    hidden: yes
    type: string
    sql: ${TABLE}.Sex_of_Casualty ;;
  }

  dimension: vehicle_reference {
    type: string
    sql: ${TABLE}.Vehicle_Reference ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
