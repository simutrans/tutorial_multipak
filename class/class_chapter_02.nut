/*
 *  class chapter_02
 *
 *
 *  Can NOT be used in network game !
 */

class tutorial.chapter_02 extends basic_chapter
{
  chapter_name  = ch2_name
  chapter_coord = coord_chapter_2

  startcash     = 800000            // pl=0 startcash; 0=no reset
  stop_mark = false

  gltool = null
  gl_wt = wt_road
  gl_st = st_flat

  // Step 4 =====================================================================================
  ch2_cov_lim1 = {a = 0, b = 0}

  // Step 6 =====================================================================================
  ch2_cov_lim2 = {a = 0, b = 0}

  // Step 7 =====================================================================================
  ch2_cov_lim3 = {a = 0, b = 0}

  cty1 = {name = ""}

  // Step 1 =====================================================================================
  //Carretera para el deposito

  build_list = [] // tile list for build

  // Step 3 =====================================================================================
  //Parasdas de autobus
  c_lock = [coord(99,28), coord(98,32), coord(99,32), coord(97,27), coord(97,26)]
  sch_cov_correct = false

  // Step 4 =====================================================================================
  //Primer autobus
  line1_name = "Test 1"
  veh1_obj = get_veh_ch2_st4()
  veh1_load = set_loading_capacity(1)
  veh1_wait = set_waiting_time(1)
  dep_cnr1 = null //auto started

  // Step 5 =====================================================================================
  // Primer puente
  t_list_brd = []

  // Step 6 =====================================================================================
  // Conectando el muelle

  line2_name = "Test 2"
  dep_cnr2 = null //auto started
  cov_nr = 0

  // Step 7 =====================================================================================
  // Conectando las ciudades

  cty2 = {name = ""}

  line3_name = "Test 3"
  dep_cnr3 = null //auto started


  // Step 8 =====================================================================================
  price = 1200

  // define objects
  //----------------------------------------------------------------------------------
  sc_way_name = get_obj_ch2(1)
  sc_bridge_name = get_obj_ch2(2)
  sc_station_name = get_obj_ch2(3)
  sc_dep_name = get_obj_ch2(4)

  function start_chapter()  //Inicia solo una vez por capitulo
  {
    local lim_idx = cv_list[(persistent.chapter - 2)].idx
    ch2_cov_lim1 = {a = cv_lim[lim_idx].a, b = cv_lim[lim_idx].b}
    ch2_cov_lim2 = {a = cv_lim[lim_idx+1].a, b = cv_lim[lim_idx+1].b}
    ch2_cov_lim3 = {a = cv_lim[lim_idx+2].a, b = cv_lim[lim_idx+2].b}

    dep_cnr1 = get_dep_cov_nr(ch2_cov_lim1.a,ch2_cov_lim1.b)
    dep_cnr2 = get_dep_cov_nr(ch2_cov_lim2.a,ch2_cov_lim2.b)
    dep_cnr3 = get_dep_cov_nr(ch2_cov_lim3.a,ch2_cov_lim3.b)

    cty1.name = get_city_name(city1_tow)
    cty2.name = get_city_name(city2_tow)
    line1_name = "City " + cty1.name
    line2_name = line1_name + " dock/station"
    line3_name = cty1.name + " " + cty2.name

    if(this.step == 1) {
      local tile = my_tile(city1_road_depot)
      if ( tile_x(tile.x-1, tile.y, tile.z).get_way(wt_road) != null ) { build_list.append(tile_x(tile.x-1, tile.y, tile.z)) }
      if ( tile_x(tile.x+1, tile.y, tile.z).get_way(wt_road) != null ) { build_list.append(tile_x(tile.x+1, tile.y, tile.z)) }
      if ( tile_x(tile.x, tile.y-1, tile.z).get_way(wt_road) != null ) { build_list.append(tile_x(tile.x, tile.y-1, tile.z)) }
      if ( tile_x(tile.x, tile.y+1, tile.z).get_way(wt_road) != null ) { build_list.append(tile_x(tile.x, tile.y+1, tile.z)) }
      build_list.append(tile)
    }

    local pl = 0
    //Schedule list form current convoy
    if(this.step == 4){
      local c_dep = this.my_tile(city1_road_depot)
      local c_list = city1_halt_1
      start_sch_tmpsw(pl,c_dep, c_list)
    }
    else if(this.step == 6){
      local c_dep = this.my_tile(city1_road_depot)
      local c_list = city1_halt_2
      start_sch_tmpsw(pl,c_dep, c_list)
    }
    else if(this.step == 7){
      local c_dep = this.my_tile(city1_road_depot)
      local c_list = city2_halt_1
      start_sch_tmpsw(pl, c_dep, c_list)
    }

    // Starting tile list for bridge
    for(local i = bridge1_coords.a.y; i <= bridge1_coords.b.y; i++){
      t_list_brd.push(my_tile(coord(bridge1_coords.a.x, i)))
    }

  }

