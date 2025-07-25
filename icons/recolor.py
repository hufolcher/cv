import os
from PIL import Image

# --- Configuration ---
SOURCE_DIR = "base"
OUTPUTS = [
    ((255, 255, 255), "white"),  # white color output
    ((128, 128, 128), "grey"),  # grey color output
]


def recolor_image(image, color):
    """Return a new image with all pixels recolored to the given RGB, keeping alpha."""
    return [(*color, a) for (*_, a) in image.getdata()]


def main():
    print("Starting icon recoloring...\n")

    # Ensure output directories exist
    for _, folder in OUTPUTS:
        os.makedirs(folder, exist_ok=True)

    # Process each .png file in the source directory
    for filename in os.listdir(SOURCE_DIR):
        if not filename.lower().endswith(".png"):
            continue

        print(f"Processing: {filename}")
        input_path = os.path.join(SOURCE_DIR, filename)
        base_name, _ = os.path.splitext(filename)

        # Load image and convert to RGBA
        with Image.open(input_path).convert("RGBA") as img:
            for rgb, folder in OUTPUTS:
                img.putdata(recolor_image(img, rgb))
                output_path = os.path.join(folder, f"{base_name}.png")
                img.save(output_path)
                print(f" - {folder} done.")

    print("\n✅ All done! Icons have been recolored and saved.")


if __name__ == "__main__":
    main()
