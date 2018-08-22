# If necessary, uncomment the line below to include explore_source.
include: "uk_accidents.model.lkml"


view: Complex_pdt {
  derived_table: {
    explore_source: accidents {
      column: accident_index {}
      column: count { field: districts_defined.count }
      column: total_population { field: districts_defined.total_population }
      column: density { field: districts_defined.density }
      column: accident_severity {}
      column: junction_control {}
      column: speed_limit {}
      column: Sum_of_casualties {}
      column: age_of_casualty { field: casualties_defined.age_of_casualty }
      column: casualty_home_area_type { field: casualties_defined.casualty_home_area_type }
      column: pedestrian_location { field: casualties_defined.pedestrian_location }
      column: sex_of_driver_label { field: casualties_defined.sex_of_driver_label }
      column: bigger_district { field: cdt_backup.bigger_district }
      column: age_of_vehicle { field: vehicles_defined_2.age_of_vehicle }
      column: hit_object_in_carriageway { field: vehicles_defined_2.hit_object_in_carriageway }
      column: Vehicle_Manoeuvre_label { field: vehicles_defined_2.Vehicle_Manoeuvre_label }
      column: count2 { field: vehicle_make_model.count }
    }
  }
  dimension: count {
    label: "Accident District Count"
    type: number
  }

  dimension: accident_index {
    label: "Accident index"
    type: number
  }

  dimension: total_population {
    label: "Accident District District Population"
    type: number
  }
  dimension: density {
    label: "Accident District Density"
    type: number
  }
  dimension: accident_severity {}
  dimension: junction_control {}
  dimension: speed_limit {
    type: number
  }
  dimension: Sum_of_casualties {
    type: number
  }
  dimension: age_of_casualty {
    label: "Casualties Age of Casualty"
    type: number
  }
  dimension: casualty_home_area_type {
    label: "Casualties Casualty Home Area Type"
  }
  dimension: pedestrian_location {
    label: "Casualties Pedestrian Location"
  }
  dimension: sex_of_driver_label {
    label: "Casualties Sex of casualty"
  }
  dimension: bigger_district {
    label: "Cdt Backup Next biggest district"
  }
  dimension: age_of_vehicle {
    label: "Vehicles Age of Vehicle"
    type: number
  }
  dimension: hit_object_in_carriageway {
    label: "Vehicles Hit Object In Carriageway"
  }

  dimension: count2 {
    label: "Vehicles Count"
    type: number
  }
}
