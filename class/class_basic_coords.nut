/**
 *   @file class_basic_coords.nut
 *   @brief sets the pakset specific map coords
 *
 *
 *
 */

/**
 *  set tiles chapter 1 for inspections tool
 * 
 *  0 - mon
 *  1 - cur
 *  2 - tow
 */


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

  switch (pak_name) {
    case "pak64":
      local list = [coord(111,183), coord(116,183),  coord(120,183), coord(126,187), coord(121,189), coord(118,191), coord(113,190)]
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
      break
    case "pak64.german":
      local list = [coord(111,183), coord(116,183),  coord(120,183), coord(126,187), coord(121,189), coord(118,191), coord(113,190)]
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
      break
    case "pak128":
      local list = [coord(111,183), coord(116,183),  coord(120,183), coord(126,187), coord(121,189), coord(118,191), coord(113,190)]
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
      break
    default:

  }


/**
 *  chapter 5
 *
 *  id    = step
 *  sid   = sub step
 *  hlist = halt list
 *
 */