/**
 *   @file class_basic_coords.nut
 *   @brief sets the pakset specific map coords
 *
 *
 *
 */

/**
 *  set limit for build
 *
 *
 */
city1_limit1          <- {a = coord(109,181), b = coord(128,193)}
city2_limit1          <- {a = coord(120,150), b = coord(138,159)}

bridge1_limit         <- {a = coord(119,193), b = coord(128,201)}
c_bridge1_limit1      <- {a = coord(126,192), b = coord(126,196)}
change1_city1_limit1  <- {a = coord(120,193), b = coord(127,193)}

c_dock1_limit         <- {a = coord(128,181), b = coord(135,193)}
change2_city1_limit1  <- {a = coord(128,182), b = coord(128,192)}

c_way_limit1          <- {a = coord(127,159), b = coord(133,187)}

/**
 *  set tiles for buildings
 *
 *  mon
 *  cur
 *  tow
 */
city1_mon <- coord(119,183)
city1_cur <- coord(116,188)

city1_tow <- coord(111,184)
city2_tow <- coord(129,154)
city3_tow <- coord(52,194)
city4_tow <- coord(115,268)
city5_tow <- coord(124,326)
city6_tow <- coord(125,378)
city7_tow <- coord(163,498)

/**
 *  set tiles for factory
 *
 *  coord_fac_1 - ch1, ch4
 *
 *
 */
coord_fac_1 <- coord(123,160) // Timber plantation
coord_fac_2 <- coord(93,153)  // Saw mill
coord_fac_3 <- coord(110,190) // Construction Wholesaler
coord_fac_4 <- coord(168,189) // Oil rig
coord_fac_5 <- coord(149,200) // Oil refinery
coord_fac_6 <- coord(112,192) // Gas station
coord_fac_7 <- coord(131,235) // Coal mine
coord_fac_8 <- coord(130,207) // Coal power station

/**
 *  set tiles for stations
 *
 *  coord_st_1 - city 1
 *
 *
 */
coord_st_1 <- coord(117,197)

/**
 *  set halt coords city
 *
 *  used in chapter: 2
 *    city1_halt_1 - halts city 1
 *    city1_halt_2 - halts connect city 1 dock and station
 *    city2_halt_1 - halts connect city 2 to city 1
 *    line_connect_halt - halt in all halt lists
 *
 *  used chapter 5
 *    city1_post_halts - halts for post
 *
 *  used chapter 6
 *    city1_city7_air
 *    city1_halt_airport
 *    city7_halt
 *
 *  used chapter 7
 *    ch7_rail_stations
 *
 *
 */
city1_halt_1 <- []
city1_halt_2 <- []
city2_halt_1 <- []

line_connect_halt <- coord(126,187)

city1_halt_airport <- [coord(114,177), coord(121,189), line_connect_halt]
//local list = [coord(113,183), coord(117,186),  coord(120,183), line_connect_halt, coord(121,189), coord(113,190)]
local list = [coord(111,183), coord(116,183),  coord(120,183), line_connect_halt, coord(121,189), coord(118,191), coord(113,190)]
for ( local i = 0; i < list.len(); i++ ) {
  city1_halt_1.append(list[i])
}
list.clear()
// first coord add city1_post_halts
list = [coord(132,189), line_connect_halt, coord(126,198), coord(120,196)]
for ( local i = 0; i < list.len(); i++ ) {
  city1_halt_2.append(list[i])
}
list.clear()
list = [line_connect_halt, coord(121,155), coord(127,155), coord(132,155), coord(135,153)]
for ( local i = 0; i < list.len(); i++ ) {
  city2_halt_1.append(list[i])
}

city1_post_halts <- []
for ( local i = 0; i < city1_halt_1.len(); i++ ) {
  city1_post_halts.append(city1_halt_1[i])
  if ( i == 3 ) {
    city1_post_halts.append(city1_halt_2[0])
  }
}

city1_city7_air <- [coord(114,176), coord(168,489)]
city7_halt <- [ coord(168,490), coord(160,493), coord(155,493), coord(150,494), coord(154,500), coord(159,499),
          coord(164,498), coord(166,503), coord(171,501), coord(176,501), coord(173,493)]

ch7_rail_stations <- [tile_x(57,198,11), tile_x(120,267,3), tile_x(120,327,5), tile_x(120,381,9)]

/**
 *  define depots
 *
 *  road depot must be located one field next to a road
 */
city1_road_depot  <- coord(124,188) //115,185
ship_depot        <- coord(150, 190)
road_depot_ch5    <- coord(131,232)

/**
 *  rail_depot{depot_tile, way_tile}
 */
ch3_rail_depot1 <- {b = coord(121,164), a = coord(121,163)}
ch3_rail_depot2 <- {b = coord(94,160), a = coord(93,160)}

/**
 *  define bridges
 *
 *  bridge1_coords  = road bridge city 1
 *  bridge2_coors   = rail bridge fac_1 -> fac_2
 *  bridge3_coors   = rail bridge city 1 -> city 3
 *
 */
bridge1_coords <- {a = coord3d(126,193,-1), b = coord3d(126,195,-1), dir = 3}
bridge2_coords <- {a = coord3d(106,158,-1), b = coord3d(103,158,-1)}
bridge3_coords <- {a = coord3d(93,198,5), b = coord3d(91,198,5)}

/**
 *  define ways
 *
 *  way1_coords = road city 1 -> city 2
 *
 *  way2_fac1_fac2  = rail factory 1 -> factory 2
 *
 *  way2_fac2_fac3  = rail factory 2 -> factory 3
 *
 *
 */
way1_coords <- {a = coord3d(130,160,0), b = coord3d(130,185,0), dir = 3}

// start - 5 tiles after start - bridge tile - bridge tile - 5 tiles before the end - end
way2_fac1_fac2 <- [coord3d(125,163,0), coord3d(120,163,0), coord3d(107,158,0), coord3d(102,158,0), coord3d(96,155,1), coord3d(96,151,1)]
limit_ch3_rail_line_1a  <- {a = coord(105, 153), b = coord(122, 166)}
limit_ch3_rail_line_1b  <- {a = coord(95, 154), b = coord(103, 160)}

// start - 5 tiles after start - tunnel tile - tunnel tile - 5 tiles before the end - end
way2_fac2_fac3 <- [coord3d(94,155,2), coord3d(94,160,2), coord3d(96,172,3), coord3d(104,172,3), coord3d(109,184,2), coord3d(109,189,2)]
limit_ch3_rail_line_2a  <- {a = coord(91,159), b = coord(97,174)}
limit_ch3_rail_line_2b  <- {a = coord(102, 171), b = coord(110, 187)}

/**
 *  chapter 5
 *
 *  id    = step
 *  sid   = sub step
 *  hlist = halt list
 *
 */

/**
 *  set tiles for pos chapter start
 *
 *
 */
coord_chapter_1 <- city1_mon              // city1_mon
coord_chapter_2 <- city1_road_depot       // city1_road_depot
coord_chapter_3 <- coord_fac_2            // Saw mill
coord_chapter_4 <- ship_depot             // ship_depot
coord_chapter_5 <- coord_fac_8            // Coal power station
coord_chapter_6 <- city1_halt_airport[0]  // airport road stop
coord_chapter_7 <- city3_tow              // city 3 townhall