  function set_goal_text(text){

    if ( translate_objects_list.rawin("inspec") ) {
      if ( translate_objects_list.inspec != translate("Abfrage") ) {
        //gui.add_message("change language")
        translate_objects()
      }
    } else {
      gui.add_message("error language object key")
    }

    switch (this.step) {
      case 1:
        text.t1 = city1_road_depot.href("("+city1_road_depot.tostring()+")")
        // remove from textfile
        // or used build_list[] - last entry depot tile
        text.t2 = "" //coorda.href("("+coorda.tostring()+")")
        text.t3 = "" //coordb.href("("+coordb.tostring()+")")
        break
      case 2:
        text.pos = city1_road_depot.href("("+city1_road_depot.tostring()+")")
        break
      case 3:
        text.list = create_halt_list(city1_halt_1)
        break
      case 4:
        //local c = coord(city1_halt_1[0].x, city1_halt_1[0].y)
        local tile = my_tile(city1_halt_1[0])
        text.stnam = "1) "+tile.get_halt().get_name()+" ("+city1_halt_1[0].tostring()+")"

        text.list = create_schedule_list(city1_halt_1)
        text.nr = city1_halt_1.len()
        break
      case 5:
        text.bpos1 = bridge1_coords.a.href("("+bridge1_coords.a.tostring()+")")
        text.bpos2 = bridge1_coords.b.href("("+bridge1_coords.b.tostring()+")")

        text.bridge_info = get_info_file("bridge")

        break
      case 6:
        veh1_load = set_loading_capacity(2)
        veh1_wait = set_waiting_time(2)

        if (current_cov==(ch2_cov_lim2.a+1)){
          text = ttextfile("chapter_02/06_1-2.txt")
          text.tx = ttext("<em>[1/2]</em>")
        }
        else if (current_cov<=(dep_cnr2)){
          text = ttextfile("chapter_02/06_2-2.txt")
          text.tx = ttext("<em>[2/2]</em>")
        }
        text.list = create_schedule_list(city1_halt_2)

        local tile = my_tile(city1_halt_2[0])
        text.stnam = "1) "+tile.get_halt().get_name()+" ("+city1_halt_2[0].tostring()+")"

        local halt = my_tile(city1_halt_2[0]).get_halt()
        text.line = get_line_name(halt)

        text.cir = cov_nr
        text.cov = dep_cnr2

        break
      case 7:
        veh1_load = set_loading_capacity(3)
        veh1_wait = set_waiting_time(3)

        if (!cov_sw){
          text = ttextfile("chapter_02/07_3-3.txt")
          text.tx = ttext("<em>[3/3]</em>")

          local tile = my_tile(city2_halt_1[city2_halt_1.len()-1])
          text.stnam = ""+city2_halt_1.len()+") "+tile.get_halt().get_name()+" ("+coord_to_string(tile)+")"

          text.list = create_halt_list(city2_halt_1)
          text.nr = siz
        }
        else if (pot0==0){
          text = ttextfile("chapter_02/07_1-3.txt")
          text.tx = ttext("<em>[1/3]</em>")

          text.list = create_halt_list(city2_halt_1.slice(1))
        }
        else if (pot2==0){
          text = ttextfile("chapter_02/07_2-3.txt")
          text.tx = ttext("<em>[2/3]</em>")

          if (r_way.r)
            text.cbor = "<em>"+translate("Ok")+"</em>"
          else
            text.cbor = coord(r_way.c.x, r_way.c.y).href("("+r_way.c.tostring()+")")
        }
        else if (pot3==0){
          text = ttextfile("chapter_02/07_3-3.txt")
          text.tx = ttext("<em>[3/3]</em>")

          local tile = my_tile(city2_halt_1[city2_halt_1.len()-1])
          text.stnam = ""+city2_halt_1.len()+") "+tile.get_halt().get_name()+" ("+coord_to_string(tile)+")"

          text.list = create_schedule_list(city2_halt_1)
          text.nr = city1_halt_2.len()
        }

        text.n1 = city1_tow.href(cty1.name.tostring())
        text.n2 = city2_tow.href(cty2.name.tostring())
        local t = coord(way1_coords.a.x, way1_coords.a.y)
        text.pt1 = t.href("("+t.tostring()+")")
        t = coord(way1_coords.b.x, way1_coords.b.y)
        text.pt2 = t.href("("+t.tostring()+")")
        text.dep = city1_road_depot.href("("+city1_road_depot.tostring()+")")
        break

      case 8:
        local st_halt1 = my_tile(city1_halt_2[city1_halt_2.len()-1]).get_halt()
        text.st1 = city1_halt_2[city1_halt_2.len()-1].href(st_halt1.get_name()+" ("+city1_halt_2[city1_halt_2.len()-1].tostring()+")")
        text.prce = money_to_string(price)
        break
    }
    text.load = veh1_load
    text.wait = get_wait_time_text(veh1_wait)
    text.pos = city1_road_depot.href("("+city1_road_depot.tostring()+")")
    text.bus1 = translate(veh1_obj)
    text.name = city1_tow.href(cty1.name.tostring())
    text.name2 = city2_tow.href(cty2.name.tostring())
    text.tool1 = translate_objects_list.inspec
    text.tool2 = translate_objects_list.tools_road
    text.tool3 = translate_objects_list.tools_special

    return text
  }

