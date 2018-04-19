view: accidents {
  sql_table_name: UK_Car_Crashes.Accidents ;;

  dimension: _1st_road_class {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Road_Class` WHERE code = _1st_Road_Class) ;;
  }

#   dimension: _1st_road_number {
#     type: number
#     sql: ${TABLE}._1st_Road_Number ;;
#   }

  dimension: _2nd_road_class {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Road_Class` WHERE code = _2nd_Road_Class) ;;
  }

#   dimension: _2nd_road_number {
#     type: number
#     sql: ${TABLE}._2nd_Road_Number ;;
#   }

  dimension: accident_index {
    type: string
    primary_key: yes
    sql: ${TABLE}.Accident_Index ;;
  }

  dimension: accident_severity {
    type: number
    sql: ${TABLE}.Accident_Severity ;;
  }

  dimension: carriageway_hazards {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = 0 ;;
        label: "None"
      }
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = 1 ;;
        label: "Vehicle on road"
      }
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = 2 ;;
        label: "Other object on road"
      }
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = 3 ;;
        label: "Previous accident"
      }
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = 4 ;;
        label: "Dog on road"
      }
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = 5 ;;
        label: "Other animal on the road"
      }
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = 6 ;;
        label: "Pedestrian on the road"
      }
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = 7 ;;
        label: "Any animal on the road (except ridden horse)"
      }
      when: {
        sql: cast(${TABLE}.carriageway_hazards as int64) = -1 ;;
        label: "Unknown"
      }
    }
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      day_of_month,
      day_of_week,
      week_of_year,
      minute,
      hour,
      time_of_day,
      month_name,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

#   dimension: day_of_week {
#     type: number
#     sql: ${TABLE}.Day_of_Week ;;
#   }

  dimension: did_police_officer_attend_scene_of_accident {
    type: number
    sql: ${TABLE}.Did_Police_Officer_Attend_Scene_of_Accident ;;
  }

  dimension: junction_control {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Junction_Control` WHERE code = ${TABLE}.Junction_Control) ;;
#    sql: ${TABLE}.Junction_Control ;;
  }

  dimension: junction_detail {
    type: number
    sql: ${TABLE}.Junction_Detail ;;
  }

  dimension: latitude {
    type: number
    hidden: yes
    sql: ${TABLE}.Latitude ;;
  }

  dimension: longitude {
    type: number
    hidden: yes
    sql: ${TABLE}.Longitude ;;
  }

  dimension: location {
    drill_fields: [location, weather_conditions, light_conditions, road_surface_conditions]
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: light_conditions {
    type: string
#    sql: ${TABLE}.Light_Conditions ;;
    sql:(SELECT label FROM `UK_Car_Crashes.Light_Conditions` WHERE code = ${TABLE}.Light_Conditions) ;;
  }

  dimension: local_authority__district_ {
    type: string
#     sql: ${TABLE}.Local_Authority__District_ ;;
    sql: (SELECT label FROM `UK_Car_Crashes.Local_Authority_District` WHERE code = ${TABLE}.Local_Authority__District_) ;;
  }

  dimension: local_authority__highway_ {
    type: string
    sql: (SELECT string_field_1 FROM `UK_Car_Crashes.Local_Authority_Highway` WHERE string_field_0 = ${TABLE}.Local_Authority__Highway_) ;;
  }

#   dimension: location_easting_osgr {
#     type: number
#     sql: ${TABLE}.Location_Easting_OSGR ;;
#   }

#   dimension: location_northing_osgr {
#     type: number
#     sql: ${TABLE}.Location_Northing_OSGR ;;
#   }

#   dimension: lsoa_of_accident_location {
#     type: string
#     sql: ${TABLE}.LSOA_of_Accident_Location ;;
#   }

  dimension: number_of_casualties {
    hidden: yes
    type: number
    sql: ${TABLE}.Number_of_Casualties ;;
  }

  dimension: number_of_vehicles {
    type: number
    sql: ${TABLE}.Number_of_Vehicles ;;
  }

  dimension: pedestrian_crossing_human_control {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Ped_Cross_Human` WHERE code = ${TABLE}.Pedestrian_Crossing_Human_Control) ;;
  }

  dimension: pedestrian_crossing_physical_facilities {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Ped_Cross_Physical` WHERE code = ${TABLE}.Pedestrian_Crossing_Physical_Facilities) ;;
  }

  dimension: police_force {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Police_Force` WHERE code = ${TABLE}.Police_Force) ;;
  }

  dimension: road_surface_conditions {
    type: number
    sql: ${TABLE}.Road_Surface_Conditions ;;
  }

  dimension: road_type {
    type: number
    sql: (SELECT label FROM `UK_Car_Crashes.Road_Type` WHERE code = ${TABLE}.Road_Type) ;;
  }

  dimension: special_conditions_at_site {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = 0 ;;
        label: "None"
      }
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = 1 ;;
        label: "Traffic signal - out"
      }
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = 2 ;;
        label: "Traffic signal part defective"
      }
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = 3 ;;
        label: "Road sign or marking defective or obscured"
      }
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = 4 ;;
        label: "Roadworks"
      }
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = 6 ;;
        label: "Oil or diesel"
      }
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = 7 ;;
        label: "Mud"
      }
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = -1 ;;
        label: "Unknown"
      }
      when: {
        sql: cast(${TABLE}.Special_Conditions_at_Site as int64) = 5 ;;
        label: "Road surface defective"
      }
    }
  }

  dimension: speed_limit {
    type: number
    sql: ${TABLE}.Speed_limit ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.Time ;;
  }

  dimension: urban_or_rural_area {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Urban_Rural` WHERE code = ${TABLE}.Urban_or_Rural_Area) ;;
  }

  dimension: weather_conditions {
    type: string
    sql: CASE WHEN ${TABLE}.Weather_Conditions = 1 THEN "Fine no high winds"
              WHEN ${TABLE}.Weather_Conditions = 2 THEN "Raining no high winds"
              WHEN ${TABLE}.Weather_Conditions = 3 THEN "Snowing no high winds"
              WHEN ${TABLE}.Weather_Conditions = 4 THEN "Fine + high winds"
              WHEN ${TABLE}.Weather_Conditions = 5 THEN "Raining + high winds"
              WHEN ${TABLE}.Weather_Conditions = 6 THEN "Snowing + high winds"
              WHEN ${TABLE}.Weather_Conditions = 7 THEN "Fog or mist"
              WHEN ${TABLE}.Weather_Conditions = 8 THEN "Other"
              WHEN ${TABLE}.Weather_Conditions = 9 THEN "Unknown"
              WHEN ${TABLE}.Weather_Conditions = -1 THEN "  Data missing or out of range"
              ELSE "UNKNOWN" END ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: Sum_of_casualties{
    type: sum
    sql: ${TABLE}.Number_of_Casualties ;;
  }
}
