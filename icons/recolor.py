import os
from PIL import Image

# Loop over all PNG files in the current folder
for filename in os.listdir("base"):
    if filename.lower().endswith(".png"):
        print(f"Processing: {filename}")

        img = Image.open(f"base/{filename}").convert("RGBA")
        data = img.getdata()

        for color, path in (((255, 255, 255), "white"), ((128, 128, 128), "grey")):
            new_data = []
            for pixel in data:
                r, g, b, a = pixel
                # Replace RGB, preserve alpha
                new_data.append((*color, a))

            img.putdata(new_data)

            # Save to new file
            name, ext = os.path.splitext(filename)
            img.save(f"{path}/{name}.png")
