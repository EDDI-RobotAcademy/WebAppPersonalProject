package personal_project.look_style.utility.exception;

public class UnableToGenerateHash extends RuntimeException{

    public UnableToGenerateHash(String message) {
        super(message);
    }

    public UnableToGenerateHash(String message, Throwable cause) {
        super(message, cause);
    }
}
