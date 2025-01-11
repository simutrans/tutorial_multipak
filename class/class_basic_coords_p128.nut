/**
 *   @file class_basic_coords.nut
 *   @brief sets the pakset specific map coords
 *
 *
 *
 */

/**
 *  set tiles for pos chapter start
 *
 *
 */
coord_chapter_1 <- coord(113,189)
coord_chapter_2 <- coord(115,185)

/**
 *  set limit for build
 *
 *
 */
city1_limit1          <- {a = coord(109,181), b = coord(128,193)}
city2_limit1          <- {a = coord(120,150), b = coord(138,159)}

bridge1_limit         <- {a = coord(119,193), b = coord(128,201)}
c_bridge1_limit1      <- {a = coord(126,191), b = coord(126,195)}
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
city1_mon <- coord(113,189)
city1_cur <- coord(113,185)

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
coord_fac_1 <- coord(149,200)

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
 */
city1_halt_1 <- []
city1_halt_2 <- []
city2_halt_1 <- []

line_connect_halt <- coord(126,187)

local list = [coord(111,183), coord(116,183),  coord(120,183), coord(126,187), coord(121,189), coord(118,191), coord(113,190)]
for ( local i = 0; i < list.len(); i++ ) {
  city1_halt_1.append(list[i])
}
list.clear()
// first coord add city1_post_halts
list = [coord(132,189), coord(126,187), coord(121,189), coord(126,198), coord(120,196)]
for ( local i = 0; i < list.len(); i++ ) {
  city1_halt_2.append(list[i])
}
list.clear()
list = [coord(126,187), coord(121,155), coord(127,155), coord(132,155), coord(135,153)]
for ( local i = 0; i < list.len(); i++ ) {
  city2_halt_1.append(list[i])
}

city1_post_halts <- city1_halt_1
city1_post_halts.insert(4, city1_halt_2[0])

/**
 *  define road depot city 1
 */
city1_road_depot <- coord(115,185)

/**
 *  define bridges
 *
 *
 */
bridge1_coords <- {a = coord3d(126,192,-1), b = coord3d(126,194,-1), dir = 3}

/**
 *  define ways
 *
 *
 */
way1_coords <- {a = coord3d(130,160,0), b = coord3d(130,185,0), dir = 3}


/**
 *  chapter 5
 *
 *  id    = step
 *  sid   = sub step
 *  hlist = halt list
 *
 */