  function is_chapter_completed(pl) {
    if (pl != 0) return 0   // only human player = 0

    save_glsw()
    save_pot()

    local chapter_steps = 8
    local chapter_step = persistent.step
    local chapter_sub_steps = 0 // count all sub steps
    local chapter_sub_step = 0  // actual sub step

    switch (this.step) {
      case 1:
        local next_mark = true
        local tile = my_tile(city1_road_depot)
        try {
           next_mark = delay_mark_tile_list(build_list)
        }
        catch(ev) {
          return 0
        }

        //Para la carretera
        //local tile = my_tile(city1_road_depot)
        local way = tile.find_object(mo_way)
        local label = tile.find_object(mo_label)
        if (!way && !label){
          local t1 = command_x(tool_remover)
          local err1 = t1.work(player_x(pl), tile, "")
          label_x.create(city1_road_depot, player_x(pl), translate("Place the Road here!."))
          return 0
        }
        else if ((way)&&(way.get_owner().nr==pl)){
          if(next_mark) {
            next_mark = delay_mark_tile_list(build_list, true)
            tile.remove_object(player_x(1), mo_label)
            this.next_step()
          }
        }

        //return 0
        break;
      case 2:
        local next_mark = true
        local c_list1 = [my_tile(city1_road_depot)]
        local stop_mark = true
        try {
           next_mark = delay_mark_tile(c_list1)
        }
        catch(ev) {
          return 0
        }
        //Para el deposito
        local tile = my_tile(city1_road_depot)
        local waydepo = tile.find_object(mo_way)
        if (!tile.find_object(mo_depot_road)){
          label_x.create(city1_road_depot, player_x(pl), translate("Build a Depot here!."))
        }
        else if (next_mark){
          next_mark = delay_mark_tile(c_list1, stop_mark)
          tile.remove_object(player_x(1), mo_label)
          waydepo.unmark()
          this.next_step()
        }
        //return 0
        break;
      case 3:
        if (pot0==0){
          //Marca tiles para evitar construccion de objetos
          local del = false
          local pl_nr = 1
          local text = "X"
          lock_tile_list(c_lock, c_lock.len(), del, pl_nr, text)
          pot0=1
        }
        local siz = city1_halt_1.len()
        local c_list = city1_halt_1
        local name =  translate("Place Stop here!.")
        local load = good_alias.passa
        local all_stop = is_stop_building(siz, c_list, name, load)

        if (all_stop && pot0==1){
          this.next_step()
        }
        //return 10+percentage
        break
      case 4:
        local conv = cov_save[0]
        local cov_valid = is_cov_valid(conv)
        if(cov_valid){
          pot0 = 1
        }
        local c_list1 = [my_tile(city1_road_depot)]
        if (pot0 == 0){
          local next_mark = true
          try {
             next_mark = delay_mark_tile(c_list1)
          }
          catch(ev) {
            return 0
          }
        }
        else if (pot0 == 1 && pot1 ==0){
          local next_mark = true
          local stop_mark = true
          try {
             next_mark = delay_mark_tile(c_list1, stop_mark)
          }
          catch(ev) {
            return 0
          }
          pot1 = 1
        }

        if (pot1 == 1 ){
          local c_dep = this.my_tile(city1_road_depot)
          local line_name = line1_name //"Test 1"
          set_convoy_schedule(pl, c_dep, gl_wt, line_name)

          local depot = depot_x(c_dep.x, c_dep.y, c_dep.z)
          local cov_list = depot.get_convoy_list()    //Lista de vehiculos en el deposito
          local convoy = convoy_x(gcov_id)
          if (cov_list.len()>=1){
            convoy = cov_list[0]
          }
          local all_result = checks_convoy_schedule(convoy, pl)

          sch_cov_correct = all_result.res == null ? true : false

        }
        if (cov_valid && current_cov == ch2_cov_lim1.b){
          if (conv.is_followed()) {
            pot2=1
          }
        }
        if (pot2 == 1 ){
          this.next_step()
          //Crear cuadro label
          local opt = 0
          label_bord(bridge1_limit.a, bridge1_limit.b, opt, false, "X")
          //Elimina cuadro label
          label_bord(change1_city1_limit1.a, change1_city1_limit1.b, opt, true, "X")
          //label_bord(c_lock.a, c_lock.b, opt, true, "X")
          lock_tile_list(c_lock, c_lock.len(), true, 1)
        }

        //return 50
        break
      case 5:
        local t_label = my_tile(bridge1_coords.a)
        local label = t_label.find_object(mo_label)

        local next_mark = true
        if (pot0 == 0){
          if(!label)
            label_x.create(bridge1_coords.a, player_x(pl), translate("Build a Bridge here!."))
            label_x.create(bridge1_coords.b, player_x(pl), "")
          try {
             next_mark = delay_mark_tile(t_list_brd)
          }
          catch(ev) {
            return 0
          }
        }
        else if (pot0 == 1 && pot1 ==0){
          stop_mark = true
          try {
             next_mark = delay_mark_tile(t_list_brd, stop_mark)
          }
          catch(ev) {
            return 0
          }
          pot1 = 1
        }
        if (pot1==1) {
          //Comprueba la conexion de la via
          local tx = 0
          local ty = 1
          local tile = square_x(bridge1_coords.b.x+tx, bridge1_coords.b.y+ty).get_ground_tile()
          // todo check bridge direction

          local coora = coord3d(bridge1_coords.a.x, bridge1_coords.a.y, bridge1_coords.a.z)
          local coorb = coord3d(tile.x, tile.y, tile.z)
          local dir = bridge1_coords.dir
          local obj = false
          local r_way = get_fullway(coora, coorb, dir, obj)
          if (r_way.r){
            t_label.remove_object(player_x(1), mo_label)
            t_label = my_tile(bridge1_coords.b)
            t_label.remove_object(player_x(1), mo_label)
            this.next_step()
            //Crear cuadro label
            local opt = 0
            label_bord(c_dock1_limit.a, c_dock1_limit.b, opt, false, "X")
            //Elimina cuadro label
            label_bord(change2_city1_limit1.a, change2_city1_limit1.b, opt, true, "X")
          }
        }
        //return 65
        break

      case 6:
        chapter_sub_steps = 2

        local c_dep = this.my_tile(city1_road_depot)
        local line_name = line2_name //"Test 2"
        set_convoy_schedule(pl,c_dep, gl_wt, line_name)

        local id_start = 1
        local id_end = 3
        cov_nr = get_convoy_number_exp(city1_halt_2[0], c_dep, id_start, id_end)

        local convoy = convoy_x(gcov_id)
        local all_result = checks_convoy_schedule(convoy, pl)
        if(!all_result.cov ){
          reset_glsw()
        }

        //gui.add_message("current_cov "+current_cov+" cov_nr "+cov_nr+" all_result "+all_result+" all_result.cov "+all_result.cov)
        if ( cov_nr>=1 ) {
          chapter_sub_step = 1  // sub step finish
        }

        if (current_cov==ch2_cov_lim2.b){
          this.next_step()
          //Elimina cuadro label
          local opt = 0
          label_bord(city1_limit1.a, city1_limit1.b, opt, true, "X")
          label_bord(bridge1_limit.a, bridge1_limit.b, opt, true, "X")
          label_bord(c_dock1_limit.a, c_dock1_limit.b, opt, true, "X")
          //Creea un cuadro label
          label_bord(city2_limit1.a, city2_limit1.b, opt, false, "X")
        }
        //return 70
        break

      case 7:
        chapter_sub_steps = 3

        if (pot0==0){

          local siz = city2_halt_1.len()
          local c_list = city2_halt_1
          local name =  translate("Place Stop here!.")
          local load = good_alias.passa
          local all_stop = is_stop_building(siz, c_list, name, load)

          if (all_stop) {
            pot0=1
            reset_glsw()
          }
        }

        else if (pot0==1 && pot1==0){
          //Elimina cuadro label
          local opt = 0
          label_bord(city2_limit1.a, city2_limit1.b, opt, true, "X")

          //Creea un cuadro label
          opt = 0
          label_bord(c_way_limit1.a, c_way_limit1.b, opt, false, "X")

          //Limpia las carreteras
          opt = 2
          label_bord(c_way_limit1.a, c_way_limit1.b, opt, true, "X", gl_wt)

          pot1=1
        }

        else if (pot1==1 && pot2==0){
          chapter_sub_step = 1  // sub step finish
          //Comprueba la conexion de la via
          local coora = coord3d(way1_coords.a.x,way1_coords.a.y,way1_coords.a.z)
          local coorb = coord3d(way1_coords.b.x,way1_coords.b.y,way1_coords.b.z)
          local dir = way1_coords.dir
          local obj = false
          local r_way = get_fullway(coora, coorb, dir, obj)

          //Para marcar inicio y fin de la via
          local waya = tile_x(coora.x,coora.y,coora.z).find_object(mo_way)
          local wayb = tile_x(coorb.x,coorb.y,coorb.z).find_object(mo_way)
          if (waya) waya.mark()
          if (wayb) wayb.mark()

          if (r_way.r){
            //Para desmarcar inicio y fin de la carretera
            waya.unmark()
            wayb.unmark()

            //way1_coords.a.remove_object(player_x(1), mo_label)
            //way1_coords.b.remove_object(player_x(1), mo_label)

            //Elimina cuadro label
            local opt = 0
            label_bord(c_way_limit1.a, c_way_limit1.b, opt, true, "X")

            //Creea un cuadro label
            label_bord(city1_limit1.a, city1_limit1.b, opt, false, "X")
            label_bord(city2_limit1.a, city2_limit1.b, opt, false, "X")

            pot2=1
          }
        }

        else if (pot2==1 && pot3==0) {
          chapter_sub_step = 2  // sub step finish
          local c_dep = this.my_tile(city1_road_depot)
          local line_name = line3_name //"Test 3"
          set_convoy_schedule(pl, c_dep, gl_wt, line_name)

          local depot = depot_x(c_dep.x, c_dep.y, c_dep.z)
          local cov_list = depot.get_convoy_list()    //Lista de vehiculos en el deposito
          local convoy = convoy_x(gcov_id)
          if (cov_list.len()>=1){
            convoy = cov_list[0]
          }
          local all_result = checks_convoy_schedule(convoy, pl)
          sch_cov_correct = all_result.res == null ? true : false

          if (current_cov == ch2_cov_lim3.b) {
            //Desmarca la via en la parada
            local way_mark = my_tile(line_connect_halt).find_object(mo_way)
            way_mark.unmark()

            //Elimina cuadro label
            local opt = 0
            label_bord(city1_limit1.a, city1_limit1.b, opt, true, "X")
            label_bord(city2_limit1.a, city2_limit1.b, opt, true, "X")

            label_bord(bridge1_limit.a, bridge1_limit.b, opt, false, "X")
            this.next_step()
          }
        }
        //return 95
        break

      case 8:
        if (pot0==0){
          local halt1 = my_tile(city1_halt_2[city1_halt_2.len()-1]).get_halt()
          if (pl != halt1.get_owner().nr && glsw[0] == 0)
            glsw[0]=1
          if (pl != halt1.get_owner().nr)
            glsw[1]=1

          if (glsw[0]==1 && glsw[1]==1){
            local opt = 0
            label_bord(bridge1_limit.a, bridge1_limit.b, opt, true, "X")
            this.next_step()
          }
        }

        //return 98
        break
      case 9:
        //this.step=1
        persistent.step=1
        persistent.status.step = 1

        //return 100
        break
    }
    local percentage = chapter_percentage(chapter_steps, chapter_step, chapter_sub_steps, chapter_sub_step)
    return percentage
  }

