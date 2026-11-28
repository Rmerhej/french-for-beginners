package com.apprendrefr.service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class PronunciationHighlighterTest {

    private final PronunciationHighlighter highlighter = new PronunciationHighlighter();

    private static String b(String letters) {
        return "<strong class=\"son-lettres\">" + letters + "</strong>";
    }

    @Test
    void highlightsTheLettersOfTheSound() {
        assertEquals("dr" + b("ô") + "le, c" + b("ô") + "té", highlighter.highlight("ô", "drôle, côté"));
        assertEquals("f" + b("euil") + "le, " + b("euil") + "", highlighter.highlight("euil ; ueil", "feuille, euil"));
    }

    @Test
    void severalLettersAndLongestFirst() {
        assertEquals(b("é") + "t" + b("é") + ", chant" + b("er") + ", vous parl" + b("ez"),
                highlighter.highlight("é ; er ; ez", "été, chanter, vous parlez"));
        assertEquals("t / t" + b("ou") + "t, r" + b("u") + "e / r" + b("ou") + "e",
                highlighter.highlight("u ≠ ou", "t / tout, rue / roue"));
    }

    @Test
    void onlyWhatPrecedesAPlusSignIsHighlighted() {
        assertEquals(b("c") + "elui, " + b("c") + "inq, " + b("c") + "iel", highlighter.highlight("c + e / i / y", "celui, cinq, ciel"));
        assertEquals("na" + b("ti") + "on", highlighter.highlight("ti + Voyelle (a , e , i , o , u , y)", "nation"));
        assertEquals("poi" + b("ss") + "on, de" + b("ss") + "ert, maison",
                highlighter.highlight("s entre deux voyelles = [z] ; ss = [s]", "poisson, dessert, maison"));
    }

    @Test
    void parenthesesAreIgnored() {
        assertEquals(b("r") + "ue, me" + b("r") + "ci", highlighter.highlight("r (le « r » français)", "rue, merci"));
    }

    @Test
    void caseIsIgnored() {
        assertEquals(b("É") + "t" + b("é"), highlighter.highlight("é", "Été"));
    }

    @Test
    void explanationsInTheTitleHighlightNothing() {
        assertEquals("petite, samedi", highlighter.highlight("e muet (e non prononcé)", "petite, samedi"));
        assertEquals("mot-sans-audio", highlighter.highlight("zz-test-sans-audio", "mot-sans-audio"));
    }

    @Test
    void textIsEscaped() {
        assertEquals("&lt;script&gt;" + b("a") + "lert(1)&lt;/script&gt;", highlighter.highlight("a", "<script>alert(1)</script>"));
        assertEquals("&lt;b&gt;", highlighter.highlight(null, "<b>"));
        assertEquals("", highlighter.highlight("a", null));
    }
}
