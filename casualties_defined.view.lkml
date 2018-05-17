# If necessary, uncomment the line below to include explore_source.

# include: "uk_accidents.model.lkml"

view: casualties_defined {
  label: "Casualties"
    derived_table: {
      persist_for: "1000 hours"
      explore_source: casualties {
        column: accident_index {}
        column: age_band { field: age_band.age_band }
        column: age_of_casualty {}
        column: bus_or_coach_passenger {}
        column: car_passenger {}
        column: casualty_class { field: casualty_class.casualty_class }
        column: casualty_home_area_type {}
        column: casualty_reference {}
        column: casualty_severity {}
        column: Casualty_type { field: casualty_type.Casualty_type }
        column: pedestrian_location { field: ped_location.pedestrian_location }
        column: Pedestrian_Movement { field: ped_movement.Pedestrian_Movement }
        column: pedestrian_road_maintenance_worker {}
        column: sex_of_driver_label { field: sex_of_driver.sex_of_driver_label }
        column: vehicle_reference {}
        column: count {}
      }
    }
    dimension: casualty_pk {
      hidden: yes
      primary_key: yes
      type: string
      sql: CONCAT(${casualties_defined.accident_index},${casualties_defined.vehicle_reference}) ;;
    }
    dimension: accident_index {}
    dimension: age_band {
      label: "Casualty Age Band"
    }
    dimension: age_of_casualty {
      type: number
    }
    dimension: casualty_age_tier {
      type: tier
      tiers: [10,20,30,40,50,60,70,80]
      style: interval
      sql: ${age_of_casualty} ;;
    }
    dimension: bus_or_coach_passenger {}
    dimension: car_passenger {}
    dimension: casualty_class {
      label: "Casualty Class"
    }
    dimension: casualty_home_area_type {}
    dimension: casualty_reference {}
    dimension: casualty_severity {}
    dimension: Casualty_type {
      label: "Casualty Type"
    }
    dimension: pedestrian_location {
      label: "Pedestrian Location"
    }
    dimension: Pedestrian_Movement {
      label: "Pedestrian Movement"
    }
    dimension: pedestrian_road_maintenance_worker {}
    dimension: sex_of_driver_label {
      label: "Sex of casualty"
    }
    dimension: vehicle_reference {}
    dimension: count {
      hidden: yes
      type: number
    }
    measure: casualty_count {
      drill_fields: [age_of_casualty, sex_of_driver_label, casualty_severity, Casualty_type, casualty_class]
      type: count
    }
  measure: pedestrian_casualty_count {
    drill_fields: [age_of_casualty, sex_of_driver_label, casualty_severity, pedestrian_location, Pedestrian_Movement]
    type: count
  }

  }
