/*
 *  tool id list see ../info_files/tool_id_list.ods
 *
 *
 */

/*
 *  general disabled not used menu and tools
 *
 */
function general_disabled_tools( pl ) {

  local unused_tools = [  tool_set_marker,
                          tool_add_city,
                          tool_plant_tree,
                          tool_add_citycar,
                          tool_buy_house,
                          tool_change_water_height,
                          tool_set_climate,
                          tool_stop_mover,
                          tool_exec_script,
                          tool_exec_two_click_script,
                          tool_clear_reservation,
                          tool_plant_tree,
                          tool_forest,
                          tool_rotate_building,
                          tool_increase_industry,
                          tool_merge_stop,
                          dialog_enlarge_map
  ]

  local pak64_tools = [ 0x8004, 0x8005, tool_set_climate ]
  local pak64german_tools = [ 0x800b, 0x800c, 0x800d, 0x8013, 0x8014, 0x8015, 0x8023, 0x8025, 0x8027, 0x8007 ]

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

  chapter_disabled_tools( pl )
}

/*
 *  disabled tools for chapter
 *
 *
 *
 *
 */
function chapter_disabled_tools( pl ) {
  /*
  persistent.chapter <- 1     // stores chapter number
  persistent.step    <- 1     // stores step number of chapter
  */
  local chapter_nr = persistent.chapter

  local unused_tools = []

  switch (chapter_nr) {
      case 1:
        local _tools = [  4129,
                          4103,
                          tool_remover,
                          tool_make_stop_public
        ]

        unused_tools.extend(_tools)

        local pak64_tools = [ 0x8002, 0x8003, 0x8006 0x8007, 0x8008, 0x8009 ]
        local pak64german_tools = [ 0x8001, 0x8003, 0x8004, 0x8005 0x800a, 0x800e, 0x800f, 0x8010, 0x8011, 1004 ]

        switch (pak_name) {
          case "pak64":
            unused_tools.extend(pak64_tools)
            break
          case "pak64.german":
            unused_tools.extend(pak64german_tools)
            break
        }
      break
      case 2:
        local _tools = [  4129,
                          4103,
                          tool_remover,
                          tool_make_stop_public
        ]

        unused_tools.extend(_tools)

        local pak64_tools = [ 0x8002, 0x8003, 0x8007, 0x8008, 0x8009 ]
        local pak64german_tools = [ 0x8001, 0x8005 0x800a, 0x800f, 0x8010, 0x8011, 1004 ]

        switch (pak_name) {
          case "pak64":
            unused_tools.extend(pak64_tools)
            break
          case "pak64.german":
            unused_tools.extend(pak64german_tools)
            break
        }
      break
  }

  for ( local x = 0; x < unused_tools.len(); x++ ) {
    rules.forbid_tool( pl, unused_tools[x] )
  }

}

/*
 *
 *
 *
 *
 *
 *
 */
 function update_tools(list, id, wt_list, wt) {
    local res = {ok = false, result = false }
    local wt_res = false
    if(wt < 0){
      foreach (tool_id in list){
        if(tool_id == id){
          res.ok = true
          res.result = true
          return res
          break
        }
        else if(tool_id < 0 && tool_id*(-1) == id){
          res.ok = true
          res.result = false
          return res
          break
        }
      }
      res.result = true
      return res
    }
    foreach (way_t in wt_list){
      if(way_t == wt){
        wt_res = true
      }
    }
    if (!wt_res){
      return res
    }
    foreach (tool_id in list){
      if(tool_id == id){
        res.ok = true
        res.result = true
        break
      }
      else if(tool_id < 0 && tool_id*(-1) == id){
        res.ok = true
        res.result = false
        break
      }
      else if(tool_id == 0){
        res.ok = true
        res.result = true
        return res
        break
      }
    }
    return res
}
