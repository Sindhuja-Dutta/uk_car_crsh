view: vehicle_pdt {

  derived_table: {
    explore_source: vehicles {
      column: accident_index {}
      column: age_band_of_driver {}
      column: age_of_driver {}
      column: age_of_vehicle {}
      column: driver_home_area_type {}
      column: driver_imd_decile {}
      column: engine_capacity {}
      column: hit_object_in_carriageway {}
      column: junction_location_label { field: junction_location.junction_location_label }
      column: hit_object_off_carriageway {}
      column: propulsion_code {}
      column: journey_purpose_label { field: journey_purpose.journey_purpose_label }
      column: driver_sex_label { field: sex_of_driver.driver_sex_label }
      column: skidding_and_overturning {}
      column: towing_and_articulation {}
      column: vehicle_leaving_carriageway {}
      column: label { field: vehicle_location.label }
      column: vehicle_manoeuvre_label { field: vehicle_manoeuvre.vehicle_manoeuvre_label }
      column: vehicle_reference {}
      column: vehicle_type { field: vehicle_type.vehicle_type }
      column: was_vehicle_left_hand_drive {}
      column: average_age_of_driver {}
      column: average_age_of_vehicle {}
      column: average_engine_capacity {}
      column: count {}
    }
  }
  dimension: accident_index {}
  dimension: age_band_of_driver {}
  dimension: age_of_driver {
    type: number
  }
  dimension: age_of_vehicle {
    type: number
  }
  dimension: driver_home_area_type {}
  dimension: driver_imd_decile {}
  dimension: engine_capacity {
    type: number
  }
  dimension: hit_object_in_carriageway {}
  dimension: junction_location_label {
    label: "Vehicles Junction Location"
  }
  dimension: hit_object_off_carriageway {}
  dimension: propulsion_code {
    label: "Vehicles Propulsion Type"
  }
  dimension: journey_purpose_label {
    label: "Vehicles Purpose of Journey"
  }
  dimension: driver_sex_label {
    label: "Vehicles Sex of Driver"
  }
  dimension: skidding_and_overturning {}
  dimension: towing_and_articulation {}
  dimension: vehicle_leaving_carriageway {}
  dimension: label {
    label: "Vehicles Vehicle Location"
  }
  dimension: vehicle_manoeuvre_label {
    label: "Vehicles Vehicle Manoeuvre"
  }
  dimension: vehicle_reference {}
  dimension: vehicle_type {
    label: "Vehicles Vehicle Type"
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
}
