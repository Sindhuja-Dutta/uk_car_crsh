include: "vehicle_make_model.view"
include: "districts_defined.view"
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
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Accident_Severity` WHERE code = ${TABLE}.Accident_Severity)  ;;
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
      minute2,
      minute10,
      hour_of_day,
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
    datatype: datetime
     sql: CAST(CONCAT(CAST(${TABLE}.Date AS STRING), " ", ${TABLE}.Time, ":00") AS TIMESTAMP) ;;
#     sql:CAST(${TABLE}.Date AS TIMESTAMP)   ;;
  }

#   dimension: day_of_week {
#     type: number
#     sql: ${TABLE}.Day_of_Week ;;
#   }

  dimension: did_police_officer_attend_scene_of_accident {
    type: yesno
    sql: ${TABLE}.did_police_officer_attend_scene_of_accident = 1 ;;
  }

  dimension: Was_Self_Reported {
    type: yesno
    sql: ${TABLE}.did_police_officer_attend_scene_of_accident = 3;;
  }


  dimension: junction_control {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Junction_Control` WHERE code = ${TABLE}.Junction_Control) ;;
#    sql: ${TABLE}.Junction_Control ;;
  }

  dimension: junction_detail {
    type: string
    sql: (SELECT label FROM `UK_Car_Crashes.Junction_Control` WHERE code = ${TABLE}.Junction_Detail) ;;
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
#      drill_fields: [accident_severity]

#     link: {
#       label: "Google Search"
#       url: "http://www.google.com/search?&q=road+accident+{{date_year._value}},{{date_day_of_month._value}},{{date_day_of_week._value}},{{date_month_name._value}},{{accident_severity._value}}, {{local_authority__district_._value}}"
#       icon_url: "http://google.com/favicon.ico"
#     }

#     link: {
#       label: "Google Streetview"
#       url: "http://maps.google.com/maps?q=&layer=c&cbll={{latitude._value}},{{longitude._value}}"
#       icon_url: "http://maps.google.com/mapfiles/ms/icons/blue.png"
#     }

    type: location
    sql_latitude: ROUND(${latitude}, 3) ;;
    sql_longitude: ROUND(${longitude}, 3) ;;
  }

  dimension: location_streetview {
#      drill_fields: [accident_severity]

#     link: {
#       label: "Google Search"
#       url: "http://www.google.com/search?&q=road+accident+{{date_year._value}},{{date_day_of_month._value}},{{date_day_of_week._value}},{{date_month_name._value}},{{accident_severity._value}}, {{local_authority__district_._value}}"
#       icon_url: "http://google.com/favicon.ico"
#     }

    link: {
      label: "Google Streetview"
      url: "http://maps.google.com/maps?q=&layer=c&cbll={{latitude._value}},{{longitude._value}}"
      icon_url: "http://maps.google.com/mapfiles/ms/icons/blue.png"
    }

    type: location
    sql_latitude: ROUND(${latitude}, 5) ;;
    sql_longitude: ROUND(${longitude}, 5) ;;
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
    type: string
    sql: CASE WHEN ${TABLE}.Road_Surface_Conditions = 1  THEN "Dry"
               WHEN ${TABLE}.Road_Surface_Conditions = 2 THEN "Wet or damp"
               WHEN ${TABLE}.Road_Surface_Conditions = 3 THEN "Snow"
               WHEN ${TABLE}.Road_Surface_Conditions = 4 THEN "Frost or ice"
               WHEN ${TABLE}.Road_Surface_Conditions = 5 THEN "Flood over 3cm. deep"
               WHEN ${TABLE}.Road_Surface_Conditions = 6 THEN "Oil or diesel"
               WHEN ${TABLE}.Road_Surface_Conditions = 7 THEN "Mud"
               WHEN ${TABLE}.Road_Surface_Conditions = -1 THEN "Data missing or out of range"
              ELSE "Data missing or out of range"
              END;;
  }

  dimension: road_type {
    type: string
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

  dimension: minute_as_number {
    hidden: yes
    type: number
    sql: SUBSTR(${TABLE}.Time, 4) ;;
  }


  dimension: minute_of_hour_excl_5 {
    type: number
    sql: CASE
        WHEN MOD(CAST(SUBSTR(accidents.Time, 4) as INT64), 5) = 0 THEN NULL
        ELSE CAST(SUBSTR(accidents.Time, 4) as INT64)
       END ;;
  }

  dimension: minute_of_hour {
    type: number
    sql:  CAST(SUBSTR(accidents.Time, 4) as INT64) ;;
  }

  dimension: density_bucket {
    type: string
    sql: CASE WHEN ${districts_defined.density} BETWEEN 0 and 5  THEN "1"
          WHEN ${districts_defined.density} BETWEEN 5 and 10  THEN "2"
           WHEN ${districts_defined.density} BETWEEN 10 and 15  THEN "3"
           WHEN ${districts_defined.density} BETWEEN 15 and 20  THEN "4"
           WHEN ${districts_defined.density} BETWEEN 20 and 25  THEN "5"
           WHEN ${districts_defined.density} BETWEEN 25 and 30  THEN "6"
           WHEN ${districts_defined.density} BETWEEN 30 and 40  THEN "7"
           WHEN ${districts_defined.density} BETWEEN 40 and 45  THEN "8"
           WHEN ${districts_defined.density} BETWEEN 45 and 58  THEN "9"
           WHEN ${districts_defined.density} BETWEEN 58 and 72  THEN "10"
           WHEN ${districts_defined.density} BETWEEN 72 and 90  THEN "11"
           WHEN ${districts_defined.density} BETWEEN 72 and 90  THEN "11"
          WHEN ${districts_defined.density} > 90  THEN "12"
              ELSE NULL END ;;
  }

  dimension: for_density_matching {
    type: string
    sql: ${density_bucket} ;;
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
    drill_fields: [location_streetview, date_date,  date_day_of_week, time, accident_severity, number_of_casualties, carriageway_hazards, road_type, special_conditions_at_site, road_surface_conditions, number_of_vehicles, light_conditions, weather_conditions, junction_detail, vehicle_make_model.vehicle_brand, vehicle_make_model.vehicle_model, speed_limit]

    link: {
      label: "Map Visualisation"
      url: "https://dcl.dev.looker.com/explore/uk_accidents/accidents?qid=N4CACbGi5LLNsHAQcdiVvv&toggle=dat,vis"

    }

  }


  measure: Sum_of_casualties{
    type: sum
    sql: ${TABLE}.Number_of_Casualties ;;
  }

}
