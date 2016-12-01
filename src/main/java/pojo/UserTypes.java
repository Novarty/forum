package pojo;

public enum UserTypes {
    ADMIN("ADMIN"),
    MEMBER("MEMBER"),
    MODERATOR("MODERATOR");


    private final String text;

    /**
     * @param text
     */
    private UserTypes(final String text) {
        this.text = text;
    }

    /* (non-Javadoc)
     * @see java.lang.Enum#toString()
     */
    @Override
    public String toString() {
        return text;
    }
}
