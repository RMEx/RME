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

      # ------------------------------------------------------------------------
      # * Returns a new virtual zone which is circular.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :create_circle_area,
                        :description => 'Area.create_circle_area',
                        :parameters  => [
                          X,
                          Y,
                          {:name        => :radius,
                           :description => 'Area.create_circle_area.radius',
                           :type        => ParameterType::StrictlyPositiveInteger}
                        ]}) do |x, y, radius|
        ::Area::Circle.new(x, y, radius)
      end

      # ------------------------------------------------------------------------
      # * Returns a new virtual zone which is ellipsoidal.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :create_ellipse_area,
                        :description => 'Area.create_ellipse_area',
                        :parameters  => [
                          X,
                          Y,
                          WIDTH,
                          HEIGHT
                        ]}) do |x, y, width, height|
        ::Area::Ellipse.new(x, y, width, height)
      end

      POINT_TYPE = ParameterType::List::of_exactly(ParameterType::Coordinate, 2)
      # ------------------------------------------------------------------------
      # * Returns a new virtual zone which corresponds to the polygon,
      #   formed by the given points.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :create_polygon_area,
                        :description => 'Area.create_polygon_area',
                        :parameters  => [
                          {:name        => :points,
                           :description => 'Area.create_polygon_area.points',
                           :type        => ParameterType::List::of_at_least(POINT_TYPE, 3)},
                        ]}) do |points|
        ::Area::Polygon.new(points)
      end

      # TODO
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
