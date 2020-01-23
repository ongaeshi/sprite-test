require "./raylib"
include Raylib

SCREEN_WIDTH = 320
SCREEN_HEIGHT = 320

window(SCREEN_WIDTH, SCREEN_HEIGHT, "fude") do
	set_target_fps(60)

	sprite = load_texture("resources/sprite.png")
	x = 0
	xa = 0

	until window_should_close do
		# Update
		x += 1
		x = 0 if x > 300

		xa += 1

		# Draw
		draw do
			clear_background(Color.init(77, 253, 252, 255))
			# draw_texture(sprite, 15, 40, WHITE)
			draw_texture_rec(sprite, Rectangle.init(16 * 2, 16 * ((xa / 20).to_i % 2 + 1), 16, 16), Vector2.init(x, 40), WHITE)
			# draw_text("Hello, World!", 190, 200, 20, LIGHTGRAY);
		end
	end
end
