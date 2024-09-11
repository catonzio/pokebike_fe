import argparse
import os

from PIL import Image


def create_parser() -> argparse.ArgumentParser:
    # Create the argument parser
    parser = argparse.ArgumentParser(
        description="Process an image with optional scaling and saving path."
    )

    # Mandatory positional argument for image path
    parser.add_argument("image_path", type=str, help="Path to the image file")

    # Optional argument for scaling ratio, with a default value of 0.5
    parser.add_argument(
        "--scaling_ratio",
        type=float,
        default=0.5,
        help="Scaling ratio for resizing the image (default: 0.5)",
    )

    # Optional argument for saving path
    parser.add_argument(
        "--saving_path",
        type=str,
        default=None,
        help="Path to save the scaled image. Defaults to image_path with '_scaled' added before the extension.",
    )

    return parser


def parse_args() -> tuple[str, float, str]:
    parser: argparse.ArgumentParser = create_parser()

    # Parse the arguments
    args = parser.parse_args()

    # If saving_path is not provided, construct it by adding '_scaled' before the file extension
    if args.saving_path is None:
        # Split the image path into the base name and extension
        base, ext = os.path.splitext(args.image_path)
        # Construct the new saving path
        args.saving_path = f"{base}_scaled{ext}"

    # Access the arguments
    image_path = args.image_path
    scaling_ratio = args.scaling_ratio
    saving_path = args.saving_path

    return image_path, scaling_ratio, saving_path


def get_image_size(image_path):
    # Get the file size in bytes using os.path.getsize
    size_bytes = os.path.getsize(image_path)

    # Convert bytes to KB, MB, GB, etc.
    def convert_size(size):
        for unit in ["B", "KB", "MB", "GB", "TB"]:
            if size < 1024:
                return f"{size:.2f} {unit}"
            size /= 1024

    # Open the image to verify it's a valid image file
    with Image.open(image_path) as img:
        img.verify()  # This ensures the image is not corrupted

    return convert_size(size_bytes)


def scale_image(image_path: str, scaling_ratio: float, saving_path: str) -> bool:
    try:
        print(f"Scaling {image_path}...", end=" ", flush=True)
        foo = Image.open(image_path)
        w, h = foo.size

        scaled_dimensions = int(w * scaling_ratio), int(h * scaling_ratio)
        foo = foo.resize(scaled_dimensions, Image.LANCZOS)

        foo.save(saving_path, optimize=True)

        return True
    except Exception as e:
        print(f"Error! {e}")
        return False


def main():
    arguments = parse_args()
    success: bool = scale_image(*arguments)

    if success:
        print(f"Done! Saved to {arguments[2]}")
        from_size: str = get_image_size(arguments[0])
        to_size: str = get_image_size(arguments[2])
        print(f"Reduced size from {from_size} to {to_size}")


if __name__ == "__main__":
    main()
