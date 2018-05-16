view: local_authority_data {
  sql_table_name: UK_Car_Crashes.Local_Authority_Data ;;

  dimension: all {
    type: number
    sql: ${TABLE}.`All` ;;
  }

  dimension: area_ {
    type: number
    sql: ${TABLE}.Area_ ;;
  }

  dimension: area_code {
    type: string
    sql: ${TABLE}.AreaCode ;;
  }

  dimension: communal {
    type: number
    sql: ${TABLE}.Communal ;;
  }

  dimension: density {
    type: number
    sql: ${TABLE}.Density ;;
  }
  dimension: population_density_tier {
    type: tier
    tiers: [25,50,75,100]
    style: interval
    sql: ${TABLE}.Density ;;
  }

  dimension: district {
    primary_key: yes
    type: string
    sql: ${TABLE}.District ;;
  }

  dimension: females {
    type: number
    sql: ${TABLE}.Females ;;
  }

  dimension: household {
    type: number
    sql: ${TABLE}.household ;;
  }

  dimension: males {
    type: number
    sql: ${TABLE}.Males ;;
  }

  dimension: school_boarder {
    type: number
    sql: ${TABLE}.SchoolBoarder ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
