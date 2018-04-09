connection: "taxi_test"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: accidents {
  join: casualties {
    sql_on: ${accidents.accident_index} = ${casualties.accident_index} ;;
    relationship: one_to_one
  }
  join: vehicles {
      sql_on: ${vehicles.accident_index}  = ${accidents.accident_index} ;;
      relationship: one_to_one
  }

}



explore: vehicles {
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


}
