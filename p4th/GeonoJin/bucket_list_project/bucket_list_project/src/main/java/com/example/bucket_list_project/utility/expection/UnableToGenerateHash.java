package com.example.bucket_list_project.utility.expection;

public class UnableToGenerateHash extends RuntimeException {

    public UnableToGenerateHash(String message) {
        super(message);
    }

    public UnableToGenerateHash(String message, Throwable cause) {
        super(message, cause);
    }
}
