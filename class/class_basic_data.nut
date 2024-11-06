
// placeholder for tools names in simutrans
tool_alias  <- {inspe = "Abfrage", road= "ROADTOOLS", rail = "RAILTOOLS", ship = "SHIPTOOLS", land = "SLOPETOOLS", spec = "SPECIALTOOLS"}

// placeholder for good names in pak64
good_alias  <- {mail = "Post", passa= "Passagiere", goods = "Goods", wood = "Holz", plan = "Bretter", coal = "Kohle", oel = "Oel" , gas = "Gasoline"}


/*
 *  rename factory names
 *  translate object name in to language by start scenario
 */
function rename_factory_names() {

  local list = factory_list_x()
  foreach(factory in list) {
    // factory is an instance of the factory_x class
    local f_tile = factory.get_tile_list()
    local f_name = factory_x(f_tile[0].x, f_tile[0].y).get_desc().get_name()
    //gui.add_message("Current: "+factory_x(f_tile[0].x, f_tile[0].y).get_desc().get_name()+" translate: "+translate(f_name))

    factory_x(f_tile[0].x, f_tile[0].y).set_name(translate(f_name))

    if ( f_tile[0].x == 123 && f_tile[0].y == 160 ) {
      translate_objects_list.rawset("fac_1_name", translate(f_name))
    }
    if ( f_tile[0].x == 93 && f_tile[0].y == 153 ) {
      translate_objects_list.rawset("fac_2_name", translate(f_name))
    }
    if ( f_tile[0].x == 110 && f_tile[0].y == 190 ) {
      translate_objects_list.rawset("fac_3_name", translate(f_name))
    }

  }


}

/*
 *  translate objects
 *
 *
 */
function translate_objects() {

  //translate_objects_list.inspec <- translate("Abfrage")
  translate_objects_list.rawset("inspec", translate("Abfrage"))

  translate_objects_list.rawset("tools_road", translate("ROADTOOLS"))
  translate_objects_list.rawset("tools_rail", translate("RAILTOOLS"))
  translate_objects_list.rawset("tools_ship", translate("SLOPETOOLS"))
  translate_objects_list.rawset("tools_special", translate("SPECIALTOOLS"))
  translate_objects_list.rawset("tools_slope", translate("SLOPETOOLS"))

  translate_objects_list.rawset("depot_road", translate("CarDepot"))
  translate_objects_list.rawset("depot_rail", translate("TrainDepot"))
  translate_objects_list.rawset("depot_ship", translate("ShipDepot"))
  translate_objects_list.rawset("depot_air", translate("1930AirDepot"))

  translate_objects_list.rawset("good_goods", translate("Goods"))

  translate_objects_list.rawset("good_mail", translate("Post"))
  translate_objects_list.rawset("good_passa", translate("Passagiere"))
  translate_objects_list.rawset("good_wood", translate("Holz"))
  translate_objects_list.rawset("good_plan", translate("Bretter"))
  translate_objects_list.rawset("good_coal", translate("Kohle"))
  translate_objects_list.rawset("good_oel", translate("Oel"))
  translate_objects_list.rawset("good_gas", translate("Gasoline"))

  if ( pak_name == "pak64.german" ) {
    translate_objects_list.rawset("tools_power", translate("POWERLINE"))
  }
  //gui.add_message("Current: "+translate_objects_list.inspec)

  rename_factory_names()
}

/*
 *  set vehicle for chapter 2 step 4
 *
 */
function get_veh_ch2_st4() {
  switch (pak_name) {
    case "pak64":
      return "BuessingLinie"
      break
    case "pak64.german":
      return "BuessingLinie"
      break
  }

}

/*
 *  set objects for chapter 2
 *
 *  id 1 = way name
 *  id 2 = bridge name
 *  id 3 = stations name
 *  id 4 = depot name
 *
 */
