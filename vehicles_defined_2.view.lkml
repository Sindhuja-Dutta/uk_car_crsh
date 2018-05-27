# If necessary, uncomment the line below to include explore_source.

# include: "uk_accidents.model.lkml"

view: vehicles_defined_2 {
  label: "Vehicles"
  derived_table: {
    persist_for: "1000 hours"
    explore_source: vehicles {
      column: vehicles_primary_key{}
      column: age_band { field: age_band.age_band }
      column: age_of_driver {}
      column: age_of_vehicle {}
      column: driver_home_area_type {}
      column: driver_imd_decile {}
      column: driver_journey_purpose {}
      column: engine_capacity {}
      column: point_of_impact_label { field: point_of_impact.point_of_impact_label }
      column: hit_object_in_carriageway {}
      column: hit_object_off_carriageway {}
      column: junction_location {}
      column: propulsion_code {}
      column: sex_of_driver_label { field: sex_of_driver.sex_of_driver_label }
      column: skidding_and_overturning {}
      column: towing_and_articulation {}
      column: vehicle_leaving_carriageway {}
      column: vehicle_location_label { field: vehicle_location.vehicle_location_label }
      column: Vehicle_Manoeuvre_label { field: vehicle_manoeuvre.Vehicle_Manoeuvre_label }
      column: vehicle_reference {}
      column: vehicle_type { field: vehicle_type.vehicle_type }
      column: was_vehicle_left_hand_drive {}
      column: average_age_of_driver {}
      column: average_age_of_vehicle {}
      column: average_engine_capacity {}
      column: count {}
      column: accident_index {}
    }
  }
  dimension: vehicles_primary_key {
    primary_key: yes
  }

  dimension: age_band {
    label: "Driver Age Band"
  }
  dimension: age_of_driver {
    type: number
  }
  dimension: age_of_vehicle {
    type: number
  }
  dimension: driver_home_area_type {}
  dimension: driver_imd_decile {
    type: number
  }
  dimension: driver_journey_purpose {}
  dimension: engine_capacity {
    type: number
  }
  dimension: point_of_impact_label {
    label: "Vehicles First Point of Impact"
  }
  dimension: hit_object_in_carriageway {}
  dimension: hit_object_off_carriageway {}
  dimension: junction_location {}
  dimension: propulsion_code {
    label: "Propulsion Type"
  }
  dimension: sex_of_driver_label {
    label: "Sex of driver"
  }
  dimension: skidding_and_overturning {}
  dimension: towing_and_articulation {}
  dimension: vehicle_leaving_carriageway {}
  dimension: vehicle_location_label {
    label: "Vehicle Location"
  }
  dimension: Vehicle_Manoeuvre_label {
    label: "Vehicle Manoeuvre"
  }
  dimension: vehicle_reference {}
  dimension: vehicle_type {
    label: "Vehicle Type"
  }
  dimension: was_vehicle_left_hand_drive {}
  dimension: average_age_of_driver {
    value_format: "#,##0"
    type: number
  }
  dimension: average_age_of_vehicle {
    value_format: "#,##0.0"
    type: number
  }
  dimension: average_engine_capacity {
    value_format: "#,##0"
    type: number
  }
  dimension: count {
    type: number
  }
  dimension: accident_index {
    hidden: yes
  }
}
