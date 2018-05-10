view: Vehicles_defined {
    derived_table: {
      persist_for: "12000 hours"
      explore_source: vehicles {
        column: accident_index {}
        column: age_band_of_driver {}
        column: age_of_driver {}
        column: age_of_vehicle {}
        column: driver_home_area_type {}
        column: driver_imd_decile {}
        column: engine_capacity {}
#         column: label { field: point_of_impact.label }
        column: hit_object_in_carriageway {}
        column: hit_object_off_carriageway {}
#        column: label { field: junction_location.label }
        column: junction_location{}
        column: propulsion_code {}
#         column: label { field: journey_purpose.label }
        column: driver_journey_purpose {}
#         column: label { field: sex_of_driver.label }
        column: skidding_and_overturning {}
        column: towing_and_articulation {}
        column: vehicle_leaving_carriageway {}
#         column: label { field: vehicle_location.label }
#         column: label { field: vehicle_manoeuvre.label }
        column: vehicle_reference {}
        column: vehicle_type { field: vehicle_type.vehicle_type }
        column: was_vehicle_left_hand_drive {}
        column: average_age_of_driver {}
        column: average_age_of_vehicle {}
        column: average_engine_capacity {}
        column: count {}
      }
    }
    dimension: vehicle_primary_key {
      sql: concat(${accident_index},${vehicle_reference} );;
      primary_key: yes
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
    dimension: label {
      label: "Vehicles First Point of Impact"
    }
    dimension: hit_object_in_carriageway {}
    dimension: hit_object_off_carriageway {}
   # dimension: label {
   #   label: "Vehicles Junction Location"
  #}
    dimension: propulsion_code {
      label: "Vehicles Propulsion Type"
    }
#     dimension: label {
#       label: "Vehicles Purpose of Journey"
#     }
#     dimension: label {
#       label: "Vehicles Sex of Driver"
#     }
    dimension: skidding_and_overturning {}
    dimension: towing_and_articulation {}
    dimension: vehicle_leaving_carriageway {}
#     dimension: label {
#       label: "Vehicles Vehicle Location"
#     }
#     dimension: label {
#       label: "Vehicles Vehicle Manoeuvre"
#     }
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