  function is_work_allowed_here(pl, tool_id, name, pos, tool) {
    local t = tile_x(pos.x, pos.y, pos.z)
    local ribi = 0
    local slope = t.get_slope()
    local way = t.find_object(mo_way)
    local bridge = t.find_object(mo_bridge)
    local build = t.find_object(mo_building)
    local label = t.find_object(mo_label)
    local car = t.find_object(mo_car)
    if (way){
      if (tool_id!=tool_build_bridge)
        ribi = way.get_dirs()
      if (!t.has_way(gl_wt))
        ribi = 0
    }
    local st_c = coord(pos.x,pos.y)
    local result=null // null is equivalent to 'allowed'
    result = translate("Action not allowed")+" ("+pos.tostring()+")."
    gltool = tool_id
    switch (this.step) {
      //Construye un tramo de carretera
      case 1:
        if (tool_id==tool_build_way){
          local way_desc =  way_desc_x.get_available_ways(gl_wt, gl_st)
          foreach(desc in way_desc){
            if(desc.get_name() == name){
              for ( local i = 0; i < build_list.len()-1; i++ ) {
                if ( ((pos.x==build_list[i].x)&&(pos.y==build_list[i].y)) || ((pos.x==city1_road_depot.x)&&(pos.y==city1_road_depot.y)) ) {
                  if(!cursor_control(build_list[i]))
                  return null
                }
              }

              return translate("Connect the road here")+" ("+city1_road_depot.tostring()+")."
            }
          }
        }
        break;
      //Construye un deposito de carreteras
      case 2:
        if ((pos.x==city1_road_depot.x)&&(pos.y==city1_road_depot.y)){
          if (my_tile(city1_road_depot).find_object(mo_way)){
            if (tool_id==tool_build_depot) return null
          }
          else {
            this.backward_step()
            return translate("You must first build a stretch of road")+" ("+pos.x+","+pos.y+")."
          }
        }
        else if (tool_id==tool_build_depot)
          return result=translate("You must build the depot in")+" ("+c_dep.tostring()+")."

        break;
      //Construye las paradas de autobus
      case 3:

        if (pos.x == city1_road_depot.x && pos.y == city1_road_depot.y )
          return format(translate("You must build the %d stops first."),city1_halt_1.len())
        if (pos.x>city1_limit1.a.x && pos.y>city1_limit1.a.y && pos.x<city1_limit1.b.x && pos.y<city1_limit1.b.y){
          //Permite construir paradas
          if (tool_id==tool_build_station){
            local nr = city1_halt_1.len()
            local c_st = city1_halt_1
            return build_stop(nr, c_st, t, way, slope, ribi, label, pos)
          }

          //Permite eliminar paradas
          if (tool_id==tool_remover){
            local nr = city1_halt_1.len()
            local c_st = city1_halt_1
            return delete_stop(nr, c_st, way, pos)
          }
        }
        else if (tool_id==tool_build_station)
          return result = format(translate("Stops should be built in [%s]"), cty1.name)+" ("+cty1.c.tostring()+")."

        break;
      //Enrutar el primer autobus
      case 4:
        if (tool_id==tool_build_station)
          return format(translate("Only %d stops are necessary."), city1_halt_1.len())

        //Enrutar vehiculo
        if ((pos.x == city1_road_depot.x && pos.y == city1_road_depot.y)){
          if(tool_id==4096){
            pot0 = 1
            return null
          }
        }
        if (tool_id==4108) {
          result = translate("The route is complete, now you may dispatch the vehicle from the depot")+" ("+city1_road_depot.tostring()+")."
          return is_stop_allowed(result, city1_halt_1.len(), city1_halt_1, pos)
        }

        break;
      //Construye un puente
      case 5:
        if (tool_id==tool_build_bridge || tool_id==tool_build_way) {

          if ((pos.x>=c_bridge1_limit1.a.x)&&(pos.y>=c_bridge1_limit1.a.y)&&(pos.x<=c_bridge1_limit1.b.x)&&(pos.y<=c_bridge1_limit1.b.y)){
            pot0 = 1
            result=null
          }
          else
            return translate("You must build the bridge here")+" ("+bridge1_coords.a.tostring()+")."
        }
        break;
      //Segundo Autobus
      case 6:
        //Enrutar vehiculo
        if (pot0==0){
          if ((tool_id==4096)&&(pos.x == city1_road_depot.x && pos.y == city1_road_depot.y)){
            stop_mark = true
            return null
          }
          if (tool_id==4108) {
            stop_mark = true
            local c_list = city1_halt_2    //Lista de todas las paradas de autobus
            local siz = c_list.len()     //Numero de paradas
            result = translate("The route is complete, now you may dispatch the vehicle from the depot")+" ("+city1_road_depot.tostring()+")."
            return is_stop_allowed(result, siz, c_list, pos)
          }
        }
        break;
      case 7:
        // Construye las paradas
        if (pot0==0){
          if ((tool_id==tool_build_station)){
            if (pos.x>city2_limit1.a.x && pos.y>city2_limit1.a.y && pos.x<city2_limit1.b.x && pos.y<city2_limit1.b.y){

              local nr = city2_halt_1.len()
              local c_st = city2_halt_1
              return build_stop(nr, c_st, t, way, slope, ribi, label, pos)
            }

            else
              return format(translate("You must build a stop in [%s] first"), cty2.name)+" ("+city2_tow.tostring()+")."
          }
          //Permite eliminar paradas
          if (tool_id==tool_remover){
            for(local j=0;j<city2_halt_1.len();j++){
              if (city2_halt_1[j] != null){
                local stop = my_tile(city2_halt_1[j]).find_object(mo_building)
                if (pos.x==city2_halt_1[j].x&&pos.y==city2_halt_1[j].y&&stop){
                  way.mark()
                  return null
                }
              }
            }
            return translate("You can only delete the stops.")
          }
        }
        //Para construir la carretera
        else if (pot1==1 && pot2==0){
          if ((pos.x>=c_way_limit1.a.x)&&(pos.y>=c_way_limit1.a.y)&&(pos.x<=c_way_limit1.b.x)&&(pos.y<=c_way_limit1.b.y)){
            if((pos.x==way1_coords.a.x)&&(pos.y==way1_coords.a.y)){
              if (tool_id==tool_remover || tool_id==tool_remove_way)
                return result
              else if (tool_id==tool_build_way)
                return null
            }
            else
              return all_control(result, gl_wt, gl_st, way, ribi, tool_id, pos, r_way.c, name)
          }

        }
        //Para enrutar vehiculos
        else if (pot2==1 && pot3==0){
          if (tool_id==4108){
            //Paradas de la primera ciudad
            result = translate("The route is complete, now you may dispatch the vehicle from the depot")+" ("+city1_road_depot.tostring()+")."
            return is_stop_allowed(result, city2_halt_1.len(), city2_halt_1, pos)
          }
        }
        break;

      //Paradas publicas
      case 8:
        if (tool_id==4128) {
          if (pos.x==city1_halt_2[city1_halt_2.len()-1].x && pos.y==city1_halt_2[city1_halt_2.len()-1].y && glsw[0] > 0){
              return format(translate("Select station No.%d"),2)+" ("+pub_st2.tostring()+")."
          } else { return null }
          /*if (pos.x==city1_halt_2[city1_halt_2.len()-1].x && pos.y==city1_halt_2[city1_halt_2.len()-1].y && glsw[1] > 0){

              return null
          }
          else {
            if (glsw[0]==0)
              return format(translate("Select station No.%d"),1)+" ("+city1_halt_2[city1_halt_2.len()-1].tostring()+")."
            else if (glsw[1]==0)
              return format(translate("Select station No.%d"),2)+" ("+city1_halt_2[city1_halt_2.len()-1].tostring()+")."
            }*/
        }
        break;
    }
    if (tool_id==4096){
      if (label && label.get_text()=="X")
        return translate("Indicates the limits for using construction tools")+" ("+pos.tostring()+")."

      else if (label)
        return translate("Text label")+" ("+pos.tostring()+")."

      result = null // Always allow query tool
    }
    if (label && label.get_text()=="X")
      return translate("Indicates the limits for using construction tools")+" ("+pos.tostring()+")."

    return result
  }

