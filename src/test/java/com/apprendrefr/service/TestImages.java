package com.apprendrefr.service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.Random;

/** Fabrique de vraies images (octets) pour les tests. */
final class TestImages {

    private TestImages() {
    }

    /** Image PNG avec des couleurs variées (donc lourde en PNG, comme une photo). */
    static byte[] png(int width, int height, boolean transparent) {
        BufferedImage image = new BufferedImage(width, height,
                transparent ? BufferedImage.TYPE_INT_ARGB : BufferedImage.TYPE_INT_RGB);
        Random random = new Random(42);
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                int r = (x * 255 / width + random.nextInt(40)) & 0xFF;
                int g = (y * 255 / height + random.nextInt(40)) & 0xFF;
                int b = random.nextInt(256);
                int alpha = transparent && x < width / 2 ? 0 : 255;
                image.setRGB(x, y, (alpha << 24) | (r << 16) | (g << 8) | b);
            }
        }
        return encode(image, "png");
    }

    static byte[] encode(BufferedImage image, String format) {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            ImageIO.write(image, format, out);
            return out.toByteArray();
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    static BufferedImage decode(byte[] data) {
        try {
            return ImageIO.read(new java.io.ByteArrayInputStream(data));
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }
}
