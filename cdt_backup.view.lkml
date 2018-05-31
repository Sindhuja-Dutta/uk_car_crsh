include: "uk_accidents.model.lkml"
view: cdt_backup {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    persist_for: "1000 hours"
    sql: SELECT districts_defined.district as area_district,
  LAG(districts_defined.district,1) OVER (ORDER BY districts_defined.area_) AS smaller_district,
  LEAD(districts_defined.district,1) OVER (ORDER BY districts_defined.area_) AS bigger_district
      FROM UK_Car_Crashes.Accidents  AS accidents
      LEFT JOIN `UK_Car_Crashes.Local_Authority_District` AS district ON accidents.Local_Authority__District_ = district.code
      LEFT JOIN ${districts_defined.SQL_TABLE_NAME} AS districts_defined ON districts_defined.district = district.label
      GROUP BY districts_defined.area_, districts_defined.district

      ORDER BY 1
      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: smaller_district {
    label: "Next smallest district"
    # description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.smaller_district ;;
    link: {
      label: "Go to Dashboard for {{value}}"
      url: "/dashboards/117?District%20Council%20Filter={{ value }}"
      icon_url: "http://looker.com/favicon.ico"
    }
  }


  dimension: district_for_size {
    label: "District"
     hidden: yes
    primary_key: yes
    # description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.area_district ;;
  }

  dimension: bigger_district {
    label: "Next biggest district"
    # description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.bigger_district ;;
    link: {
      label: "Go to Dashboard for {{value}}"
      url: "/dashboards/117?District%20Council%20Filter={{ value }}"
      icon_url: "http://looker.com/favicon.ico"
    }


  }

 }