  function is_schedule_allowed(pl, schedule) {
    local result=null // null is equivalent to 'allowed'
    if ( (pl == 0) && (schedule.waytype != gl_wt) )
      result = translate("Only road schedules allowed")
    local nr = schedule.entries.len()
    switch (this.step) {
      case 4:
        local selc = 0
        local load = veh1_load
        local time = veh1_wait
        local c_list = city1_halt_1
        local siz = c_list.len()
        local line = true
        result = set_schedule_list(result, pl, schedule, nr, selc, load, time, c_list, siz, line)
        if(result == null){
          local line_name = line1_name //"Test 1"
          update_convoy_schedule(pl, gl_wt, line_name, schedule)
        }

        return result
      break
      case 6:
        local selc = 0
        local load = veh1_load
        local time = veh1_wait
        local c_list = city1_halt_2
        local siz = c_list.len()
        local line = true
        result = set_schedule_list(result, pl, schedule, nr, selc, load, time, c_list, siz, line)
        if(result == null){
          local line_name = line2_name //"Test 2"
          update_convoy_schedule(pl, gl_wt, line_name, schedule)
        }
        return result
      break
      case 7:
        local load = veh1_load
        local time = veh1_wait
        local c_list = city2_halt_1
        local siz = c_list.len()
        local selc = siz-1
        local line = true
        result = set_schedule_list(result, pl, schedule, nr, selc, load, time, c_list, siz, line)
        if(result == null){
          local line_name = line3_name //"Test 3"
          update_convoy_schedule(pl, gl_wt, line_name, schedule)
        }
        return result
      break
    }
    return translate("Action not allowed")
  }

