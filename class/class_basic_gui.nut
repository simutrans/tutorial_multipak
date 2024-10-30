/*
 *  tool id list see ../info_files/tool_id_list.ods
 *
 *
 */

/*
 *  general disabled not used menu and tools
 *
 */
function general_disabled_tools(pl) {

  local unused_tools = [ tool_set_marker, tool_add_city, tool_plant_tree, tool_add_citycar, tool_buy_house,
              tool_change_water_height, tool_set_climate, tool_stop_mover, tool_exec_script, tool_exec_two_click_script ]

  local pak64_tools = [ 0x8004, 0x8005 ]
  local pak64german_tools = [ 0x800b, 0x800c, 0x800d, 0x8013, 0x8014, 0x8015, 0x8023, 0x8025, 0x8027 ]

  switch (pak_name) {
    case "pak64":
      unused_tools.extend(pak64_tools)
      break
    case "pak64.german":
      unused_tools.extend(pak64german_tools)
      break
  }

  for ( local x = 0; x < unused_tools.len(); x++ ) {
    rules.forbid_tool( pl, unused_tools[x] )
  }


}
