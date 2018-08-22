connection: "gavin_dcl_thesis"

include: "complex*"
include: "vehicle*"
# include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: Complex_pdt {


   join: vehicles {
    relationship: many_to_one
     sql_on: ${Complex_pdt.accident_index} = ${vehicles.accident_index}.user_id} ;;
   }

# }
#
# explore: Complex_extends {
#     extends: [Complex_pdt]
#
#
#     join: vehicles {}


    # join: vehicles {
    #   relationship: many_to_one
    #   sql_on: ${Complex_pdt.accident_index} = ${vehicles.accident_index}.user_id} ;;
    # }


 }
