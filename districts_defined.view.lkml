# If necessary, uncomment the line below to include explore_source.
# include: "uk_accidents.model.lkml"

view: districts_defined {
  derived_table: {
    persist_for: "1000 hours"
    explore_source: local_authority_data {
      column: district {}
      column: area_ {}
      column: all {}
      column: density {}
    }
  }
  dimension: district {
    label: "District name"
  }
  dimension: area_ {
    label: "Area in hectares"
    type: number
  }
  dimension: all {
    label: "District population"
    type: number
  }
  dimension: density {
    label: "Population density"
    type: number
  }
}
