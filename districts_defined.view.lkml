# If necessary, uncomment the line below to include explore_source.
 include: "uk_accidents.model.lkml"

view: districts_defined {
 # If necessary, uncomment the line below to include explore_source.
    derived_table: {
      persist_for: "100000 hours"
      explore_source: local_authority_data {
        column: density {}
        column: area_code {}
        column: population_density_tier {}
        column: count {}
        column: area_ {}
        column: district {}
        column: all {}
      }
    }
    dimension: density {
      type: number
    }
    dimension: area_code {}
    dimension: population_density_tier {
      type: tier
      tiers: [25,50,75,100]
      style: interval
      sql: ${density} ;;

    }
    dimension: count {
      type: number
    }
    dimension: area_ {
      type: number
    }
    dimension: district {}
    dimension: all {
      type: number
    }
  }
