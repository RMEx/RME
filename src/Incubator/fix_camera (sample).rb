# Wip Joke
# Issue:  https://github.com/RMEx/RME/issues/276

=begin #sample of patch
module RMECommands::Camera

  alias_method :camera_moving?, :camera_scrolling?

  def camera_move_on(x, y)
    "well I have to sleep for now"
  end

end
=end #sample of patch