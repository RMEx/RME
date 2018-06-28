# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Commands which manages the camera (map's scrolling for instance)
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Camera

      # Common parameters' declaration
      DISTANCE = {:name        => :distance,
                  :type        => ParameterType::PositiveInteger,
                  :description => 'Camera.distance'}
      X = {:name        => :x,
           :type        => ParameterType::PositiveInteger,
           :description => 'Camera.x'}
      Y = {:name        => :y,
           :type        => ParameterType::PositiveInteger,
           :description => 'Camera.y'}
      NB_STEPS = {:name        => :nb_steps,
                  :type        => ParameterType::StrictlyPositiveInteger,
                  :description => 'Camera.nb_steps'}
      EASING = {:name        => :easing,
                :type        => ParameterType::EasingFunction,
                :description => 'Camera.easing',
                :default     => :InLinear}
      POSITION = {:name        => :position,
                  :type        => ParameterType::PositionRegardingCamera,
                  :description => 'Camera.position_regarding_camera',
                  :default     => :centered}

      # Internal methods
      CENTER_X = (Graphics.width / 32 - 1) / 2.0
      CENTER_Y = (Graphics.height / 32 - 1) / 2.0

      EVENT_POSITION = {
        :centered        => lambda { |x, y| [center_x(x), center_y(y)] },
        :centered_left   => lambda { |x, y| [left_x(x), center_y(y)] },
        :centered_right  => lambda { |x, y| [right_x(x), center_y(y)] },
        :centered_top    => lambda { |x, y| [center_x(x), top_y(y)] },
        :centered_bottom => lambda { |x, y| [center_x(x), bottom_y(y)] },
        :top_left        => lambda { |x, y| [left_x(x), top_y(y)] },
        :top_right       => lambda { |x, y| [right_x(x), top_y(y)] },
        :bottom_left     => lambda { |x, y| [left_x(x), bottom_y(y)] },
        :bottom_right    => lambda { |x, y| [right_x(x), bottom_y(y)] }
      }

      def self.limit(x, min, max)
        min if (x < min)
        max if (x > max)
        x
      end

      def self.left_x(x);   limit(x,                0, $game_map.width); end
      def self.center_x(x); limit(x - CENTER_X,     0, $game_map.width); end
      def self.right_x(x);  limit(x - 2 * CENTER_X, 0, $game_map.width); end

      def self.top_y(y);    limit(y,                0, $game_map.height); end
      def self.center_y(y); limit(y - CENTER_Y,     0, $game_map.height); end
      def self.bottom_y(y); limit(y - 2 * CENTER_Y, 0, $game_map.height); end

      private_class_method :left_x, :center_x, :right_x,
                           :top_y, :center_y, :bottom_y,
                           :limit

      # ------------------------------------------------------------------------
      # * Tells whether the camera is currently scrolling (`true`);
      #   or not (`false`)
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :camera_scrolling?,
                        :description => 'Camera.camera_scrolling?'}) do
        $game_map.scrolling? || $game_map.scrolling_activate
      end

      # ------------------------------------------------------------------------
      # * Scrolls the camera in the given `direction`.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :camera_scroll,
                        :description => 'Camera.camera_scroll',
                        :parameters  => [
                          {:name        => :direction,
                           :type        => ParameterType::Direction,
                           :description => 'Camera.camera_scroll.direction'},
                          DISTANCE,
                          {:name        => :speed,
                           :type        => ParameterType::PositiveFloat,
                           :description => 'Camera.camera_scroll.speed'}
                        ]}) do |direction, distance, speed|
        Fiber.yield while $game_map.scrolling?
        $game_map.start_scroll(direction, distance, speed)
      end

      # ------------------------------------------------------------------------
      # * Scrolls the camera towards the given coordinates.
      #   (The trajectory between its origin point and target one is computed
      #    using a linear interpolation)
      # ------------------------------------------------------------------------
      Command::declare({:section => self,
                        :name => :camera_scroll_towards,
                        :description => 'Camera.camera_scroll_towards',
                        :parameters => [
                          X,
                          Y,
                          NB_STEPS,
                          EASING,
                          POSITION
                        ]}) do |x, y, nb_steps, easing, position|
        Fiber.yield while $game_map.scrolling?
        $game_map.start_scroll_towards(*EVENT_POSITION[position].call(x, y),
                                       nb_steps,
                                       Easing::FUNCTIONS[easing])
      end

      # ------------------------------------------------------------------------
      # * Scrolls the camera towards the given event.
      #   (The trajectory between its origin point and target one is computed
      #    using a linear interpolation)
      # ------------------------------------------------------------------------
      Command::declare({:section => self,
                        :name => :camera_scroll_towards_event,
                        :description => 'Camera.camera_scroll_towards_event',
                        :parameters => [
                          {:name        => :id,
                           :type        => ParameterType::EventId,
                           :description => 'Camera.camera_scroll_towards_event.id'},
                          NB_STEPS,
                          EASING,
                          POSITION
                        ]}) do |id, nb_steps, easing, position|
        camera_scroll_towards(event_x(id), event_y(id), nb_steps, easing, position)
      end

      # ------------------------------------------------------------------------
      # * Scrolls the camera towards the player's event.
      #   (The trajectory between its origin point and target one is computed
      #    using a linear interpolation)
      # ------------------------------------------------------------------------
      Command::declare({:section => self,
                        :name => :camera_scroll_towards_player,
                        :description => 'Camera.camera_scroll_towards_player',
                        :parameters => [
                          NB_STEPS,
                          EASING,
                          POSITION
                        ]}) do |nb_steps, easing, position|
        camera_scroll_towards(player_x, player_y, nb_steps, easing, position)
      end

      # TODO
      # - `camera_move_on`
      # - `camera_scroll_on`
      # - `camera_lock`
      # - `camera_unlock`
      # - `camera_locked?`
      # - `camera_lock_x`
      # - `camera_unlock_x`
      # - `camera_x_locked?`
      # - `camera_lock_y`
      # - `camera_unlock_y`
      # - `camera_y_locked?`
      # - `camera_change_focus`
      # - `camera_zoom`
      # - `camera_motion_blur`

      append_commands
    end
  end
end
