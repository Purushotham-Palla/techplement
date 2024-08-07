package com.quotes.model;


public class Quote {
    private String author;
    private String text;

    // Constructors
    public Quote() {}

    public Quote(String author, String text) {
        this.author = author;
        this.text = text;
    }

    // Getters and Setters
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