  function is_convoy_allowed(pl, convoy, depot)
  {
    local result=null // null is equivalent to 'allowed'
    switch (this.step) {
      case 4:
        if (current_cov>ch2_cov_lim1.a && current_cov<ch2_cov_lim1.b){
          local cov = 1
          local veh = 1
          local good_list = [good_desc_x (good_alias.passa).get_catg_index()]    //Passengers
          local name = veh1_obj
          local st_tile = 1
          result = is_convoy_correct(depot,cov,veh,good_list,name, st_tile)

          if (result!=null){
            reset_tmpsw()
            return bus_result_message(result, translate(name), veh, cov)
          }
          local selc = 0
          local load = veh1_load
          local time = veh1_wait
          local c_list = city1_halt_1
          local siz = c_list.len()
          result = set_schedule_convoy(result, pl, cov, convoy, selc, load, time, c_list, siz)
          if(result == null)
            reset_tmpsw()
          return result
        }
      break
      case 6:
        if (current_cov>ch2_cov_lim2.a && current_cov<ch2_cov_lim2.b){
          local cov_list = depot.get_convoy_list()
          local cov = cov_list.len()
          local veh = 1
          local good_list = [good_desc_x (good_alias.passa).get_catg_index()]    //Passengers
          local name = veh1_obj
          local st_tile = 1
          result = is_convoy_correct(depot,cov,veh,good_list,name, st_tile)
          if (result!=null){
            reset_tmpsw()
            return bus_result_message(result, translate(name), veh, cov)
          }

          local selc = 0
          local load = veh1_load
          local time = veh1_wait
          local c_list = city1_halt_2
          local siz = c_list.len()
          local line = true
          result = set_schedule_convoy(result, pl, cov, convoy, selc, load, time, c_list, siz, line)
          if(result == null)
            reset_tmpsw()
          return result
        }
      break
      case 7:
        if (current_cov>ch2_cov_lim3.a && current_cov<ch2_cov_lim3.b){
          local cov = 1
          local veh = 1
          local good_list = [good_desc_x (good_alias.passa).get_catg_index()]    //Passengers
          local name = veh1_obj
          local st_tile = 1
          result = is_convoy_correct(depot,cov,veh,good_list,name, st_tile)
          if (result!=null){
            reset_tmpsw()
            return bus_result_message(result, translate(name), veh, cov)
          }

          local load = veh1_load
          local time = veh1_wait
          local c_list = city2_halt_1
          local siz = c_list.len()
          local selc = siz-1
          result = set_schedule_convoy(result, pl, cov, convoy, selc, load, time, c_list, siz)
          if(result == null)
            reset_tmpsw()
          return result
        }
      break
      case 1:
      break
    }
    return result = translate("It is not allowed to start vehicles.")
  }

