# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Commands to declare and manage virtual areas.
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Area

      # Common parameters' declaration
      X = {:name        => :x,
           :type        => ParameterType::Coordinate,
           :description => 'Area.x'}
      Y = {:name        => :y,
           :type        => ParameterType::Coordinate,
           :description => 'Area.y'}
      WIDTH = {:name        => :width,
               :type        => ParameterType::StrictlyPositiveInteger,
               :description => 'Area.width'}
      HEIGHT = {:name        => :height,
                :type        => ParameterType::StrictlyPositiveInteger,
                :description => 'Area.height'}

      # ------------------------------------------------------------------------
      # * Returns a new virtual zone which is rectangular.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :create_rect_area,
                        :description => 'Area.create_rect_area',
                        :parameters  => [
                          X,
                          Y,
                          WIDTH,
                          HEIGHT
                        ]}) do |x, y, width, height|
        ::Area::Rect.new(x, y, width, height)
      end

      # TODO
      # - `create_circle_area`
      # - `create_ellipse_area`
      # - `create_polygon_area`
      # - `in_area?`
      # - `mouse_hover_area?`
      # - `mouse_hover_square_area?`
      # - `mouse_click_area?`
      # - `mouse_click_square_area?`
      # - `mouse_trigger_area?`
      # - `mouse_trigger_square_area?`
      # - `mouse_press_area?`
      # - `mouse_press_square_area?`
      # - `mouse_release_area?`
      # - `mouse_release_square_area?`
      # - `mouse_repeat_area?`
      # - `mouse_repeat_square_area?`

      append_commands
    end
  end
end
