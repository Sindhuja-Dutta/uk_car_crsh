connection: "taxi_test"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: accidents {
  join: casualties {
    sql_on: ${accidents.accident_index} = ${casualties.accident_index} ;;
    relationship: one_to_one
  }
  join: vehicles {
      sql_on: ${vehicles.accident_index} = ${accidents.accident_index} ;;
      relationship: one_to_one
  }

}

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
