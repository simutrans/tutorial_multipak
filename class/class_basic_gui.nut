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
  // reset rules
  rules.clear()

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
  local step_nr    = persistent.step

  local unused_tools = []
  local pak64_tools = []
  local pak64german_tools = []

  local unused_pl_tools = []
  local pak64_pl_tools = []
  local pak64german_pl_tools = []
  local _wt = []

  local enabled_tools = []
  local enabled_tools_pak64 = []
  local enabled_tools_pak64german = []

  switch (chapter_nr) {
      case 1:
        // chapter 1
        local _tools = [  tool_remove_wayobj,
                          tool_remover,
                          tool_make_stop_public
        ]

        unused_tools.extend(_tools)

        local _pak64_tools = [ 0x8002, 0x8003, 0x8006 0x8007, 0x8008, 0x8009, tool_build_transformer ]
        local _pak64german_tools = [ 0x8001, 0x8003, 0x8004, 0x8005, 0x800a, 0x800e, 0x800f, 0x8010, 0x8011, 1004 ]

        pak64_tools.extend(_pak64_tools)
        pak64german_tools.extend(_pak64german_tools)

        break
      case 2:
        // chapter 2
        local _tools = [  tool_remove_wayobj,
                          tool_remove_way,
                          tool_remover,
                          tool_make_stop_public,
                          tool_build_station,
                          tool_build_bridge,
                          tool_build_tunnel,
                          tool_build_depot,
                          tool_build_roadsign,
                          tool_build_wayobj
        ]

        unused_tools.extend(_tools)

        local _pak64_tools = [ 0x8002, 0x8003, 0x8007, 0x8008, 0x8009 ]
        local _pak64german_tools = [ 0x8001, 0x8005, 0x800a, 0x800f, 0x8010, 0x8011, 1004, 0x8004, 0x801d, 0x802a ]

        pak64_tools.extend(_pak64_tools)
        pak64german_tools.extend(_pak64german_tools)

        local _pl_tools = [  ]

        unused_tools.extend(_pl_tools)

        local _pak64_pl_tools = [  ]
        local _pak64german_pl_tools = [  ]

        // waytypes for used tools
        _wt.append(wt_road)

        pak64_pl_tools.extend(_pak64_pl_tools)
        pak64german_pl_tools.extend(_pak64german_pl_tools)

        break
      case 3:
        // chapter 3
        local _tools = [  4134,
                          4135,
                          tool_build_way,
                          tool_build_station,
                          tool_build_bridge,
                          tool_build_tunnel,
                          tool_build_depot,
                          tool_setslope,
                          tool_build_roadsign,
                          tool_build_wayobj,
                          tool_remove_wayobj,
                          tool_remove_way,
                          tool_remover
        ]

        unused_tools.extend(_tools)

        local _pak64_tools = [ 0x8002, 0x8006, 0x8007, 0x8008, 0x8009 ]
        local _pak64german_tools = [ 0x8001, 0x8005 0x800e, 0x800f, 0x8010, 0x8011, 1004, 0x8004, 0x8019, 0x8022 ]

        pak64_tools.extend(_pak64_tools)
        pak64german_tools.extend(_pak64german_tools)

        local _pl_tools = [  ]

        unused_tools.extend(_pl_tools)

        local _pak64_pl_tools = [  ]
        local _pak64german_pl_tools = [  ]

        // waytypes for used tools
        _wt.append(wt_rail)

        pak64_pl_tools.extend(_pak64_pl_tools)
        pak64german_pl_tools.extend(_pak64german_pl_tools)

       break
     case 4:
        // chapter 4
        local _tools = [  tool_remove_wayobj,
                          tool_remove_way,
                          tool_remover,
                          tool_make_stop_public,
                          tool_build_way,
                          tool_build_station,
                          tool_build_bridge,
                          tool_build_depot
        ]

        unused_tools.extend(_tools)

        local _pak64_tools = [ 0x8002, 0x8003, 0x8006, 0x8008, 0x8009 ]
        local _pak64german_tools = [ 0x8001, 0x800a, 0x800e, 0x8010, 0x8011, 1004, 0x8004, 0x801e, 0x802c ]

        pak64_tools.extend(_pak64_tools)
        pak64german_tools.extend(_pak64german_tools)

        local _pl_tools = [  ]

        unused_tools.extend(_pl_tools)

        local _pak64_pl_tools = [  ]
        local _pak64german_pl_tools = [  ]

        // waytypes for used tools
        _wt.append(wt_road)

        pak64_pl_tools.extend(_pak64_pl_tools)
        pak64german_pl_tools.extend(_pak64german_pl_tools)

        break
      case 5:
        // chapter 5
        local _tools = [  4102,
                          4127,
                          4131,
                          tool_remove_wayobj,
                          tool_remove_way,
                          tool_remover,
                          tool_make_stop_public,
                          tool_build_station,
                          tool_build_bridge,
                          tool_build_tunnel,
                          tool_build_depot,
                          tool_build_roadsign,
                          tool_build_wayobj
        ]

        unused_tools.extend(_tools)

        local _pak64_tools = [ 0x8002, 0x8003, 0x8007, 0x8008 ]
        local _pak64german_tools = [ 0x8001, 0x800a, 0x800f, 0x8010, 0x8011, 1004, 0x8004, 0x801d, 0x802a, 0x800e ]

        pak64_tools.extend(_pak64_tools)
        pak64german_tools.extend(_pak64german_tools)

        local _pl_tools = [  ]

        unused_pl_tools.extend(_pl_tools)

        local _pak64_pl_tools = [  ]
        local _pak64german_pl_tools = [  ]

        // waytypes for unused tools
        _wt.append(wt_road)

        pak64_pl_tools.extend(_pak64_pl_tools)
        pak64german_pl_tools.extend(_pak64german_pl_tools)

        break
     case 6:
        // chapter 6
        local _tools = [  tool_remove_wayobj,
                          tool_remover,
                          tool_build_roadsign
        ]

        unused_tools.extend(_tools)

        local _pak64_tools = [ 0x8002, 0x8003, 0x8006, 0x8007, tool_build_transformer ]
        local _pak64german_tools = [ 0x8001, 0x8003, 0x8004, 0x800a, 0x800e, 0x800f, 0x8011, 1004 ]

        pak64_tools.extend(_pak64_tools)
        pak64german_tools.extend(_pak64german_tools)

        local _pl_tools = [  ]

        unused_pl_tools.extend(_pl_tools)

        local _pak64_pl_tools = [ tool_build_bridge ]
        local _pak64german_pl_tools = [  ]

        // waytypes for unused tools
        _wt.append(wt_power)

        pak64_pl_tools.extend(_pak64_pl_tools)
        pak64german_pl_tools.extend(_pak64german_pl_tools)

        break
     case 7:
        // chapter 7
        local _tools = [  tool_remove_wayobj,
                          tool_remover,
                          tool_build_roadsign
        ]

        unused_tools.extend(_tools)

        local _pak64_tools = [ 0x8002, 0x8003, 0x8008 0x8007 ]
        local _pak64german_tools = [ 0x8001, 0x8003, 0x8004, 0x800a, 0x8010, 0x800f, 0x8011, 1004 ]

        pak64_tools.extend(_pak64_tools)
        pak64german_tools.extend(_pak64german_tools)

        local _pl_tools = [  ]

        unused_pl_tools.extend(_pl_tools)

        local _pak64_pl_tools = [  ]
        local _pak64german_pl_tools = [  ]

        // waytypes for unused tools
        //_wt.append()

        pak64_pl_tools.extend(_pak64_pl_tools)
        pak64german_pl_tools.extend(_pak64german_pl_tools)

        break
  }


  switch (pak_name) {
    case "pak64":
      unused_tools.extend(pak64_tools)
      if ( pak64_pl_tools.len() > 0 ) {
        unused_pl_tools.extend(pak64_pl_tools)
      }
      if ( enabled_tools_pak64.len() > 0 ) {
        enabled_tools.extend(enabled_tools_pak64)
      }
      break
    case "pak64.german":
      unused_tools.extend(pak64german_tools)
      if ( pak64german_pl_tools.len() > 0 ) {
        unused_pl_tools.extend(pak64german_pl_tools)
      }
      if ( enabled_tools_pak64german.len() > 0 ) {
        enabled_tools.extend(enabled_tools_pak64german)
      }
      break
  }


  for ( local x = 0; x < unused_tools.len(); x++ ) {
    rules.forbid_tool( pl, unused_tools[x] )
  }

  if ( unused_pl_tools.len() > 0 ) {
    for ( local x = 0; x < unused_pl_tools.len(); x++ ) {
      for ( local y = 0; y < unused_pl_tools.len(); y++ ) {
          rules.forbid_way_tool(pl, unused_pl_tools[x], _wt[y])
      }
    }

  }

  //gui.add_message("chapter: "+chapter_nr+" step: "+step_nr)
  //gui.add_message("enabled_tools.len(): "+enabled_tools.len())

  // tools enabled
  if ( enabled_tools.len() > 0 ) {
    enabled_tools.append(tool_remover)
    for ( local x = 0; x < enabled_tools.len(); x++ ) {
      rules.allow_tool( pl, enabled_tools[x] )
      //gui.add_message("enabled_tools["+x+"]: "+enabled_tools[x])
    }
  }

  chapter_step_enabled_tools( pl )

}