  function script_text()
  {
    if (!correct_cov)
      return 0
    local pl = 0
    switch (this.step) {
      case 1:
        local tile = my_tile(city1_road_depot)
        local list = [tile]
        delay_mark_tile(list, true)
        //Para la carretera
        local t1 = command_x(tool_remover)
        local err1 = t1.work(player_x(pl), tile, "")

        local btile = null
        if ( tile_x(tile.x-1, tile.y, tile.z).get_way(wt_road) != null ) { btile = tile_x(tile.x-1, tile.y, tile.z) }
        else if ( tile_x(tile.x+1, tile.y, tile.z).get_way(wt_road) != null ) { btile = tile_x(tile.x+1, tile.y, tile.z) }
        else if ( tile_x(tile.x, tile.y-1, tile.z).get_way(wt_road) != null ) { btile = tile_x(tile.x, tile.y-1, tile.z) }
        else if ( tile_x(tile.x, tile.y+1, tile.z).get_way(wt_road) != null ) { btile = tile_x(tile.x, tile.y+1, tile.z) }

        local t2 = command_x(tool_build_way)
        local err2 = t2.work(player_x(pl), btile, tile, sc_way_name)
        return null
        break;
      case 2:
        local list = [my_tile(city1_road_depot)]
        delay_mark_tile(list, true)
        //Para el deposito
        local t = command_x(tool_build_depot)
        local err = t.work(player_x(pl), my_tile(city1_road_depot), sc_dep_name)
        return null
        break;
      case 3:

        for(local j=0;j<city1_halt_1.len();j++){
          local t = my_tile(city1_halt_1[j])
          local way = t.find_object(mo_way)
          t.remove_object(player_x(1), mo_label)
          local tool = command_x(tool_build_station)
          local err = tool.work(player_x(pl), t, sc_station_name)
          t.unmark()
          if (way.is_marked()){
            way.unmark()
          }
        }
        this.step_nr(4)
        return null
        break
      case 4:
        local list = [my_tile(city1_road_depot)]
        delay_mark_tile(list, true)
        if (pot0 == 0){
          pot0 = 1
        }

        if (current_cov>ch2_cov_lim1.a && current_cov<ch2_cov_lim1.b){
          local player = player_x(pl)
          local c_depot = my_tile(city1_road_depot)
          comm_destroy_convoy(player, c_depot) // Limpia los vehiculos del deposito

          local c_list = city1_halt_1
          local sched = schedule_x(gl_wt, [])
          local load = veh1_load
          local wait = veh1_wait
          local sch_siz = c_list.len()
          for(local j=0;j<sch_siz;j++){
            if (j==0)
              sched.entries.append(schedule_entry_x(my_tile(c_list[j]), load, wait))
            else
              sched.entries.append(schedule_entry_x(my_tile(c_list[j]), 0, 0))
          }
          local c_line = comm_get_line(player, gl_wt, sched)

          local good_nr = 0 //Passengers
          local name = veh1_obj
          local cov_nr = 0  //Max convoys nr in depot
          if (!comm_set_convoy(cov_nr, c_depot, name))
            return 0

          local depot = depot_x(c_depot.x, c_depot.y, c_depot.z)
          local conv = depot.get_convoy_list()
          conv[0].set_line(player, c_line)
          comm_start_convoy(player, conv[0], depot)
          pot2=1

        }
        return null
        break
      case 5:
        if (pot0 == 0){
          pot0 = 1
        }
        if (pot0 == 1){
          local tile = my_tile(bridge1_coords.a)
          tile.remove_object(player_x(1), mo_label)
          tile = my_tile(bridge1_coords.b)
          tile.remove_object(player_x(1), mo_label)
          local t = command_x(tool_build_bridge)
          t.set_flags(2)
          local err = t.work(player_x(pl), my_tile(bridge1_coords.a), my_tile(bridge1_coords.b), sc_bridge_name)
        }

        return null
        break

      case 6:
        local player = player_x(pl)
        local c_depot = my_tile(city1_road_depot)
        comm_destroy_convoy(player, c_depot) // Limpia los vehiculos del deposito

        if (current_cov>ch2_cov_lim2.a && current_cov<ch2_cov_lim2.b){
          local depot = depot_x(c_depot.x, c_depot.y, c_depot.z)
          local c_list = city1_halt_2
          local sch_siz = c_list.len()
          local load = veh1_load
          local time = veh1_wait
          local sched = schedule_x(gl_wt, [])
          for(local i=0;i<sch_siz;i++){
            if (i==0)
              sched.entries.append(schedule_entry_x(my_tile(c_list[i]), load, time))
            else
              sched.entries.append(schedule_entry_x(my_tile(c_list[i]), 0, 0))
          }
          local c_line = comm_get_line(player, gl_wt, sched)

          local good_nr = 0 //Passengers
          local name = veh1_obj
          local cov_nr = 0  //Max convoys nr in depot
          for (local j = current_cov; j>ch2_cov_lim2.a && j<ch2_cov_lim2.b && correct_cov; j++){
            if (!comm_set_convoy(cov_nr, c_depot, name))
              return 0

            local conv = depot.get_convoy_list()
            if (conv.len()==0) continue
            conv[0].set_line(player, c_line)
            comm_start_convoy(player, conv[0], depot)
          }
        }
        return null
        break

      case 7:
        if (pot1==0){
          for(local j=0;j<city2_halt_1.len();j++){
            local t = my_tile(city2_halt_1[j])
            local way = t.find_object(mo_way)
            t.remove_object(player_x(1), mo_label)
            local tool = command_x(tool_build_station)
            local err = tool.work(player_x(pl), t, sc_station_name)
            t.unmark()
            if (way.is_marked()){
              way.unmark()
            }
          }
        }
        if (pot2==0){
          local t = command_x(tool_build_way)
          local err = t.work(player_x(pl), way1_coords.a, way1_coords.b, sc_way_name)
        }
        if (current_cov>ch2_cov_lim3.a && current_cov<ch2_cov_lim3.b){
          local player = player_x(pl)
          local c_depot = my_tile(city1_road_depot)
          comm_destroy_convoy(pl, c_depot) // Limpia los vehiculos del deposito

          local sched = schedule_x(gl_wt, [])
          local load = veh1_load
          local wait = veh1_wait
          local c_list = city2_halt_1
          local sch_siz = c_list.len()
          for(local j=0;j<sch_siz;j++){
            if (j==sch_siz-1)
              sched.entries.append(schedule_entry_x(my_tile(c_list[j]), load, wait))
            else
              sched.entries.append(schedule_entry_x(my_tile(c_list[j]), 0, 0))
          }
          local c_line = comm_get_line(player, gl_wt, sched)

          local good_nr = 0 //Passengers
          local name = veh1_obj
          local cov_nr = 0  //Max convoys nr in depot
          if (!comm_set_convoy(cov_nr, c_depot, name))
            return 0

          local depot = depot_x(c_depot.x, c_depot.y, c_depot.z)
          local conv = depot.get_convoy_list()
          conv[0].set_line(player, c_line)
          comm_start_convoy(player, conv[0], depot)
        }
        return null
        break

      case 8:
        if (pot0==0){
          local t = command_x(tool_make_stop_public)
          t.work(player_x(pl), my_tile(city1_halt_2[city1_halt_2.len()-1]), "")
        }
        return null
        break
    }
    return null
  }

