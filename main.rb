require "./raylib"
include Raylib

SCREEN_WIDTH = 128
SCREEN_HEIGHT = 128

scale = 3

window(SCREEN_WIDTH*scale, SCREEN_HEIGHT*scale, "Sprite Test") do
  set_target_fps(30)

  sprite = load_texture("resources/sprite.png")
  x = 0
  xa = 0

  target = load_render_texture(SCREEN_WIDTH, SCREEN_HEIGHT)
  # set_texture_filter(target.texture, FILTER_BILINEAR)

  until window_should_close
    # Update
    x += 1
    x = 0 if x > 200

    xa += 1

    # Draw
    draw do
			clear_background(BLACK)
			
      texture_mode(target) do
        clear_background(RAYWHITE)

        draw_text("Sprite Animation", 10, 10, 14, LIGHTGRAY)
        # draw_texture(sprite, 15, 40, WHITE)
        draw_texture_rec(sprite, Rectangle.init(16 * 2, 16 * ((xa / 15).to_i % 2 + 1), 16, 16), Vector2.init(x, 48), WHITE)
        draw_texture_rec(sprite, Rectangle.init(16 * 5, 16 * ((xa / 15).to_i % 2 + 1), 16, 16), Vector2.init(x - 24, 48 + 32), WHITE)
        draw_texture_rec(sprite, Rectangle.init(16 * 5, 16 * (3 + ((xa / 15).to_i % 2 + 1)), 16, 16), Vector2.init(x - 48, 48 + 32 + 32), WHITE)
      end

      draw_texture_pro(
        target.texture,
        Rectangle.init(
          0.0,
          0.0,
          target.texture.width,
          -target.texture.height
        ),
        Rectangle.init(
          (get_screen_width() - SCREEN_WIDTH * scale) * 0.5,
          (get_screen_height() - SCREEN_HEIGHT * scale) * 0.5,
          SCREEN_WIDTH * scale,
          SCREEN_HEIGHT * scale
        ),
        Vector2.init(0, 0),
        0.0,
        WHITE
      )
    end
  end
end