/*
 *  enabled tools for chapter step
 *
 *  allowed tools for steps must be allowed in all subsequent steps of the chapter
 *  allowed tools not persistent save in rules
 *
 */
function chapter_step_enabled_tools( pl ) {
  /*
  persistent.chapter <- 1     // stores chapter number
  persistent.step    <- 1     // stores step number of chapter
  */
  local chapter_nr = persistent.chapter
  local step_nr    = persistent.step

  local unused_tools = []
  local pak64_tools = []
  local pak64german_tools = []

  local unused_pl_tools = []
  local pak64_pl_tools = []
  local pak64german_pl_tools = []
  local _wt = []

  local enabled_tools = []
  local enabled_tools_pak64 = []
  local enabled_tools_pak64german = []

  local enabled_pl_tools = []
  local enabled_pl_tools_pak64 = []
  local enabled_pl_tools_pak64german = []

  switch (chapter_nr) {
    case 1:
      // chapter 1
      // no tools used

      break
    case 2:
      // chapter 2
      switch (step_nr) {
        case 1:
          // chaoter 2 step A
          // no tools used
          /*
          local _tools = [
          ]

          local _pl_tools = [
          ]

          local _enabled_tools = [
          ]

          local _enabled_pl_tools = [
          ]

          unused_tools.extend(_tools)
          unused_pl_tools.extend(_pl_tools)
          enabled_tools.extend(_enabled_tools)
          enabled_pl_tools.extend(_enabled_pl_tools)

          _wt.append(wt_road)*/
          break
        case 2:
          // chaoter 2 step B
          local _enabled_tools = [  tool_build_depot,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 3:
          // chaoter 2 step C
          local _enabled_tools = [  tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 4:
          // chaoter 2 step D
          local _enabled_tools = [  tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 5:
          // chaoter 2 step E
          local _enabled_tools = [  tool_build_bridge,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 6:
          // chaoter 2 step F
          local _enabled_tools = [  tool_build_bridge,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 7:
          // chaoter 2 step G
          local _enabled_tools = [  tool_build_bridge,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 8:
          // chaoter 2 step H
          local _enabled_tools = [  tool_make_stop_public,
                                    tool_build_bridge,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8009 ]
          local _pak64german_tools = [ 0x8005 ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
      }
      break
    case 3:
      // chapter 3
      switch (step_nr) {
        case 1:
          // chaoter 3 step A
          // no tools used
          /*
          local _tools = [
          ]

          local _pl_tools = [
          ]

          local _enabled_tools = [
          ]

          local _enabled_pl_tools = [
          ]

          unused_tools.extend(_tools)
          unused_pl_tools.extend(_pl_tools)
          enabled_tools.extend(_enabled_tools)
          enabled_pl_tools.extend(_enabled_pl_tools)

          _wt.append(wt_road)*/
          break
        case 2:
          // chaoter 3 step B
          local _enabled_tools = [  tool_build_way
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)

          //_wt.append(wt_road)
          break
        case 3:
          // chaoter 3 step C
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 4:
          // chaoter 3 step D
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station,
                                    tool_build_depot
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 5:
          // chaoter 3 step E
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station,
                                    tool_build_depot
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 6:
          // chaoter 3 step F
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_tunnel
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 7:
          // chaoter 3 step G
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_tunnel
          ]

          enabled_tools.extend(_enabled_tools)
          break
        case 8:
          // chaoter 3 step H
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_tunnel,
                                    tool_setslope
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8001 ]
          local _pak64german_tools = [ 0x8002 ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 9:
          // chaoter 3 step I
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_tunnel,
                                    tool_setslope,
                                    tool_build_roadsign
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8001 ]
          local _pak64german_tools = [ 0x8002 ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 10:
          // chaoter 3 step J
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_tunnel,
                                    tool_setslope,
                                    tool_build_roadsign,
                                    tool_build_wayobj
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8001 ]
          local _pak64german_tools = [ 0x8002 ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 11:
          // chaoter 3 step K
          local _enabled_tools = [  tool_build_way,
                                    tool_build_bridge,
                                    tool_remove_way,
                                    tool_remover,
                                    tool_build_station,
                                    tool_build_depot,
                                    tool_build_tunnel,
                                    tool_setslope,
                                    tool_build_roadsign,
                                    tool_build_wayobj
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8001 ]
          local _pak64german_tools = [ 0x8002 ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
      }
      break
    case 4:
      // chapter 4
      switch (step_nr) {
        case 1:
          // chaoter 4 step A
          // no tools used
          /*
          local _tools = [
          ]

          local _pl_tools = [
          ]

          local _enabled_tools = [
          ]

          local _enabled_pl_tools = [
          ]

          unused_tools.extend(_tools)
          unused_pl_tools.extend(_pl_tools)
          enabled_tools.extend(_enabled_tools)
          enabled_pl_tools.extend(_enabled_pl_tools)

          _wt.append(wt_road)*/
          break
        case 2:
          // chaoter 4 step B
          local _enabled_tools = [  tool_build_station,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [  ]
          local _pak64german_tools = [ 0x8002, 0x801e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 3:
          // chaoter 4 step C
          local _enabled_tools = [  tool_build_station,
                                    tool_remover,
                                    tool_build_depot
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [  ]
          local _pak64german_tools = [ 0x8002, 0x801e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 4:
          // chaoter 4 step D
          local _enabled_tools = [  tool_build_station,
                                    tool_remover,
                                    tool_build_depot
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [  ]
          local _pak64german_tools = [ 0x8002, 0x801e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 5:
          // chaoter 4 step E
          local _enabled_tools = [  tool_build_station,
                                    tool_remover,
                                    tool_build_depot,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [  ]
          local _pak64german_tools = [ 0x8002, 0x801e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 6:
          // chaoter 4 step F
          local _enabled_tools = [  tool_build_station,
                                    tool_remover,
                                    tool_build_depot,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [  ]
          local _pak64german_tools = [ 0x8002, 0x801e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 7:
          // chaoter 4 step G
          local _enabled_tools = [  tool_build_station,
                                    tool_remover,
                                    tool_build_depot,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [  ]
          local _pak64german_tools = [ 0x8002, 0x801e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        }
      break
    case 5:
      // chapter 5
      switch (step_nr) {
        case 1:
          // chaoter 5 step A
          // no tools used
          /*
          local _tools = [
          ]

          local _pl_tools = [
          ]

          local _enabled_tools = [
          ]

          local _enabled_pl_tools = [
          ]

          unused_tools.extend(_tools)
          unused_pl_tools.extend(_pl_tools)
          enabled_tools.extend(_enabled_tools)
          enabled_pl_tools.extend(_enabled_pl_tools)

          _wt.append(wt_road)*/
          break
        case 2:
          // chaoter 5 step B
          local _enabled_tools = [  tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remove_way,
                                    tool_remover
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8006 ]
          local _pak64german_tools = [ 0x8002, 0x800e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)
          //_wt.append(wt_road)

          break
        case 3:
          // chaoter 5 step C
          local _enabled_tools = [  tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remove_way,
                                    tool_remover
                                    tool_build_transformer,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8009 ]
          local _pak64german_tools = [ 0x8011 ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 4:
          // chaoter 5 step D
          local _enabled_tools = [  tool_build_station,
                                    tool_build_depot,
                                    tool_build_way,
                                    tool_remove_way,
                                    tool_remover
                                    tool_build_transformer,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8009 ]
          local _pak64german_tools = [ 0x8004 ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
      break
    case 6:
          // chaoter 6 step A
          // no tools used
          /*
          local _tools = [
          ]

          local _pl_tools = [
          ]


          local _enabled_tools = [
          ]

          local _enabled_pl_tools = [
          ]

          unused_tools.extend(_tools)
          enabled_tools.extend(_enabled_tools)
          enabled_pl_tools.extend(_enabled_pl_tools)

          unused_pl_tools.extend(_pl_tools)

          _wt.append(wt_power)*/
          local _enabled_tools = [  tool_build_station,
                                    tool_build_depot,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8008 ]
          local _pak64german_tools = [ 0x8010, 0x8002, 0x800e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)
          break
        case 2:
          // chaoter 6 step B
          local _enabled_tools = [  tool_build_station,
                                    tool_build_depot,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8008 ]
          local _pak64german_tools = [ 0x8010, 0x8002, 0x800e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)
          //_wt.append(wt_road)

          break
        case 3:
          // chaoter 6 step C
          local _enabled_tools = [  tool_build_transformer,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8008 ]
          local _pak64german_tools = [ 0x8010, 0x8002, 0x800e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
        case 4:
          // chaoter 6 step D
          local _enabled_tools = [ tool_build_station,
                                    tool_build_way
          ]

          enabled_tools.extend(_enabled_tools)

          local _pak64_tools = [ 0x8008 ]
          local _pak64german_tools = [ 0x8010, 0x8002, 0x800e ]

          enabled_tools_pak64.extend(_pak64_tools)
          enabled_tools_pak64german.extend(_pak64german_tools)

          break
      }
      break
    case 7:

      break

  }

  switch (pak_name) {
    case "pak64":
      if ( pak64_pl_tools.len() > 0 ) {
        unused_pl_tools.extend(pak64_pl_tools)
      }
      if ( enabled_tools_pak64.len() > 0 ) {
        enabled_tools.extend(enabled_tools_pak64)
      }
      break
    case "pak64.german":
      if ( pak64german_pl_tools.len() > 0 ) {
        unused_pl_tools.extend(pak64german_pl_tools)
      }
      if ( enabled_tools_pak64german.len() > 0 ) {
        enabled_tools.extend(enabled_tools_pak64german)
      }
      break
  }

  // tools enabled
  if ( enabled_tools.len() > 0 ) {
    for ( local x = 0; x < enabled_tools.len(); x++ ) {
      rules.allow_tool( pl, enabled_tools[x] )
    }
  }

  rules.gui_needs_update()
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
