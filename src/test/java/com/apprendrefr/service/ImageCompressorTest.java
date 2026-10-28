package com.apprendrefr.service;

import com.apprendrefr.exception.FileUploadException;
import org.junit.jupiter.api.Test;

import java.awt.image.BufferedImage;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

class ImageCompressorTest {

    private final ImageCompressor compressor = new ImageCompressor();

    @Test
    void bigOpaquePhotoBecomesAnSmallJpegOf800Pixels() {
        byte[] original = TestImages.png(1600, 1200, false);

        ImageCompressor.Result result = compressor.compress(original);

        assertEquals(".jpg", result.extension());
        BufferedImage out = TestImages.decode(result.bytes());
        assertEquals(800, out.getWidth());
        assertEquals(600, out.getHeight(), "les proportions sont gardées");
        assertTrue(result.bytes().length < original.length / 3,
                "le JPEG doit être bien plus léger : " + result.bytes().length + " contre " + original.length);
    }

    @Test
    void smallImageIsNeverEnlarged() {
        ImageCompressor.Result result = compressor.compress(TestImages.png(300, 200, false));

        BufferedImage out = TestImages.decode(result.bytes());
        assertEquals(300, out.getWidth());
        assertEquals(200, out.getHeight());
    }

    @Test
    void transparentImageStaysPngAndKeepsItsTransparency() {
        ImageCompressor.Result result = compressor.compress(TestImages.png(400, 300, true));

        assertEquals(".png", result.extension());
        BufferedImage out = TestImages.decode(result.bytes());
        assertEquals(0, out.getRGB(10, 10) >>> 24, "le côté gauche reste transparent");
        assertEquals(255, out.getRGB(390, 10) >>> 24);
    }

    @Test
    void jpegUploadIsRecompressedToo() {
        byte[] jpeg = TestImages.encode(TestImages.decode(TestImages.png(1200, 900, false)), "jpg");

        ImageCompressor.Result result = compressor.compress(jpeg);

        assertEquals(".jpg", result.extension());
        assertEquals(800, TestImages.decode(result.bytes()).getWidth());
    }

    @Test
    void fileThatIsNotAnImageIsRefused() {
        assertThrows(FileUploadException.class, () -> compressor.compress(new byte[]{1, 2, 3, 4}));
        assertThrows(FileUploadException.class,
                () -> compressor.compress("<html><script>alert(1)</script></html>".getBytes()));
    }

    @Test
    void imageWithTooManyPixelsIsRefused() {
        ImageCompressor small = new ImageCompressor(800, 0.82f, 50_000);

        // 300 x 200 = 60 000 pixels > 50 000
        assertThrows(FileUploadException.class, () -> small.compress(TestImages.png(300, 200, false)));
    }
}
