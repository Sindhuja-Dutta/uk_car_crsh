connection: "gavin_dcl_thesis"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: accidents {
  join: casualties {
    sql_on: ${accidents.accident_index} = ${casualties.accident_index} ;;
    relationship: one_to_one
  }
  join: accident_severity {
    sql_on: ${accidents.accident_severity} = ${accident_severity.code} ;;
    relationship: many_to_one
  }
 # join:  {}

#   join: vehicles {
#     from: vehicles
#       sql_on: ${vehicles.accident_index}  = ${accidents.accident_index} ;;
#       relationship: one_to_one
#   }
  join: vehicle_pdt {
    sql_on: ${vehicle_pdt.accident_index} = ${accidents.accident_index} ;;
    relationship: many_to_one
  }
}

# explore: vehicle {
#   from: vehicles
# }

explore: vehicles {
  #extension: required
  join: vehicle_type

  {
    view_label: "Vehicles"
    sql_on: cast(${vehicles.vehicle_type} as int64) = ${vehicle_type.code} ;;
    relationship: many_to_one
  }
  join:  vehicle_manoeuvre{
  view_label: "Vehicles"
  sql_on: cast(${vehicles.vehicle_manoeuvre} as int64) = ${vehicle_manoeuvre.code}  ;;
  relationship: many_to_one
  }

  join:  vehicle_location{
  view_label: "Vehicles"
  sql_on: cast(${vehicles.vehicle_location_restricted_lane} as int64) = ${vehicle_location.code}  ;;
  relationship: many_to_one
  }

  join:  junction_location{
  view_label: "Vehicles"
  sql_on: cast(${vehicles.junction_location} as int64) = ${junction_location.code}  ;;
  relationship: many_to_one
  }
  join:  point_of_impact{
  view_label: "Vehicles"
  sql_on: cast(${vehicles.first_point_of_impact} as int64) = ${point_of_impact.code} ;;
  relationship: many_to_one
  }
  join: journey_purpose {
  view_label: "Vehicles"
  sql_on: cast(${vehicles.journey_purpose_of_driver} as int64) = ${journey_purpose.code}  ;;
  relationship: many_to_one
  }
  join: sex_of_driver {
  view_label: "Vehicles"
  sql_on: cast(${vehicles.sex_of_driver} as int64) = ${sex_of_driver.code} ;;
  relationship: many_to_one
  }
  join: age_band {
    view_label: "Vehicles"
    sql_on: cast(${vehicles.age_band_of_driver} as int64) = ${age_band.code} ;;
    relationship: many_to_one
  }
}

explore: casualties {

  join: casualty_class {
  view_label: "Casualties"
  sql_on: cast(${casualties.casualty_class} as int64) = ${casualty_class.code} ;;
  relationship: many_to_one
  }
  join: casualty_type {
  view_label: "Casualties"
  sql_on: cast(${casualties.casualty_type} as int64) = ${casualty_type.code} ;;
  relationship: many_to_one
  }
  join: casualty_severity {
  view_label: "Casualties"
  sql_on: cast(${casualties.casualty_severity} as int64) = ${casualty_severity.code} ;;
  relationship: many_to_one
  }
  join: ped_location {
  view_label: "Casualties"
  sql_on: cast(${casualties.pedestrian_location} as int64) = ${ped_location.code} ;;
  relationship: many_to_one
  }
  join: ped_movement {
  view_label: "Casualties"
  sql_on: cast(${casualties.pedestrian_movement} as int64) = ${ped_movement.code} ;;
  relationship: many_to_one
  }
  join: sex_of_driver {
  view_label: "Casualties"
  sql_on: cast(${casualties.sex_of_casualty} as int64) = ${sex_of_driver.code} ;;
  relationship: many_to_one
  }
  join: age_band {
  view_label: "Casualties"
  sql_on: cast(${casualties.age_band_of_casualty} as int64) = ${age_band.code} ;;
  relationship: many_to_one
  }

}
