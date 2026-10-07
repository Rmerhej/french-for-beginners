package com.apprendrefr.exception;

public class BusinessException extends RuntimeException {

    public BusinessException(String message) {
        super(message);
    }

    // ← Ajoute ce constructeur
    public BusinessException(String message, Throwable cause) {
        super(message, cause);
    }
}