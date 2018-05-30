include: "uk_accidents.model.lkml"
view: comparison_engine {

    view_label: "Accident District"
    derived_table: {
      persist_for: "1000 hours"
      sql: SELECT districts_defined.density as derived_density,

        districts_defined.district as derived_district,

        LAG(districts_defined.district,1) OVER (ORDER BY districts_defined.density) AS lower_district,
        LAG(districts_defined.district,2) OVER (ORDER BY districts_defined.density) AS lower_district2,
        LAG(districts_defined.district,3) OVER (ORDER BY districts_defined.density) AS lower_district3,

        LEAD(districts_defined.district,1) OVER (ORDER BY districts_defined.density) AS higher_district,
        LEAD(districts_defined.district,2) OVER (ORDER BY districts_defined.density) AS higher_district2,
        LEAD(districts_defined.district,3) OVER (ORDER BY districts_defined.density) AS higher_district3

        FROM UK_Car_Crashes.Accidents  AS accidents
        LEFT JOIN `UK_Car_Crashes.Local_Authority_District` AS district ON accidents.Local_Authority__District_ = district.code LEFT JOIN ${districts_defined.SQL_TABLE_NAME} AS districts_defined ON districts_defined.district = district.label

        GROUP BY districts_defined.density, districts_defined.district

        ORDER BY 1
        ;;
    }
   }
