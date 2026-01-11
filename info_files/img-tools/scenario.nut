
map.file = "<attach>"

scenario.short_description = ""
scenario.author = ""
scenario.version = "0.1"
map_siz <- world.get_size()

function get_rule_text(pl)
{
  return ttext("")
}

function get_goal_text(pl)
{
  return ttextfile("")
}

function get_result_text(pl)
{
  local text = ttext("")

  return text.tostring()
}


function start()
{
  //my_compass()
}


function is_scenario_completed(pl)
{

  return 0
}

function get_info_text(pl)
{


  local tx = ""
  local siz = 101
  for(local j=0; j<siz ; j++){

      tx +=  "<img src=\"#g"+j+"\"></img> g"+j+" <img src=\"#d"+j+"\"></img> d"+j+" <img src=\"#s"+j+"\"></img> s"+j+" <img src=\"#t"+j+"\"></img> t"+j+"<br>"
  }
  return tx

}


function my_tile(coord)
{
  return square_x(coord.x,coord.y).get_ground_tile()
  //return square_x(coord.x,coord.y).get_tile_at_height(coord.z)
}