function get_obj_ch2(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "asphalt_road"
          break
        case 2:
          return "tb_classic_road"
          break
        case 3:
          return "BusStop"
          break
        case 4:
          return "CarDepot"
          break
      }
      break
    case "pak64.german":
      switch (id) {
        case 1:
          return "asphalt_road"
          break
        case 2:
          return "ClassicRoad"
        break
        case 3:
          return "BusHalt_1"
          break
        case 4:
          return "CarDepot"
          break
      }
      break
  }
}

/*
 *  set vehicle for chapter 3
 *
 *  id 1 = step 5 loco
 *  id 2 = step 7 loco
 *  id 3 = step 11 loco
 *  id 4 = step 4 wag
 *  id 5 = step 7 wag
 *  id 6 = step 11 wag
 *
 */
function get_veh_ch3(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "1Diesellokomotive"
          break
        case 2:
          return "1Diesellokomotive"
          break
        case 3:
          return "NS1000"
          break
        case 4:
          return "Holzwagen"
          break
        case 5:
          return "Holzwagen"
          break
        case 6:
          return "Passagierwagen"
          break
      }
    break
    case "pak64.german":
      switch (id) {
        case 1:
          return "1Diesellokomotive"
          break
        case 2:
          return "1Diesellokomotive"
          break
        case 3:
          return "E41"
          break
        case 4:
          return "Bretterwagen"
          break
        case 5:
          return "Bretterwagen"
          break
        case 6:
          return "Bn_original"
          break
      }
      break
  }

}

/*
 *  set objects for chapter 3
 *
 *  id 1 = way name
 *  id 2 = bridge name
 *  id 3 = stations name
 *  id 4 = depot name
 *  id 5 = tunnel name
 *  id 6 = signal name
 *  id 7 = overheadpower name
 *
 */
function get_obj_ch3(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "concrete_sleeper_track"
          break
        case 2:
          return "ClassicRail"
          break
        case 3:
          return "FreightTrainStop"
          break
        case 4:
          return "TrainDepot"
          break
        case 5:
          return "RailTunnel"
          break
        case 6:
          return "Signals"
          break
        case 7:
          return "SlowOverheadpower"
          break
      }
      break
    case "pak64.german":
      switch (id) {
        case 1:
          return "Gleis_100"
          break
        case 2:
          return "ClassicRail"
        break
        case 3:
          return "MHzPS2FreightTrainStop"
          break
        case 4:
          return "TrainDepot"
          break
        case 5:
          return "RailTunnel_2"
          break
        case 6:
          return "Signals"
          break
        case 7:
          return "SlowOverheadpower"
          break
      }
      break
  }
}

/*
 *  set vehicle for chapter 4
 *
 *  id 1 = step 4 ship
 *  id 2 = step 7 ship
 *
 */
function get_veh_ch4(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "EnCo_Oil_Ship"
          break
        case 2:
          return "SlowFerry"
          break
      }
    break
    case "pak64.german":
      switch (id) {
        case 1:
          return "Oeltankschiff"
          break
        case 2:
          return "Ferry"
          break
      }
      break
  }

}

/*
 *  set objects for chapter 4
 *
 *  id 1 = way name
 *  id 2 = harbour 1 name (good)
 *  id 3 = cannel stop name
 *  id 4 = harbour 2 name (passenger)
 *  id 5 = depot name
 *
 */
function get_obj_ch4(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "Kanal"
          break
        case 2:
          return "LargeShipStop"
          break
        case 3:
          return "ChannelStop"
          break
        case 4:
          return "ShipStop"
          break
        case 5:
          return "ShipDepot"
          break
      }
      break
    case "pak64.german":
      switch (id) {
        case 1:
          return "Kanal"
          break
        case 2:
          return "LargeShipStop"
        break
        case 3:
          return "ChannelStop"
          break
        case 4:
          return "ShipStop"
          break
        case 5:
          return "ShipDepot"
          break
      }
      break
  }
}