  function is_tool_active(pl, tool_id, wt) {
    local result = false
    switch (this.step) {
      case 1:
        local t_list = [tool_build_way]
        local wt_list = [gl_wt]
        local res = update_tools(t_list, tool_id, wt_list, wt)
        result = res.result
        if(res.ok)  return result
        break

      case 2:
        local t_list = [tool_build_depot]
        local wt_list = [gl_wt]
        local res = update_tools(t_list, tool_id, wt_list, wt)
        result = res.result
        if(res.ok)  return result
        break

      case 3:
        local t_list = [tool_build_station]
        local wt_list = [gl_wt]
        local res = update_tools(t_list, tool_id, wt_list, wt)
        result = res.result
        if(res.ok)  return result
        break

      case 4: //Schedule
        local t_list = [-tool_remover, -t_icon.road]
        local wt_list = [0]
        local res = update_tools(t_list, tool_id, wt_list, wt)
        result = res.result
        if(res.ok)  return result
        break
      case 5:
        local t_list = [-tool_remover, tool_build_bridge]
        local wt_list = [gl_wt]
        local res = update_tools(t_list, tool_id, wt_list, wt)
        result = res.result
        if(res.ok)  return result
        break

      case 6: //Schedule
        local t_list = [-tool_remover, -t_icon.road]
        local wt_list = [0]
        local res = update_tools(t_list, tool_id, wt_list, wt)
        result = res.result
        if(res.ok)  return result
        break

      case 7:

        local t_list = [tool_build_station, tool_build_way, tool_remove_way]
        local wt_list = [gl_wt]
        local res = update_tools(t_list, tool_id, wt_list, wt)
        result = res.result
        if(res.ok)  return result
        break

      case 8: //Make Stop public
        local t_list = [-tool_remover, -t_icon.road]
        local wt_list = [-1]
        local res = update_tools(t_list, tool_id, wt_list, wt)
        result = res.result
        if(res.ok)  return result
        break
    }
    return result
  }

  function is_tool_allowed(pl, tool_id, wt){
    local result = true
    if(step < 8) {
      local t_list = [-t_icon.tram, -tool_make_stop_public, 0] // 0 = all tools allowed
      local wt_list = [gl_wt]
      local res = update_tools(t_list, tool_id, wt_list, wt)
      result = res.result
      if(res.ok)  return result
      return result
    }
    else {
      local t_list = [-t_icon.tram, 0] // 0 = all tools allowed
      local wt_list = [gl_wt, -1]
      local res = update_tools(t_list, tool_id, wt_list, wt)
      result = res.result
      if(res.ok)  return result
      return result
    }
  }

  function sch_conv_list(pl, coord) {
    local c_dep = this.my_tile(coord)
    local depot = depot_x(c_dep.x, c_dep.y, c_dep.z)
    local cov_list = depot.get_convoy_list()    //Lista de vehiculos en el deposito
    local result = 0
    sch_list=false
    foreach(cov in cov_list) {
      try {
        cov.get_pos()
      }
      catch(ev) {
        continue
      }
      local sch = null
      local line = cov.get_line()
      if (line)
        sch = line.get_schedule()

      else
        sch = cov.get_schedule()

      if (sch){
        if (is_schedule_allowed(pl, sch)==null)
          sch_list=true
      }
    }
    return result
  }
}

// END OF FILE
