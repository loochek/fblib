from PIL import Image
img = Image.open("default_font.png")
res = Image.new(mode = "RGBA", size = (1710, 24))
cnt = 0
for j in range(6):
    for i in range(16):
        x_offs = 18 * i
        y_offs = 24 * j
        let = img.crop((x_offs, y_offs, x_offs + 18, y_offs + 24))
        res.paste(let, (cnt * 18, 0))
        cnt += 1
res.save("default_font_image.png")