/*
 *  set vehicle for chapter 5
 *
 *  id 1 = step 2 truck (coal)
 *  id 2 = step 2 truck trail (coal)
 *  id 3 = step 4 truck (post)
 *  id 4 = step 4 ship (post)
 *
 */
function get_veh_ch5(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "Kohletransporter"
          break
        case 2:
          return "Kohleanhaenger"
          break
        case 3:
          return "Posttransporter"
          break
        case 4:
          return "Postschiff"
          break
      }
    break
    case "pak64.german":
      switch (id) {
        case 1:
          return "Buessing_B8000_catg2"
          break
        case 2:
          return "anhaenger_catg2"
          break
        case 3:
          return "Post_Opel"
          break
        case 4:
          return "Tugboat"
          break
      }
      break
  }

}

/*
 *  set objects for chapter 5
 *
 *  id 1 = road way name
 *  id 2 = truck stop name (good)
 *  id 3 = powerline way name
 *  id 4 = powerline transformer
 *  id 5 = depot name
 *  id 6 = post extension name
 *
 */
function get_obj_ch5(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "asphalt_road"
          break
        case 2:
          return "CarStop"
          break
        case 3:
          return "Powerline"
          break
        case 4:
          return "Aufspanntransformator"
          break
        case 5:
          return "CarDepot"
          break
        case 6:
          return "PostOffice"
          break
      }
      break
    case "pak64.german":
      switch (id) {
        case 1:
          return "asphalt_road"
          break
        case 2:
          return "LKW_Station_1"
        break
        case 3:
          return "Powerline"
          break
        case 4:
          return "PowerSource"
          break
        case 5:
          return "CarDepot"
          break
        case 6:
          return "SmallPostOffice"
          break
      }
      break
  }
}

/*
 *  set vehicle for chapter 6
 *
 *  id 1 = step 2 airplane (passenger)
 *  id 2 = step 3 bus
 *  id 3 = step 4 bus
 *
 */
function get_veh_ch6(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "DC-3"
          break
        case 2:
          return "BuessingLinie"
          break
        case 3:
          return "BuessingLinie"
          break
      }
    break
    case "pak64.german":
      switch (id) {
        case 1:
          return "DC-3"
          break
        case 2:
          return "BuessingLinie"
          break
        case 3:
          return "BuessingLinie"
          break
      }
      break
  }

}

/*
 *  set objects for chapter 6
 *
 *  id 1 = runway name
 *  id 2 = taxiway name
 *  id 3 = air stop name
 *  id 4 = air extension name
 *  id 5 = air depot name
 *  id 6 = road depot name
 *
 */
function get_obj_ch6(id) {
  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return "runway_modern"
          break
        case 2:
          return "taxiway"
          break
        case 3:
          return "AirStop"
          break
        case 4:
          return "Tower1930"
          break
        case 5:
          return "1930AirDepot"
          break
        case 6:
          return "CarDepot"
          break
      }
      break
    case "pak64.german":
      switch (id) {
        case 1:
          return "runway_modern"
          break
        case 2:
          return "taxiway"
        break
        case 3:
          return "AirStop"
          break
        case 4:
          return "Tower1930"
          break
        case 5:
          return "1930AirDepot"
          break
        case 6:
          return "CarDepot"
          break
      }
      break
  }
}

/*
 *  set count wg for train
 *
 *  id 1 - chapter 3 : train good Holz
 *  id 2 - chapter 3 : train good Bretter
 *  id 3 - chapter 3 : train good Passagiere
 *
 */
function set_train_lenght(id) {

  switch (pak_name) {
    case "pak64":
      switch (id) {
        case 1:
          return 5
          break
        case 2:
          return 5
        break
        case 3:
          return 7
          break
      }
      break
    case "pak64.german":
      switch (id) {
        case 1:
          return 4
          break
        case 2:
          return 4
        break
        case 3:
          return 5
          break
      }
      break
  }
}
