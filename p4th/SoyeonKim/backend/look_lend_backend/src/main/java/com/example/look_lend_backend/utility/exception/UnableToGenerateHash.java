package com.example.look_lend_backend.utility.exception;

public class UnableToGenerateHash extends RuntimeException {

    public UnableToGenerateHash(String message) {
        super(message);
    }

    public UnableToGenerateHash(String message, Throwable cause) {
        super(message, cause);
    }
}
