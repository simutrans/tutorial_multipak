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

/**
 *  set limit for build
 *
 *
 */
city1_limit1 <- {a = coord(109,181), b = coord(128,193)}
city2_limit1 <- {a = coord(120,150), b = coord(138,159)}

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
 *  city1_halt_1 - used in chapter: 2, 5
 *  city1_halt_2 - used in chapter: 2
 *  city2_halt_1 - used in chapter: 2
 */
city1_halt_1 <- []
city1_halt_2 <- []
city2_halt_1 <- []

local list = [coord(113,183), coord(117,186),  coord(120,183), coord(126,187), coord(121,189), coord(113,190)]
for ( local i = 0; i < list.len(); i++ ) {
  city1_halt_1.append(list[i])
}
list.clear()
list = [coord(132,189), coord(126,187), coord(121,189), coord(126,198), coord(120,196)]
for ( local i = 0; i < list.len(); i++ ) {
  city1_halt_2.append(list[i])
}
list.clear()
list = [coord(126,187), coord(121,155), coord(127,155), coord(132,155), coord(135,153)]
for ( local i = 0; i < list.len(); i++ ) {
  city2_halt_1.append(list[i])
}

/**
 *  define road depot city 1
 */
city1_road_depot <- coord(124,188) //115,185


/**
 *  chapter 5
 *
 *  id    = step
 *  sid   = sub step
 *  hlist = halt list
 *
 */
